class User < ApplicationRecord
  has_secure_password

  ORGANIZATION_OPTIONS = [
    'Idea Ink',
    'Kaito',
    'Omni HR'
]

  validates :name, presence: true
  validates :email, presence: true,
             format: { with: /\S+@\S+/ },
             uniqueness: { case_sensitive: false }
  validates :organization, inclusion: { in: ORGANIZATION_OPTIONS }
end
