require 'titleize'

module Jekyll
  module Filters

    def entry_file(input)
      input.gsub(/_entries\//, '').gsub(/\.md/, '').gsub(/^\d{4}-\d{2}-\d{2}-/,'')
    end
    def entry_heading(input)
      entry_file(input).gsub(/-/," ").titleize
    end
    def first_letter(input)
      if entry_file(input)[0] != nil
        entry_file(input)[0].upcase
      end
    end
    def is_collection_item_current(input, doc)
      if input["slug"] == doc["slug"]
        "current"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Filters)
