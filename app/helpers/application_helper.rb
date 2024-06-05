module ApplicationHelper
  def svg_icon(name, options = {})
    file_path = Rails.root.join('app', 'assets', 'images', 'icons', "#{name}.svg")
    if File.exist?(file_path)
      file = File.read(file_path)
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css('svg')
      if options[:class].present?
        svg['class'] = options[:class]
      end
      doc.to_html.html_safe
    else
      "(SVG not found)"
    end
  end

  def current_page_class(path)
    return 'current-icon-home' if session[:current_path] == root_path
    return 'current-icon-save' if session[:current_path] == path
  end

  def display_tags(post)
    post.tags.map { |tag| content_tag(:p, "!#{tag.name}") }.join.html_safe
  end
end
