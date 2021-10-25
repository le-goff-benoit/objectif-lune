class Group < ApplicationRecord
  has_and_belongs_to_many :users
  before_save :set_privacy

  def set_privacy
    if self.key.present?
      self.privacy = true
    else
      self.privacy = false
    end
  end
  def sanitize_privacy
    if self.privacy
      return "Privé"
    else
      return "Public"
    end
  end

  def self.get_free_groups(user)
    @free_groups = []
    Group.where(:privacy => false).each do |group|
      if !user.in?(group.users)
        @free_groups << group
      end
    end
    return @free_groups
  end
end
