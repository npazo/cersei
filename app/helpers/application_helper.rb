module ApplicationHelper

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

end
