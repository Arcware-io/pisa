class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.14.2"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.2/pisa-darwin-arm64"
      sha256 "9eb5cc61ae1556aafe2aaee7b70218755f50bf2f737720d530d396c096845749"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.2/pisa-darwin-x64"
      sha256 "3865c42ba24fbde52949044d43a2d1c541e8490bcd6c1edeb13aed3fcd85635d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.2/pisa-linux-arm64"
      sha256 "599ea3526ae637f43fa2ec7254d9436170f634b81d7b7bd01ce1c7b8aa02ddfc"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.14.2/pisa-linux-x64"
      sha256 "cdd0356ad5d0e9046576a1efb4fcf7583346b98cf3c3af367fccfda7cf592554"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
