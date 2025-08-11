class Aperio < Formula
  desc "A blazing-fast, zero-dependency CLI for beautiful file statistics"
  homepage "https://github.com/ADJB1212/Aperio"
  url "https://github.com/ADJB1212/Aperio/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "aec244df4242a1bb97e265622c660d169a5a696246e4bdca97e5774ff4dd8504"
  license "GPL-3.0-or-later"
  head "https://github.com/ADJB1212/Aperio.git", branch: "main"
  version "0.0.3"

  depends_on "go" => :build

  def install
    Dir.chdir("cmd/aperio") do
        ENV["CGO_ENABLED"] = "0"
        system("go build -buildvcs=false -o=aperio -ldflags=\"-s -w -X main.version=0.0.3\"")
        bin.install "aperio"
    end

  end

  test do
      system "#{bin}/aperio", "--version"
  end
end
