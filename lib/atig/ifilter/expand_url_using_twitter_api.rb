
class Atig::IFilter::ExpandUrlUsingTwitterApi
  def initialize(context)
    @log = context.log
    @opts = context.opts
  end

  def call(status)
    text = status.text
    entities = status.entities
    if entities and entity = entities[entity_name]
      entity.each do |e|
        text.gsub!(e.url, e[expanded_url])
      end
    end
    status.merge :text => text
  end

  def entity_name
    "urls"
  end

  def expanded_url
    "expanded_url"
  end
end
