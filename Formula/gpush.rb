class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/brew-gpush"
  url "https://github.com/ThomasDanilo96/brew-gpush/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b2dec87bcf88a63a07f845cd3f6de38c6e5a294f47f932717679c067d752be59"
  version "1.0.0"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end