class Tag < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true 

  has_and_belongs_to_many :posts

  def self.create_tags(tags)
    tags.map do |tag|
      Tag.find_or_create_by_name(tag)
    end
  end
end
