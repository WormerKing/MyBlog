class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  private

  def reorganize_title
    return raise ArgumentError unless title

    self.title = title.split(' ').map(&:capitalize).join(' ')
  end
end
