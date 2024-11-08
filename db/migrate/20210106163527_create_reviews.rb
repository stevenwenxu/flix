class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :stars
      t.text :comment
      t.references :movie, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
