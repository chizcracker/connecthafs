class User < ActiveRecord::Base
    has_many :user_works
    has_many :works, through: :user_works
end
