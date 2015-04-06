module Txtblx
  module TextblocksHelper
    def txt(key)
      content_tag(:div, Textblock.by_key(key).text_html)
    end
  end
end
