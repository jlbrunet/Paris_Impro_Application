module ApplicationHelper
  def show_dropdown?
    !current_page?('/users/sign_in') && !current_page?('/users/sign_up') && !current_page?('/users/password/new')
  end
end
