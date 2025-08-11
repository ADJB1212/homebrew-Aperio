class Aperio < Formula
  desc "A blazing-fast, zero-dependency CLI for beautiful file statistics"
  homepage "https://github.com/ADJB1212/Aperio"
  url "https://github.com/ADJB1212/Aperio/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "96c98e45173208f4f7bf67b5ffdfaf416b80790630b90ce0c633eb0a18680683"
  license "GPL-3.0-or-later"
  head "https://github.com/ADJB1212/Aperio.git", branch: "main"
  version "0.0.1"

  depends_on "go" => :build

  def install
    Dir.chdir("cmd/aperio") do
        ENV["CGO_ENABLED"] = "0"
        system("go build -buildvcs=false -o=aperio -ldflags=\"-s -w -X main.version=0.0.1\"")
        bin.install "aperio"
    end

  end

  test do
      system "#{bin}/aperio", "--version"
  end
end
