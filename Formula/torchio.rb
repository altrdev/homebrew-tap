class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.5.0/torchio-macos-arm64"
      sha256 "067b31aa1db03295147fca6cd833ae80cf438ffcc737b46847899b815bb7054f"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.5.0/torchio-macos-amd64"
      sha256 "ca04779261d0c6ce64964b9f35a8ca2f4f5dd5c460bbfce009f0599d071686f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.5.0/torchio-linux-arm64"
      sha256 "4f69fda3feb52a99e65fce91b132f92e5665c3b66c89a969c849980553a1d441"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.5.0/torchio-linux-amd64"
      sha256 "6c51104e88aa9409574af9379aa2fda7644fec2a43866ac422363f2d7cec23a6"
    end
  end

  def install
    binary = Dir["torchio-*"].first
    # the download is not executable yet: Homebrew only makes it so after install, and the
    # completions need to run it now
    chmod 0755, binary
    bin.install binary => "torchio"
    generate_completions_from_executable(bin/"torchio", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match "Usage: torchio", shell_output("#{bin}/torchio help")
  end
end
