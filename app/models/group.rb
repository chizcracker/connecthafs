class Group < ActiveRecord::Base
  scope :highschools, -> { where(type: 'Highschool') }
  scope :universities, -> { where(type: 'University') }
  scope :works, -> { where(type:'Work' ) }
end
