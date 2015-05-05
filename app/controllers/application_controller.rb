class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :create_markdown_parser

  def create_markdown_parser
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, extensions = {})
  end

end
