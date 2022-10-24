class Paranoia < Formula
  desc "Inspect certificate authorites in contianer images"
  homepage "https://github.com/jetstack/paranoia"
  version "0.2.0"
  url "https://github.com/jetstack/paranoia/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c627437fc2ca74fb2e162501b8d44fff7de60f16788de7d19355cd621b8e6203"
  license "Apache-2.0"
  head "https://github.com/jetstack/paranoia", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "false"
  end
end
