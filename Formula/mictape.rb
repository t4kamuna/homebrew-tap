class Mictape < Formula
  desc "Record the microphone to .m4a files from the command line"
  homepage "https://github.com/t4kamuna/mictape"
  url "https://github.com/t4kamuna/mictape/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4d75951de03fd42d56c0757c96f16e38618681b3dfdda83214686303bd928fd7"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/mictape"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/mictape --version").strip
  end
end
