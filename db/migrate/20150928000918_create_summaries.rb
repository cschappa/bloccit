class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :body
      t.references :post # adds post ID + index to summaries table

      t.timestamps null: false
    end
  end
end
