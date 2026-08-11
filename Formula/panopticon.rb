class Panopticon < Formula
  desc "Find every git repo on your machine and pull it"
  homepage "https://github.com/rossgrat/panopticon"
  license "MIT"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.1.0/panopticon_v0.1.0_darwin_arm64.tar.gz"
      sha256 "2c56d8e09a4d49cd336ecfac555e674888d6b51e2114d28d64406df7f947204f"
    end
    on_intel do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.1.0/panopticon_v0.1.0_darwin_amd64.tar.gz"
      sha256 "1396c2ef4f093b0f531233620dc4b77759b77664a3b9ee696d34b0bf510ea65d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.1.0/panopticon_v0.1.0_linux_arm64.tar.gz"
      sha256 "04c106badb763b4a0f1530ea1dd11271b269f018e6d9cdd84197829f7a33de90"
    end
    on_intel do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.1.0/panopticon_v0.1.0_linux_amd64.tar.gz"
      sha256 "287185287dfe80ff46c4adbd44e7afb8202c6eb34e2968af0b5da14e6bf9584b"
    end
  end

  def install
    bin.install "panopticon"
  end

  test do
    assert_match "find every git repo", shell_output("#{bin}/panopticon --help 2>&1")
  end
end
