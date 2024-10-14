module ApplicationHelper
  def print_error_messages(object, column)
    return if object.errors[column].empty?

    "<div class=\"invalid-feedback\">#{I18n.t(column.downcase)} #{object.errors[column].join('<br/ >')}</div>".html_safe
  end

  def string_to_url(str)
    str.downcase.gsub(' ', '+')
  end

  def print_session_error_messages(message)
    "<div class=\"invalid-feedback fs-5 text-center\">#{message}</div>".html_safe
  end

  # TODO: redis ile bu sorgu cache üzerinden alınabilir.
  def get_tags
    if controller.class.name.split('::').first == 'Pages' && %w[projects articles categories
                                                                tags].include?(controller_name)
      case controller_name
      when 'projects'
        Tag.joins(:projects).group(:title).count
      when 'articles'
        Tag.joins(:articles).group(:title).count
      else
        projects = Tag.joins(:projects).group(:title).count
        articles = Tag.joins(:articles).group(:title).count
        projects.merge(articles) { |_key, new, old| new + old }
      end.sort_by { |_i, j| j }.reverse.to_h
    end
  end

  def get_categories
    if controller.class.name.split('::').first == 'Pages' && %w[projects articles categories
                                                                tags].include?(controller_name)
      case controller_name
      when 'projects'
        Category.joins(:projects).group(:name).count
      when 'articles'
        Category.joins(:articles).group(:name).count
      else
        # Category.left_joins(:articles).left_joins(:projects).group(:name).count
        projects = Category.joins(:projects).group(:name).count
        articles = Category.joins(:articles).group(:name).count
        projects.merge(articles) { |_key, new, old| new + old }
      end.sort_by { |_i, j| j }.reverse.to_h
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
