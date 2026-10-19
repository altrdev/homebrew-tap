class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.0/torchio-macos-arm64"
      sha256 "149772bf336beb46a48b4598918595a2bcac2b75da9f21b027045377fcd35472"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.0/torchio-macos-amd64"
      sha256 "c29cf53b13aee2b3489ed3780ed7494ea6a8a30c4a1d3c9428410845c4d296cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.0/torchio-linux-arm64"
      sha256 "6bdb6e6099a83db1b1264914801884a6585701be21d575218b808eee9ef749ff"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.0/torchio-linux-amd64"
      sha256 "70ffc7f2f2c4cf082ab501cb62ce0e74fe9783977fd98902fc942598eaf65435"
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
