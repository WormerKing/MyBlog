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
    type = controller_name if %w[projects articles].include?(controller_name)
    sql = "select t.title,count(pt.id) [count] from
    #{type}_tags as pt full join tags as t on t.id = pt.tag_id
      group by t.title order by count(pt.id) desc"

    result = ActiveRecord::Base.connection.execute(sql)
    result.to_a
    # Tag.all
  end

  def get_categories
    type = controller_name if %w[projects articles].include?(controller_name)

    # Category.all
    sql = "select c.name,count(*) [count]
      from #{type} as p
      inner join categories as c
      on p.category_id = c.id
      group by c.name
    "

    result = ActiveRecord::Base.connection.execute(sql)
    result.to_a
  end
end
