class Favorite < ApplicationRecord
  belongs_to :user
  validates_presence_of :url, :text

end
