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
end
