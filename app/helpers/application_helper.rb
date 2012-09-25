module ApplicationHelper
  def get_user_status
     if user_signed_in?
      "Signed in as #{current_user.email}. #{link_to "(Sign out)", destroy_user_session_path, :method => :delete}".html_safe
      else
      "#{link_to "Sign Up", new_user_registration_path} or #{link_to "Sign in", new_user_session_path}".html_safe
      end
  end
end
