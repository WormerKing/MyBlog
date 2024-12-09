class ProjectImage < ApplicationRecord
  has_one_attached :image
  belongs_to :project, optional: true
end
