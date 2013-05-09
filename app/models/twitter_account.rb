class TwitterAccount < ActiveRecord::Base
  validates :user_name, :uniqueness => true
end
