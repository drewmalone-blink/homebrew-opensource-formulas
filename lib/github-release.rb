class GithubPreReleaseDownloadStrategy < CurlDownloadStrategy
  def fetch
    @url = getFromApi('releases')
      .find { |r| r['prerelease'] == true }
      .fetch('assets')
      .find { |a| a['name'].include? 'macos' }
      .fetch('url')
    super
  end

  def _curl_args
    super + ['--remote-header-name', '-H', 'Accept: application/octet-stream']
  end

  private
  def getFromApi(path)
    repo = url.split('/').last(2).join('/')
    base = "https://api.github.com/repos/#{repo}"
    JSON.parse(open("#{base}/#{path}").read)
  end
end