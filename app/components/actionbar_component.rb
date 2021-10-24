# frozen_string_literal: true

class ActionbarComponent < ViewComponent::Base
  def initialize(title:, domain: nil )
    @title = title
    @domain = domain
  end
end
