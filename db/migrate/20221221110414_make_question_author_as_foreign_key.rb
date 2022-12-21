class MakeQuestionAuthorAsForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "questions", "users", column: "author_id", on_delete: :nullify
  end
end
