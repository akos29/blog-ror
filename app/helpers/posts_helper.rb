module PostsHelper
  def truncate_text(text, length)
    if text.length > length
      truncated_text = truncate(text, length:, separator: ' ')
      link_to("#{truncated_text}... ", '#', class: 'read-more')
    else
      text
    end
  end
end
