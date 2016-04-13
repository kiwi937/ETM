class Artwork < ActiveRecord::Base
  validates :name, presence: true

  validates :image_id, presence: true, uniqueness: true

  attachment :image

  belongs_to :exhibition
  has_and_belongs_to_many :artists
  has_many :floor_coordinates

  def self.search(search)
    where("name LIKE ? OR medium LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
