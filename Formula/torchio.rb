class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.1/torchio-macos-arm64"
      sha256 "956adbe0d6fcfda61abec1bb2b81519956aaaca1e360fea2b0edac575b2175e7"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.1/torchio-macos-amd64"
      sha256 "d20ff3b7510656779d468ed78b29dda12f9664a741b7f2af08862befd661239c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.1/torchio-linux-arm64"
      sha256 "27f11e95870bdbef1ac0ea9552c8f75503d82511694c1905309ef63e8c685057"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.1.1/torchio-linux-amd64"
      sha256 "6f976d8d19aad1351e5b0e094b331bd28b6016d0b544af4ab595d24699b7130c"
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
