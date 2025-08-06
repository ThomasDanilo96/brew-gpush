class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/homebrew-gpush"
  url "https://raw.githubusercontent.com/ThomasDanilo96/homebrew-gpush/master/gpush.sh"
  version "1.0.0"
  sha256 "<DA_CALCOLARE>"
  license "MIT"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end