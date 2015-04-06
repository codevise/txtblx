class CreateTxtblxTextblocks < ActiveRecord::Migration
  def change
    create_table :txtblx_textblocks do |t|
      t.integer :perma_id
      t.string :key
      t.string :description
      t.text :text
      t.text :text_html
      t.string :path

      t.timestamps null: false
    end
  end
end
