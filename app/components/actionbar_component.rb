# frozen_string_literal: true

class ActionbarComponent < ViewComponent::Base
  def initialize(title:, domain: nil, subtitle: nil, backpath: nil, invitation: nil, object: nil )
    @title = title
    @domain = domain
    @subtitle = subtitle
    @backpath = backpath
    @invitation = invitation
    @object = object
  end
end
