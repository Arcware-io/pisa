class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.16.0"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.16.0/pisa-darwin-arm64"
      sha256 "e51266d5c1ed1bfce13e5bf308a70f173a321dc07270bbc7b212ad92207a1daa"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.16.0/pisa-darwin-x64"
      sha256 "c141d770dfa97baf9bf9252ddd5a537c7746b0920990a00e145f6b93bbdeca9b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.16.0/pisa-linux-arm64"
      sha256 "bbf5fd2ac4abb03c8392c06a87efe049b4c08a3994d032d0690c1a1779697ce3"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.16.0/pisa-linux-x64"
      sha256 "b925f768987f3063a6b323e95f148c2ffafdcd89d4591284dc8b383c59b6a30c"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
