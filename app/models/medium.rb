class Medium < ActiveRecord::Base
  has_attached_file :m
  validates_attachment_file_name :m, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  has_many :posts_medium
  has_many :posts, :through => :posts_medium

end
