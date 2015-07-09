class Contact < ActiveRecord::Base
  validates :first, presence: true, length: {minimum: 2}
  validates :last, presence: true, length: {minimum: 2}
  validates :email, presence: true, length: {minimum: 2}
  validates :message, presence: true, length: {minimum: 2}

end
