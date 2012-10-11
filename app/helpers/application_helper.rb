module ApplicationHelper
  def get_user_status(options={})
     
     if user_signed_in?
      "#{current_user.email}. #{ link_to "(Sign out)", destroy_user_session_path, :method => :delete, :class => options[:class] }".html_safe
      else
      "#{ link_to "Sign in", new_user_session_path, :class => options[:class] }".html_safe
      end
  end
end
