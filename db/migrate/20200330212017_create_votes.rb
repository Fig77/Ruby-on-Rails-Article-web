class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :positive

      t.timestamps
    end
  end
end
