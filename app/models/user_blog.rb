class UserBlog
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :user
  embedded_in :blog
end
