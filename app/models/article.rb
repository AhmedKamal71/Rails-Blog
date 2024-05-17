class Article < ApplicationRecord
  include Visible

  has_many :comments
  belongs_to :user
  has_one_attached :image

  before_create :set_default_reports_count

  scope :active, -> { where(archived: false) }

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  private

  def set_default_reports_count
    self.reports_count ||= 0
  end

end
