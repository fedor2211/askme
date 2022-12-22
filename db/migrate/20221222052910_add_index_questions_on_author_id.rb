class AddIndexQuestionsOnAuthorId < ActiveRecord::Migration[7.0]
  def change
    add_index :questions, :author_id
  end
end
