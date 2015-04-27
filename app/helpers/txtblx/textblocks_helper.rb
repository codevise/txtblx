module Txtblx
  module TextblocksHelper
    def txt(key)
      textblock = Textblock.by_key(key)

      if textblock.present?
        render_to_str('textblocks/textblock', textblock: textblock)
      else
        I18n.t('txtblx.missing_key', key: key)
      end
    end

    def edit_form(textblock)
      capture do
      end
    end

    def render_to_str(partial, params)
      params[:layout] = nil
      render(partial, params).to_s
    end
  end
end
