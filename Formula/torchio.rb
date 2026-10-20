class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.2/torchio-macos-arm64"
      sha256 "f2b7895d301667fe2c20df1d9f06736ee615fc3f1a72598d8f14306cd10676f2"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.2/torchio-macos-amd64"
      sha256 "d8416ae77805336b5a2f24976b1d89648ffa82b04f57c536fba76cd3e84a84e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.2/torchio-linux-arm64"
      sha256 "a79d67b3021ff04ada6d00d89b4cf6c787bd4b711486e5105ed2c967c3deaaa8"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.2/torchio-linux-amd64"
      sha256 "d29126ec8aff327813b4e2ebe3a79c352cfa0c125de93aec7eaee8fb4b1504c6"
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
