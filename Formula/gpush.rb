class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/brew-gpush"
  url "https://github.com/ThomasDanilo96/homebrew-gpush/archive/d924897b2a246341138531641ef768da1781ab12.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  version "1.0.0"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end