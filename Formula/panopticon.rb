class Panopticon < Formula
  desc "Find every git repo on your machine and pull it"
  homepage "https://github.com/rossgrat/panopticon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.0.0/panopticon_v0.0.0_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.0.0/panopticon_v0.0.0_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.0.0/panopticon_v0.0.0_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.0.0/panopticon_v0.0.0_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  depends_on "git"

  def install
    bin.install "panopticon"
  end

  test do
    assert_match "find every git repo", shell_output("#{bin}/panopticon --help")
  end
end
