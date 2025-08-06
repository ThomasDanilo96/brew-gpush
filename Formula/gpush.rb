class Gpush < Formula
  desc "Push your Git repo to multiple remotes and branches interactively"
  homepage "https://github.com/ThomasDanilo96/brew-gpush"
  url "https://github.com/ThomasDanilo96/homebrew-gpush/archive/refs/heads/master.tar.gz"
  sha256 "82dcae4bf6ba4645abff5ba1be6270f8fa8d03eaf0a6b50c940ff1677b6021a3"
  version "1.0.0"

  def install
    bin.install "gpush.sh" => "gpush"
  end
end