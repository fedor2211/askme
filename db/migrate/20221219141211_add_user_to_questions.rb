class AddUserToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "questions", "users"
  end
end
