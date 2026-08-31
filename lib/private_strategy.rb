# frozen_string_literal: true

require "download_strategy"

# Downloads release assets of a PRIVATE GitHub repository through the API,
# authenticating with HOMEBREW_GITHUB_API_TOKEN. The plain asset URL that a
# public formula uses answers 404 without credentials; the API serves the
# same bytes to anyone the repository trusts.
#
# Referenced by generated formulas via GoReleaser's `download_strategy` +
# `custom_require` settings.
class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    match = url.match(%r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)})
    raise CurlDownloadStrategyError, "Invalid url pattern for GitHub Release." unless match

    _, @owner, @repo, @tag, @filename = *match
    @github_token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)
    raise CurlDownloadStrategyError, "Set HOMEBREW_GITHUB_API_TOKEN (a PAT that can read #{@owner}/#{@repo})." if @github_token.to_s.empty?
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    curl_download "https://api.github.com/repos/#{@owner}/#{@repo}/releases/assets/#{asset_id}",
                  "--header", "Accept: application/octet-stream",
                  "--header", "Authorization: Bearer #{@github_token}",
                  to: temporary_path, timeout: timeout
  end

  def asset_id
    @asset_id ||= begin
      release = GitHub::API.open_rest("https://api.github.com/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}")
      asset = release["assets"].find { |candidate| candidate["name"] == @filename }
      raise CurlDownloadStrategyError, "Asset #{@filename} not found in #{@tag}." unless asset

      asset["id"]
    end
  end
end
