class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/brew-gpush"
  url "https://github.com/ThomasDanilo96/brew-gpush/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "35a4e754826596a7e6cbe320f4760f12eea88a5ecdc9a888564391dcdaf4e8cc"
  version "1.0.0"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end