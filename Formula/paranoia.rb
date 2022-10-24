class Paranoia < Formula
  desc "Inspect certificate authorites in contianer images"
  homepage "https://github.com/jetstack/paranoia"
  url "https://github.com/jetstack/paranoia/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c627437fc2ca74fb2e162501b8d44fff7de60f16788de7d19355cd621b8e6203"
  license "Apache-2.0"
  head "https://github.com/jetstack/paranoia", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    # This string is the SHA256 of the "ISRG X1 Root" certificate
    assert_match "96bcec06264976f37460779acf28c5a7cfe8a3c0aae11a8ffcee05c0bddf08c6",
      shell_output("paranoia export --output wide quay.io/jetstack/cert-manager-controller:v1.9.1")
  end
end
