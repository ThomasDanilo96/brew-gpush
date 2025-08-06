class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/homebrew-gpush"
  url "https://raw.githubusercontent.com/ThomasDanilo96/homebrew-gpush/master/gpush.sh"
  version "1.0.0"
  sha256 "e57477184fa0b13d099c5f055e3d4300dd0e3d947932a4289dcc3187921ec470"
  license "MIT"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end