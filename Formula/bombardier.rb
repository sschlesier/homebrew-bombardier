class Bombardier < Formula
  desc "HTTP(S) benchmarking tool"
  homepage "https://github.com/codesenberg/bombardier"
  url "https://github.com/codesenberg/bombardier/archive/v1.2.5.tar.gz"
  sha256 "4efeac699d0c794ed22fe05b4de5c43fa41f98816682521421d538e076290ed6"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "mod", "init"
    system "go", "mod", "vendor"
    system "go", "build", *std_go_args
  end

  test do
    system "true"
  end
end
