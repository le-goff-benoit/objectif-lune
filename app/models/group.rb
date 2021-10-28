class Group < ApplicationRecord
  has_and_belongs_to_many :users
  before_save :set_privacy
  has_many :tasks

  validates :key, :uniqueness => { message: "Cette clé est déja utilisée, merci d'en choisir une autre", :case_sensitive => true}, :allow_blank => true, :presence => true

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
