module ProjectImagesHandler
  extend ActiveSupport::Concern

  def save_project_images
    content = parse_content
    image_blocks = filter_image_blocks(content)

    image_blocks.each do |image_block|
      signed_id = extract_signed_id(image_block)
      existing_image = find_existing_image(signed_id)

      if existing_image.nil?
        create_and_associate_image(signed_id)
      else
        update_existing_image(existing_image)
      end
    end
    delete_unused_images(content)
    delete_unassociated_images
  end

  private

  def parse_content
    # project model has a content:json column
    JSON.parse(content)
  end

  def filter_image_blocks(content)
    content['blocks'].select { |block| block['type'] == 'image' }
  end

  def extract_signed_id(image_block)
    url = image_block['data']['file']['url']
    url_segments = url.split('/')
    url_segments[-2]
  end

  def find_existing_image(signed_id)
    project_images.find { |img| img.image.signed_id == signed_id }
  end

  def create_and_associate_image(signed_id)
    projectImage = ProjectImage.new(project: self)
    projectImage.image.attach(signed_id)
    projectImage.save
    # project has project_images:has_many association
    project_images << projectImage
  end

  def update_existing_image(existing_image)
    existing_image.update(project_id: id)
  end

  def delete_unused_images(content)
    images_to_delete = project_images.reject do |project_image|
      signed_id = project_image.image.signed_id
      content['blocks'].any? do |block|
        block['type'] == 'image' &&
          block['data']['file']['url'].include?(signed_id)
      end
    end

    images_to_delete.each(&:destroy)
  end

  def delete_unassociated_images
    ProjectImage.where(project_id: nil).destroy_all
  end
end
