module Txtblx
  module TextblocksHelper
    def txt(key)
      textblock = Textblock.by_key(key)
      if textblock.present?
         text = textblock.text_html
      else
         text =  I18n.t('txtblx.missing_key', key: key)
      end

      content_tag(:div, raw(text))
    end
  end
end
