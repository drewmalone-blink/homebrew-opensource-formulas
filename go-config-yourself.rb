require 'open-uri'
require_relative 'lib/github-release'

class GoConfigYourself < Formula
  desc 'Want to store secrets in your repo? go config yourself!'
  homepage 'https://github.com/blinkhealth/go-config-yourself'
  stable do
    url 'https://github.com/blinkhealth/go-config-yourself/releases/download/v1.0.3/gcy-macos-amd64.tgz'
    sha256 '5fa6e368c9a95e32f904d0e458d85e323e8175b77429e08358e95cb6dd8dd05b'
    version '1.0.3'
  end
  head 'https://github.com/blinkhealth/go-config-yourself', using: GithubPreReleaseDownloadStrategy

  def install
    bin.install 'gcy'
    
    zsh_completion.install 'autocomplete/completion.zsh' => '_gcy'
    bash_completion.install 'autocomplete/completion.bash' => 'gcy-completion.bash'
    
    man1.install Dir['man/*.1']
    man5.install Dir['man/*.5']
  end

  test do
    system "#{bin}/gcy" '-h'
  end
end
