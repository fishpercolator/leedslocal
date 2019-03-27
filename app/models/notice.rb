class Notice < ApplicationRecord
  has_one_attached :image
  enum notice_type: {notice: 'notice', intro: 'intro', event: 'event', ask: 'ask'}
  validates :notice_type, presence: true
end
