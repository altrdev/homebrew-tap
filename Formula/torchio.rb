class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.4.0/torchio-macos-arm64"
      sha256 "d00060d754b5f6cdef1cf96c2b104d4d98606bd9d7aa3e671efe039c6d679013"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.4.0/torchio-macos-amd64"
      sha256 "c05f8112e710caf57bf8ce3c04f61a1ce251929dbc9f72951f84b69a58f4fd90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.4.0/torchio-linux-arm64"
      sha256 "2f734fa134eeb636803149a26f55533976ce7a8c4cab342f0840e77d1808e6ba"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.4.0/torchio-linux-amd64"
      sha256 "c79dfadecea18c1f78cd94c85879cf412643c2b1b08dba5de65d4730d3ac5a89"
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
