class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
