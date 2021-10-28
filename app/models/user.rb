class User < ApplicationRecord
  before_save :set_user_type
  has_many :notifications
  has_many :invitations

  has_and_belongs_to_many :courses
  has_and_belongs_to_many :groups

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_user_type
    if get_user_type_from_domain(sanitize_email_domain(self.email))
      self.user_type = 'student'
    else
      self.user_type = 'teacher'
    end
  end

  def get_user_type_from_domain(domain)
    if domain.include?('students')
      return true
    elsif domain.include?('student')
      return true
    else
      return false
    end
  end

  def sanitize_email_domain(email)
    return split_domain_with_dot_x = email.split('@').last
  end

  def friendly_user_type
    if self.user_type = 'teacher'
      return 'Compte professeur'
    else
      return 'Compte étudiant'
    end
  end
end
