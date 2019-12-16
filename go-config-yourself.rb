require 'open-uri'
require_relative 'lib/github-release'

class GoConfigYourself < Formula
  desc 'Want to store secrets in your repo? go config yourself!'
  homepage 'https://github.com/blinkhealth/go-config-yourself'
  url 'https://github.com/blinkhealth/go-config-yourself/releases/download/v1.0.1/gcy-macos-amd64.tgz'
  sha256 'dcd98a6852d24ef7010bf3d5496ab06f8c0c78b9cff7974b72e624d65aec468f'
  version '1.0.1'
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
