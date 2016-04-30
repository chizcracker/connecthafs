class Group < ActiveRecord::Base
  scope :educations, -> { where(type: 'Education') }
  scope :works, -> { where(type:'Work' ) }
end
