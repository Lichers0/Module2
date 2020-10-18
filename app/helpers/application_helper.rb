module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_messages
    flash_type = { alert: "alert-danger",
             notice: "alert-primary",
             notification: "alert-success",
             other: "alert-dark"
    }

    flash.map do |type, message|
      flash_class = flash_type[type.to_sym] || flash_type[:other]
      content_tag :div, message, class: "alert #{flash_class} my-1"
    end.join('').html_safe
  end
end

