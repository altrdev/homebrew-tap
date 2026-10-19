class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.1/torchio-macos-arm64"
      sha256 "5fcc7e645b9e87c78d6385b4913b328239a32ad444b90f70798331dcba8d7e87"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.1/torchio-macos-amd64"
      sha256 "cf6d3a5b7bcab0c6f714a67cee54dfd9cbabad0e274ac495aefb80d17d2b1317"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.1/torchio-linux-arm64"
      sha256 "d8d124420481eb7fe8ef9acaa8fd23ab2662b2f4ce70f96eb4b0dbd00c893b46"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.6.1/torchio-linux-amd64"
      sha256 "383687a8bbf335e1ee698a10291cf4c6d064c771551c5609c52e1e0b1f49f5f8"
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
