class Education < Group
  has_many :user_educations
  has_many :users, through: :user_educations
end
