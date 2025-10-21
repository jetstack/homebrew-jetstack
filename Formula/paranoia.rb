class Paranoia < Formula
  desc "Inspect certificate authorites in contianer images"
  homepage "https://github.com/jetstack/paranoia"
  url "https://github.com/jetstack/paranoia/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "44d894d9aa0763a1215a63385afc099676f3fbca5a975000d6a7f80a79279bf6"
  license "Apache-2.0"
  head "https://github.com/jetstack/paranoia.git", branch: "main"

  bottle do
    root_url "https://github.com/jetstack/homebrew-jetstack/releases/download/paranoia-0.5.0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ba054a63b50606fca024df5f5f4fb67909022649befd89f3d9d17fd70bc7e15"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    # Generate and then install man pages
    system "go", "run", "./hack/generate-manual"
    man1.install Pathname.glob("man/*.1")
    # Use the binary to generate shell completions
    generate_completions_from_executable("#{bin}/paranoia", "completion")
  end

  test do
    # This string is the SHA256 of the "ISRG X1 Root" certificate. This test verifies that
    # paranoia can find that certificate in a known image (cert-manager v1.9.1).
    assert_match "96bcec06264976f37460779acf28c5a7cfe8a3c0aae11a8ffcee05c0bddf08c6",
      shell_output("#{bin}/paranoia export --output wide quay.io/jetstack/cert-manager-controller:v1.9.1")
  end
end
