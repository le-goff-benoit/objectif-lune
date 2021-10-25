# frozen_string_literal: true

class BadgeComponent < ViewComponent::Base
  def initialize(object:, status:)
    @object = object
    @status = status
  end

end
