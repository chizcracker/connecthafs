class Work < Group
  has_many :user_works
  has_many :users, through: :user_works
end
