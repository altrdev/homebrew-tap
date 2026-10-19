class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.3.0/torchio-macos-arm64"
      sha256 "9d9ddd8783c83dfcf6203eedb433c03bf8405bba219bcadd97a51f802506b9de"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.3.0/torchio-macos-amd64"
      sha256 "0224834ff0f6fd2164e5242446f02b2ed82fdc2a2678b6ba924fd1b64035e8e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.3.0/torchio-linux-arm64"
      sha256 "5010db77c8a9b0360dcfc0b6f1f5b34e61b363dfd994b14c46249844090a4232"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.3.0/torchio-linux-amd64"
      sha256 "41504bda719fea8437e4d1a27081c8420213913d19cc67bf53df33df39b3176f"
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
