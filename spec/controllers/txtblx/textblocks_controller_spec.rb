require 'spec_helper'

module Txtblx
  RSpec.describe TextblocksController, type: :controller do
    before :each do
      @textblock = Textblock.create(key: 'test')
      @textblock.publish
    end

    describe '#update' do
      it 'updates text and text_html' do

        user = create(:user)
        sign_in(user)

        put(:update, id: @textblock, use_route: 'textblock', textblock: { text: 'Some Text' })

        txt = Textblock.published.find_by_perma_id(@textblock.perma_id)
        expect(txt.text).to eq('Some Text')
        expect(txt.text_html).to include('Some Text')
      end
    end
  end
end
