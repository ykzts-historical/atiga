
module Atig
  module IFilter
    module Via
      def self.call(status)
        return status unless status.source
        source = status.source.gsub(/<[^>]+>/, '')
        status.merge :text => "#{status.text} via #{source}"
      end
    end
  end
end
