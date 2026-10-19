class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.2/torchio-macos-arm64"
      sha256 "b84ac4f39eb56e80a696d2b68ffaae6a63fb1d399144b11cb3941ad7de873bbe"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.2/torchio-macos-amd64"
      sha256 "da9ae28efd192d73670153bf38db20a1126268c9d8bc2ebe7d79c0a4bd1d1bd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.2/torchio-linux-arm64"
      sha256 "cd3abbc56402a2e135a6a4da56969d2b1e3e225e23effd8315399387031418fa"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.2/torchio-linux-amd64"
      sha256 "0c72b2ad611282459b102f53b70ec35f6b15e4e54ba8c30b2b0c19c8cfdfa982"
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
