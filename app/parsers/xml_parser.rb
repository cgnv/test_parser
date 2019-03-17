# frozen_string_literal: true

# Basic class for all xml parsers
class XmlParser
  def initialize(*sources)
    @xml = sources.map { |source| Nokogiri::XML(source) }
  end

  def parse
    raise NotImplementedError
  end

  def attributes
    raise NotImplementedError
  end

  def save
    raise NotImplementedError
  end

  def create
    parse
    save
  end

  protected

  def extract_attr(file_n, common_path, params)
    params.each_with_object({}) do |p, h|
      h[p[0]] = @xml[file_n].xpath(path("#{common_path}/#{p[1]}")).text
    end
  end

  def extract_collection_attr(file_n, collection_path, common_path, params)
    @xml[file_n].xpath(path(collection_path)).each_with_object([]) do |x, arr|
      arr << params.each_with_object({}) do |p, h|
        h[p[0]] = x.xpath(path("#{common_path}/#{p[1]}")).text
      end
    end
  end

  private

  def path(str)
    str.scan(%r{[^/]+}).map do |node|
      node.include?(':') ? node : node.prepend('xmlns:')
    end.join('/')
  end
end
