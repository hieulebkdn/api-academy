class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_one :account, dependent: :destroy
  has_many :class_room_user, dependent: :destroy

  accepts_nested_attributes_for :account

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, allow_nil: true

  scope :get_in_list, ->(list_id){where "id IN (?)",list_id }
  scope :fetch_by_role, -> (role_name){where "role = ?",role_name}

  has_secure_password

    # Returns the hash digest of the given string.
  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end
end
