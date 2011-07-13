class Item < ActiveRecord::Base
  belongs_to :giver, :class_name => "User", :foreign_key => "giver_id"
  validates_presence_of :title
end
