class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.18.0/pisa-darwin-arm64"
      sha256 "946ffc3758e7b3a17bc2acc6c38a17cd9123ffc2808383c9b277e127be5bd0c4"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.18.0/pisa-darwin-x64"
      sha256 "2f586b6c707c8c759e6a5b4cff972d22d768a7a44879305be621bd8387978dcb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.18.0/pisa-linux-arm64"
      sha256 "18ae996208465b2d83692cfba631aa5fbe915e21fc5180949ed67aa6a73e7c18"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.18.0/pisa-linux-x64"
      sha256 "3b09aa928f490e771097acc9b8c5e98ab17d568ea353924cde3c92e3befe0e37"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
