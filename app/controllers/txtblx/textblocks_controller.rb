module Txtblx
  class TextblocksController < Txtblx::ApplicationController
     def update
       @textblock = Textblock.drafts.where(perma_id: params[:id]).first!
       authorize!(:update, @textblock)
       @textblock.text = params[:textblock][:text]
       @textblock.save
       @textblock.publish
       render json: @textblock
     end
  end
end
