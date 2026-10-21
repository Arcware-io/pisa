class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.12.0/pisa-darwin-arm64"
      sha256 "dd09a3e4f65264c6af4132833c7a8fef2bf6c12df1823c23521561d07fbdd0e9"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.12.0/pisa-darwin-x64"
      sha256 "c63663ad0d6c7968aec915900a49b2aab208de6836c179e40fc8aa3d6eb324cb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.12.0/pisa-linux-arm64"
      sha256 "e2cbc375d2e235b46a11b69700c09676901bf543dee4a731e52655ed4e7febb2"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.12.0/pisa-linux-x64"
      sha256 "49f4835ba2c759638af88fa0e357d7f452c42221a4b36b0651a96ccf0759ec31"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
