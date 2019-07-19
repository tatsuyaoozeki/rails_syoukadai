class Blog < ApplicationRecord
  # titleという値を確認し、からであった場合は違反状態の値とみなして保存を中止します
  validates :title,presence: true
end
