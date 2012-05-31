
module Atig
  module Agent
  end

  module IFilter
    autoload :ExpandUrlUsingTwitterApi, 'atig/ifilter/expand_url_using_twitter_api'
    autoload :ExpandUrlForMedia, 'atig/ifilter/expand_url_for_media'
    autoload :Via, 'atig/ifilter/via'
  end

  module OFilter
  end

  module Command
    autoload :CopyAndPaste, 'atig/command/copy_and_paste'
    autoload :Permalink, 'atig/command/permalink'
    autoload :Profile, 'atig/command/profile'
    autoload :CopyProfile, 'atig/command/copy_profile'
  end

  module Channel
  end
end
