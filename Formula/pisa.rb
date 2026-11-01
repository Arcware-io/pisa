class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.0/pisa-darwin-arm64"
      sha256 "36f191a83af9769cb428700d68d6eb920f8e543874f2ba1a56f89b76135a143a"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.0/pisa-darwin-x64"
      sha256 "81d170f525293ae0e2dfe5fbec3ab915cdb24602fb46ad784690fe77fc59ce16"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.0/pisa-linux-arm64"
      sha256 "7a31f7f57b8345db3938211452888be1e7982000c2cdc6ad9e11e2ade8648ce6"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.0/pisa-linux-x64"
      sha256 "5751b792df998cdc6ee7815a75a79fab0b72d0807a252809f68132252ea6e0db"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
