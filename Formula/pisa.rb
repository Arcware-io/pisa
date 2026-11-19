class Pisa < Formula
  desc "Generates a running Spring Boot or Hono project from spec files"
  homepage "https://github.com/Arcware-io/pisa"
  version "0.17.0"

  on_macos do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.17.0/pisa-darwin-arm64"
      sha256 "44bf1defa9ebd73830b345f1efebff7905e29e72da1f199c79fa746fcb7ef551"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.17.0/pisa-darwin-x64"
      sha256 "b1436255509426a5f9c75863ae4d3e893647c0eaecce865f22decb9f128b9cd2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.17.0/pisa-linux-arm64"
      sha256 "970ed359a703d609514e0e2610862a74ad2062fdbfea454f48f2a22b8cfb00db"
    end
    on_intel do
      url "https://github.com/Arcware-io/pisa/releases/download/v0.17.0/pisa-linux-x64"
      sha256 "3e48374c85b44a7c67df2434dd21ead8c3145fa515b96e5f2897c92d15d9b0fa"
    end
  end

  def install
    bin.install Dir["pisa-*"].first => "pisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pisa --version")
  end
end
