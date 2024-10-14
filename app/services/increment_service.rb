class IncrementService
  def self.add_count(object)
    begin
      object.increment!(:view_count)
    rescue ActiveModel::MissingAttributeError
      raise(NameError, "View count column is not available in #{object.class} class. Increment failed")
    end
  end
end
