require 'open-uri'
require_relative 'lib/github-release'

class GoConfigYourself < Formula
  desc 'Want to store secrets in your repo? go config yourself!'
  homepage 'https://github.com/blinkhealth/go-config-yourself'
  stable do
    url 'https://github.com/blinkhealth/go-config-yourself/releases/download/v1.0.2/gcy-macos-amd64.tgz'
    sha256 '3ed8bcd803c384a588193306541b523bd2df3db711a46e451ea7a23e8d5a1aa2'
    version '1.0.2'
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
