class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
  validates :title, presence: true, length: { minimum: 5}
  validates :body, presence: true
  has_attached_file :image, styles: { large: "600x600>",medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_attached_file :logo, styles: { large: "600x600>",medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
