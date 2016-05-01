class User < ActiveRecord::Base
    has_many :user_works
    has_many :works, through: :user_works
    has_many :user_educations
    has_many :educations, through: :user_educations
end
