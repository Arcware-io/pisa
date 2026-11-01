class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.14.1"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.1/pisa-darwin-arm64"
      sha256 "160564e4fc76d7fd83d21e2e9d2c12f8d67ed86412af1aea382ca5755bc41205"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.1/pisa-darwin-x64"
      sha256 "01ba3b7bbf0fc8cf92185e7ed42db897b665c8a2346dc5de6ad2cc531bbfffb0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.1/pisa-linux-arm64"
      sha256 "e2e72b9ad64c56277c9bcdc344846b8649856232744ef0741a70117d8533cf7e"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.1/pisa-linux-x64"
      sha256 "62a51ca5ba5027c2fc14f3dab064effaaeb5ed32e5d6bc8d72314f7f2d81fda0"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
