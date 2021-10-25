# frozen_string_literal: true

class HeaderComponent < ViewComponent::Base
  def initialize(user:, is_signed_in:)
    @user = user
    @is_signed_in = is_signed_in
  end

  def render?
    @is_signed_in
  end
end
