class Contact < ApplicationRecord
  validates :content, presence: true, length:{in: 1..145}
end
