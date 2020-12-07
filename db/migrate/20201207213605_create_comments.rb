class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :commenter
      t.text :body
      t.references :micropost, null: false, foreign_key: true
      t.timestamps
    end
  end
end
