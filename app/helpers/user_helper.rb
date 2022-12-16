module UserHelper
  def nickname_output(user)
    "@#{user.nickname}"
  end

  def navbar_color_style(user)
    "background-color: #{user.navbar_color}"
  end
end
