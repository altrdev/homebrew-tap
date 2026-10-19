class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.2.0/torchio-macos-arm64"
      sha256 "26d39acbde364688f7715a968cd712ee030a75225570f527798fe1640720b92e"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.2.0/torchio-macos-amd64"
      sha256 "e2114fdd950c366253674269173f5b084c50a2981f4e826be16f3659fa1d7000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.2.0/torchio-linux-arm64"
      sha256 "23e32e64d55a8a4159b885671377f95d8c06ae7bb9799fdcf74873530a958591"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.2.0/torchio-linux-amd64"
      sha256 "735adb84486f5a3eee5e7649ad431145f1bf13c150f354c7292f250f252be9ba"
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
