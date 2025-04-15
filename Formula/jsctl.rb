class Jsctl < Formula
  desc "CLI tool for Jetstack Secure"
  homepage "https://github.com/jetstack/jsctl"
  version "0.1.11"
  license "Apache-2.0"
  head "https://github.com/jetstack/jsctl.git", branch: "main"

  bottle do
    root_url "https://github.com/jetstack/homebrew-jetstack/releases/download/jsctl-0.1.11"
    sha256 cellar: :any_skip_relocation, monterey:     "1a740c2496b7352fbf50be3a922ab00bb9f06fb8d6371997c9e9bc22b4b20323"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "15cb802a3f4ea5f71247c273929b0847a9b4691da8ecc1da7a07797da0b4d681"
  end

  on_macos do
    on_arm do
      url "https://github.com/jetstack/jsctl/releases/download/v#{version}/jsctl-#{version}-darwin-arm64.tar.gz"
      sha256 "6e44bdaaabafb1cbe7047557dd50fcaa4eb0994a85cbcec07631f179601f1037"
    end
    on_intel do
      url "https://github.com/jetstack/jsctl/releases/download/v#{version}/jsctl-#{version}-darwin-x86_64.tar.gz"
      sha256 "98fd17c91ff7d2315ba3b7c999baed31d60e051d67950f3179b63e5630c903a4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/jetstack/jsctl/releases/download/v#{version}/jsctl-#{version}-linux-x86_64.tar.gz"
      sha256 "ad661c32fa5d5845d17fa5b0912d61b35b860d26eb8f6485378d842080aeb47b"
    end
  end

  def install
    # The tar we downloaded has the binary already in it just called jsctl
    bin.install "jsctl"
    # Use the binary to generate shell completions
    generate_completions_from_executable("#{bin}/jsctl", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jsctl version")
  end
end
