# frozen_string_literal: true

class ActionbarComponent < ViewComponent::Base
  def initialize(title:, domain: nil, subtitle: nil )
    @title = title
    @domain = domain
    @subtitle = subtitle
  end
end
