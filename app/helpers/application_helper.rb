module ApplicationHelper
  COLOR_ARRAY = [ "orange", "amber", "yellow", "lime", "teal", "cyan", "sky", "violet", "purple", "fuchsia", "pink", "rose", "coral", "pumpkin", "orange", "beach", "azure", "blue", "indigo", "cerise" ].freeze

  def title(page_title)
    content_for(:title) { page_title }
  end

  def header_title(page_title)
    content_for(:header_title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def meta_image(meta_image)
    content_for(:meta_image) { meta_image }
  end

  def heading(heading)
    content_for(:heading) { heading }
  end

  def subheading(subheading)
    content_for(:subheading) { subheading }
  end

  def navigation_link(path, text, icon)
    css_class = current_page?(path) ? "flex gap-x-2 items-center px-3 py-3 text-base font-medium text-woodsmoke-900 rounded-md hover:bg-woodsmoke-200 bg-woodsmoke-100 group"
                                     : "flex gap-x-2 items-center px-3 py-3 text-base font-medium text-woodsmoke-400 rounded-md hover:bg-woodsmoke-200 group"
    icon_color = current_page?(path) ? "text-caribbean-green-500" : "text-woodsmoke-400"

    link_to path, class: css_class do
      concat(content_tag(:i, nil, class: "text-lg #{icon_color} fa-kit #{icon}"))
      concat(text)
    end
  end

  def user_color(user_name)
    hash = Digest::SHA1.hexdigest(user_name)
    color_index = hash.to_i(16) % COLOR_ARRAY.size
    COLOR_ARRAY[color_index]
  end
end
