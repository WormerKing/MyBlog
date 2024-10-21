module ApplicationHelper
  def print_error_messages(object, column)
    return if object.errors[column].empty?

    "<div class=\"invalid-feedback\">#{I18n.t(column.downcase)} #{object.errors[column].join('<br/ >')}</div>".html_safe
  end

  def string_to_url(str)
    str.downcase.gsub(' ', '+')
  rescue NoMethodError
    str
  end

  def print_session_error_messages(message)
    "<div class=\"invalid-feedback fs-5 text-center\">#{message}</div>".html_safe
  end

  def get_tags
    if controller.class.name.split('::').first == 'Pages' && %w[projects articles categories
                                                                tags].include?(controller_name)
      case controller_name
      when 'projects'
        KredisService.get_tags_list('projects')
      when 'articles'
        KredisService.get_tags_list('articles')
      else
        KredisService.get_tags_list
      end
    end
  end

  def get_categories
    if controller.class.name.split('::').first == 'Pages' && %w[projects articles categories
                                                                tags].include?(controller_name)
      case controller_name
      when 'projects'
        KredisService.get_categories_list('projects')
      when 'articles'
        KredisService.get_categories_list('articles')
      else
        KredisService.get_categories_list
      end
    end
  end

  # Date to localize, humanize
  def tr_humanize(date)
    date_arr = date.strftime('%d %B %Y').split
    date_arr.map! do |el|
      if I18n.exists?(el.downcase)
        I18n.translate(el.downcase)
      else
        el
      end
    end
    date_arr.join(' ')
  end
end
