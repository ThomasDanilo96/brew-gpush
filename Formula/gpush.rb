class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/brew-gpush"
  url "https://github.com/ThomasDanilo96/homebrew-gpush/archive/refs/heads/master.tar.gz"
  sha256 "58f49b60d9c81bcad3820e3db7c36f7aeb793a03aa1f44cbf3e558e7cc202e9e"
  version "1.0.0"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end