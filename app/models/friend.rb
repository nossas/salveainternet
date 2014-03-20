class Friend < ActiveRecord::Base
  validates :uid, uniqueness: true
end
