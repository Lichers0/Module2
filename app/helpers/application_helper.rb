module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_messages
    flash.map do |type, message|
      content_tag :p, message, class: "flash #{type}"
    end.join('').html_safe
  end
end
