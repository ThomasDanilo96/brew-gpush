class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/brew-gpush"
  url "https://github.com/ThomasDanilo96/brew-gpush/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "<SHA256_PLACEHOLDER>"
  version "1.0.0"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end