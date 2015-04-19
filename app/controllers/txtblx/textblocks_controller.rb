module Txtblx
  class TextblocksController < Txtblx::ApplicationController
     def update
       @textblock = Textblock.drafts.where(perma_id: params[:id]).first!
       @textblock.text = params[:textblock][:text]
       @textblock.save
       @textblock.publish
       render json: @textblock
     end
  end
end
