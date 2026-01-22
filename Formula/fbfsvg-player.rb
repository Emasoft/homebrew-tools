# Homebrew formula for fbfsvg-player
# FBF.SVG vector video player using Skia with Graphite GPU backend

class FbfsvgPlayer < Formula
  desc "High-performance animated SVG player for the FBF.SVG vector video format"
  homepage "https://github.com/Emasoft/fbfsvg-player"
  url "https://github.com/Emasoft/fbfsvg-player/releases/download/v0.1.0/fbfsvg-player-0.1.0-macos-arm64.tar.gz"
  sha256 "ba5e33cc53625bb8eb0bca556677ecf1250da9f98a131e1241968ba9beadf26b"
  license "BSD-3-Clause"
  version "0.1.0"

  # Only supports Apple Silicon (arm64)
  depends_on arch: :arm64

  def install
    bin.install "fbfsvg-player"
  end

  def caveats
    <<~EOS
      fbfsvg-player uses Graphite GPU (Metal) rendering by default.

      To use CPU rendering instead:
        fbfsvg-player animation.fbf.svg --cpu

      For more information about the FBF.SVG format:
        https://github.com/Emasoft/svg2fbf

      Keyboard controls:
        Space      - Play/Pause
        F          - Toggle fullscreen
        Left/Right - Seek backward/forward
        Q/Escape   - Quit
    EOS
  end

  test do
    # Test that the binary runs and shows help
    assert_match "FBF.SVG Player", shell_output("#{bin}/fbfsvg-player --help 2>&1", 1)
  end
end
