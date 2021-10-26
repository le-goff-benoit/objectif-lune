# frozen_string_literal: true

class ActionbarComponent < ViewComponent::Base
  def initialize(title:, domain: nil, subtitle: nil, backpath: nil, invitation: nil, object: nil, join: nil, create: nil )
    @title = title
    @domain = domain
    @subtitle = subtitle
    @backpath = backpath
    @invitation = invitation
    @object = object
    @join = join
    @create = create
  end
end
