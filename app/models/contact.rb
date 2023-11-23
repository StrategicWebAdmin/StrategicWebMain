class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phonenumber, presence: true, length: { maximum: 20 }
  validates :select_service_type, presence: true, inclusion: { in: ['Frontend Design', 'E-commerce Website', 'Full Website', 'Graphic Design/Logo Design', 'Backend API & Design'] }
  validates :message, presence: true, length: { maximum: 1000 }
end
