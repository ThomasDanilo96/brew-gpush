class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/brew-gpush"
  url "https://github.com/ThomasDanilo96/homebrew-gpush/archive/refs/heads/master.tar.gz"
  sha256 "da5f997bdd8defacc1a78a724ff296f071d3c2f134d43e0e502cb6853d795ec2"
  version "1.0.0"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end