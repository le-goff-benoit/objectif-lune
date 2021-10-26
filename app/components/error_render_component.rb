# frozen_string_literal: true

class ErrorRenderComponent < ViewComponent::Base
  def initialize(object: nil)
    @object = object
  end
end
