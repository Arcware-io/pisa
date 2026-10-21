class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.11.0/pisa-darwin-arm64"
      sha256 "d9f2b732dc40dc03b0bc0ce3e2b3771bc85578438b140a7cb62ebd3eaec219e8"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.11.0/pisa-darwin-x64"
      sha256 "a16f20127f3c47bf6f21237f95a1b8653eed11c6a8aba7bbb8ce25ef7761dfdb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.11.0/pisa-linux-arm64"
      sha256 "a16b81d298564863b4b03383d5227babcbdc0dae0acea9fbd7f31c9977e3009c"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.11.0/pisa-linux-x64"
      sha256 "2ec015e6234b696a3c2daec53b314b97eea8bb8759f8c105152cbb89d645b8dd"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
