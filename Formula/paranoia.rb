class Paranoia < Formula
  desc "Inspect certificate authorites in contianer images"
  homepage "https://github.com/jetstack/paranoia"
  url "https://github.com/jetstack/paranoia/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "19783029ddccfa5666e202156a7f2aa5014c952e42ecf5707838919fbbdb1c82"
  license "Apache-2.0"
  head "https://github.com/jetstack/paranoia.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    # Generate and then install man pages
    system "go", "run", "./hack/generate-manual"
    man1.install Pathname.glob("man/*.1")
    # Use the binary to generate shell completions
    generate_completions_from_executable(bin/"paranoia", "completion")
  end

  test do
    # This string is the SHA256 of the "ISRG X1 Root" certificate. This test verifies that
    # paranoia can find that certificate in a known image (cert-manager v1.9.1).
    assert_match "96bcec06264976f37460779acf28c5a7cfe8a3c0aae11a8ffcee05c0bddf08c6",
      shell_output("paranoia export --output wide quay.io/jetstack/cert-manager-controller:v1.9.1")
  end
end
