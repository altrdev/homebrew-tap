class Torchio < Formula
  desc "Break your containers on purpose: burn CPU, hold memory, fill disk and more, on demand over HTTP"
  homepage "https://github.com/altrdev/torchio"
  version "4.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.0.0/torchio-macos-arm64"
      sha256 "8f7e3be258e4cce0ae32490bc99b032a66c7a04373c35f5c1801e8d8ae23145c"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.0.0/torchio-macos-amd64"
      sha256 "935e776ef5bef5606618f00a6d71a4cbcb56b082c103c9d762ddd4ae69bb4ea1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/altrdev/torchio/releases/download/v4.0.0/torchio-linux-arm64"
      sha256 "0b9daa6f41a612b74cf972df31884dcf3b7f3af184eca45755a76d29269f9360"
    end
    on_intel do
      url "https://github.com/altrdev/torchio/releases/download/v4.0.0/torchio-linux-amd64"
      sha256 "0e70a690b95d4a692b76393784d108d647abcb7a696d7d571dc0777e7e3fd742"
    end
  end

  def install
    bin.install Dir["torchio-*"].first => "torchio"
  end

  test do
    assert_match "Usage: torchio", shell_output("#{bin}/torchio help")
  end
end
