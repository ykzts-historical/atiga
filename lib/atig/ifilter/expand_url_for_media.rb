
require 'atig/ifilter/expand_url_using_twitter_api'

class Atig::IFilter::ExpandUrlForMedia <  Atig::IFilter::ExpandUrlUsingTwitterApi
  def entity_name
    "media"
  end

  def expanded_url
    "media_url_https"
  end
end
