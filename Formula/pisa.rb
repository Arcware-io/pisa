class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.13.0/pisa-darwin-arm64"
      sha256 "205f3ddc4cbd669e34e8ce7664e616f48ade90a7efda166e3e3b81c82b16f8b0"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.13.0/pisa-darwin-x64"
      sha256 "8297a23edca017646d6c801d619502a577843017e1b040c644c9d4567ef6f6d9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.13.0/pisa-linux-arm64"
      sha256 "b169a6ce8c79330456c17d5f3bd3c5186ec31e8a1f17002201515179785febd0"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.13.0/pisa-linux-x64"
      sha256 "410651f787ea45702ae6eb8a9e26fbf5fa6c760307d886a2a72ce78a0be6d29a"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
