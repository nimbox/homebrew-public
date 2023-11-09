# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Conx < Formula
  desc ""
  homepage "https://github.com/nimbox/canexer-connector"
  version "1.0.11"

  on_macos do
    url "https://github.com/nimbox/conx/releases/download/v1.0.11/conx_1.0.11_darwin_all.tar.gz"
    sha256 "fb95dbd24410c66314ec8e6a7fa0993e49c39c3667365efc4cfc2108eb1b8400"

    def install
      bin.install "conx"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/nimbox/conx/releases/download/v1.0.11/conx_1.0.11_linux_amd64.tar.gz"
      sha256 "8dade64678be2d91672e829b9e54977e4c9979f3841188e4d2459de677e6e19f"

      def install
        bin.install "conx"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nimbox/conx/releases/download/v1.0.11/conx_1.0.11_linux_arm64.tar.gz"
      sha256 "ddad37f53a1d721187a47c8e25da373dbc7123628be8fb18d11da341d7cb6f76"

      def install
        bin.install "conx"
      end
    end
  end
end
