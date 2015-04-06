require 'spec_helper'

module Txtblx
  describe TextblocksHelper do
    describe '.txt' do
      it 'returns text_html from a textblock by key' do
        create(:txtblx_textblock, :published, key: 'homepage.welcome', text_html: 'Welcome to Dummy App')

        result = helper.txt('homepage.welcome')

        expect(result).to include('Welcome to Dummy App')
      end

      it 'returns an error message with the key if key is not found' do
        result = helper.txt('homepage.welcome')

        puts result

        expect(result).to include(I18n.t('txtblx.missing_key', key: 'homepage.welcome'))
        expect(result).to include('homepage.welcome')
      end
    end
  end
end
