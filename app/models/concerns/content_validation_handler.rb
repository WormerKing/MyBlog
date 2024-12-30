# frozen_string_literal: true

module ContentValidationHandler
  extend ActiveSupport::Concern
  SCHEMA = File.read(Rails.root.join('config', 'schemas', 'content_schema.json')).to_s.freeze

  protected

  def json_validation
    if content.blank?
      errors.add(:content, 'kısmı boş olamaz!')
      return
    end

    begin
      JSON.parse(content)
    rescue JSON::ParserError && TypeError
      errors.add(:content, 'kısmı geçerli bir JSON olmalıdır!')
    end

    begin
      JSON::Validator.validate!(SCHEMA, content)
    rescue JSON::Schema::ValidationError => e
      errors.add(:content, "kısmı geçerli bir JSON olmalıdır! Hata: #{e.message}")
    end
  end
end
