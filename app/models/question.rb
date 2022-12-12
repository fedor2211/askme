class Question < ApplicationRecord
  def hidden?
    hidden == true
  end
end
