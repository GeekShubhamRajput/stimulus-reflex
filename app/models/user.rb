class User < ApplicationRecord

  validates :name, presence: true
  validates :age, numericality: true

  enum status: { active: 0, archived: 1 }

  scope :status_filter, ->(status_key) { where(status: User.statuses[status_key]) }
  scope :search, ->(search_keyword) {
    where('lower(users.name) LIKE :query', query: "%#{search_keyword.downcase}%")
  }
end
