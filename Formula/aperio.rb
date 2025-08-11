class Aperio < Formula
  desc "A blazing-fast, zero-dependency CLI for beautiful file statistics"
  homepage "https://github.com/ADJB1212/Aperio"
  url "https://github.com/ADJB1212/Aperio/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "b8cab0c721fcddb22062215a17120722da39bb92ea66383ca2ad5be4817a9862"
  license "GPL-3.0-or-later"
  head "https://github.com/ADJB1212/Aperio.git", branch: "main"
  version "0.0.2"

  depends_on "go" => :build

  def install
    Dir.chdir("cmd/aperio") do
        ENV["CGO_ENABLED"] = "0"
        system("go build -buildvcs=false -o=aperio -ldflags=\"-s -w -X main.version=0.0.2\"")
        bin.install "aperio"
    end

  end

  test do
      system "#{bin}/aperio", "--version"
  end
end
