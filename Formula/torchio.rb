class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.0/torchio-macos-arm64"
      sha256 "a0350398d6fd42bbbdfaf2b532831af8b11f4f1660ab969f1df603bd431a868a"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.0/torchio-macos-amd64"
      sha256 "99c4a87ff8a6422fa13e1377066a26293e8b8fde4c455c982aa9a612193e83fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.0/torchio-linux-arm64"
      sha256 "82ff0ce1edf3f617cea4c556e1a92341837589f238edf9345417ad5d1d35f6c4"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.0/torchio-linux-amd64"
      sha256 "5ddc5ed42f4875cc94aeb94d6bf75935be31ede4a88a3deb9ae09c2b38639d87"
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
