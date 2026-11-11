class Panopticon < Formula
  desc "Find every git repo on your machine and pull it"
  homepage "https://github.com/rossgrat/panopticon"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.2.0/panopticon_v0.2.0_darwin_arm64.tar.gz"
      sha256 "26243c63a43be1ea167fb10f74a1cbf16757ddbc0079390192e9bdff31bb41be"
    end
    on_intel do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.2.0/panopticon_v0.2.0_darwin_amd64.tar.gz"
      sha256 "201f06f26aaec340959c247107a4bc655eaf5bbde07a9ab2ec6bbbf7dc6a1faa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.2.0/panopticon_v0.2.0_linux_arm64.tar.gz"
      sha256 "49ec041feb3d575097b4db29cfbb098b57cee60fb2bc962fa2578081f8f13027"
    end
    on_intel do
      url "https://github.com/rossgrat/panopticon/releases/download/v0.2.0/panopticon_v0.2.0_linux_amd64.tar.gz"
      sha256 "0fd4a47c489462eb958cff6f4d77c3f6d5436282d779378c483a1fdddd86aa34"
    end
  end

  def install
    bin.install "panopticon"
  end

  test do
    assert_match "find every git repo", shell_output("#{bin}/panopticon --help 2>&1")
  end
end
