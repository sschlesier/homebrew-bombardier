class Bombardier < Formula
  desc "HTTP(S) benchmarking tool"
  homepage "https://github.com/codesenberg/bombardier"
  url "https://github.com/codesenberg/bombardier/archive/v1.2.5.tar.gz"
  sha256 "4efeac699d0c794ed22fe05b4de5c43fa41f98816682521421d538e076290ed6"
  license "MIT"

  bottle do
    root_url "https://github.com/sschlesier/homebrew-bombardier/releases/download/bombardier-1.2.5"
    sha256 cellar: :any_skip_relocation, catalina:     "b2f33a0ffbdf8ed7807dffa6849dd994c24385947ae4008fe9cc8a80b84e9769"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2d5583c3b01658bfcc0ce687b8b8e0f7ac8f3ddff8e6c17d2ef99460628a5d86"
  end

  depends_on "go" => :build

  def install
    system "go", "mod", "init"
    system "go", "mod", "vendor"
    system "go", "build", *std_go_args
  end

  # need something to PR to test bottling actions
  test do
    output = shell_output("#{bin}/bombardier -n 1 https://github.com/sschlesier/homebrew-bombardier")
    assert_match "2xx - 1", output
  end
end
