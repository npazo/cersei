class PostsMedium < ActiveRecord::Base
  belongs_to :medium
  belongs_to :post
end
