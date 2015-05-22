class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :create_markdown_parser
  after_filter  :check_settings

  def create_markdown_parser
    @markdown = Redcarpet::Markdown.new(ApplicationHelper::HTML.new, fenced_code_blocks: true)
  end
  
  def check_settings
    if user_signed_in? && !Setting.initialized?
       flash[:warning] = "There are settings that need to be " + ActionController::Base.helpers.sanitize(ActionController::Base.helpers.link_to('reviewed.', settings_path, :class => 'alert-link')).html_safe
    end
  end

end
