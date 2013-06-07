class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :title, :uniqueness => true
  validates :body,  :presence => true

  has_and_belongs_to_many :tags

end
