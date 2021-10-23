# frozen_string_literal: true

class ActionbarComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
