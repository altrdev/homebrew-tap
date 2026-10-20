class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.2/torchio-macos-arm64"
      sha256 "e90f3da8f25eda537ff2ed37665bea5b993a4227a1ae0cff6f982eeee081a0fd"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.2/torchio-macos-amd64"
      sha256 "4b68269827e858453bfaa9189cb09aa484f5ae5c32c42a8cd0989e62d237538b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.2/torchio-linux-arm64"
      sha256 "e42b540b77fd0977f9d2902d45058c75ddbbd92cffda756e7a55f57cb5d6be31"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.2/torchio-linux-amd64"
      sha256 "64f1d27f3fa939eb6f64eb0f411d4693ba6a1deabdf25b590ecfc93df83ab24d"
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
