
require 'atig/basic_twitter'

class Atig::BasicTwitter
  alias original_api api
  private :original_api
  def api(path, query={}, opts={})
    query.update :include_entities => "true"
    original_api(path, query, opts)
  end
end
