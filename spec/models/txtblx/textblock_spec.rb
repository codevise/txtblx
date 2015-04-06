require 'spec_helper'

module Txtblx
  RSpec.describe Textblock, type: :model do
    describe 'text_html' do
      it 'is automatically generated from html' do
        textblock = Textblock.create(key: 'some key', text: 'some text')

        expect(textblock.text_html).to be_present
      end

      it 'urls are replaced with links' do
        textblock = Textblock.create(key: 'some key', text: 'some text inlcuding http://example.com')

        expect(textblock.text_html).to include('<a href="http://example.com"')
      end
    end
  end
end
