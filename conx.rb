# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Conx < Formula
  desc ""
  homepage "https://github.com/nimbox/canexer-connector"
  version "2.0.4"

  on_macos do
    url "https://github.com/nimbox/conx/releases/download/v2.0.4/conx_2.0.4_darwin_all.tar.gz"
    sha256 "147eeef43f9cb2b4482d1d6655e122b60df184d980f316c8f384201469b40faa"

    def install
      bin.install "conx"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nimbox/conx/releases/download/v2.0.4/conx_2.0.4_linux_arm64.tar.gz"
      sha256 "1223a5f9374640028c931b0df0f70e49beb0e59b3d6e6b12d37c71d5ebf1d20d"

      def install
        bin.install "conx"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/nimbox/conx/releases/download/v2.0.4/conx_2.0.4_linux_amd64.tar.gz"
      sha256 "a29a1c85a10a33328d45f20f1ec3309b70a924eb09415204377d02cbfc7399ed"

      def install
        bin.install "conx"
      end
    end
  end
end
