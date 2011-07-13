ActiveAdmin.register Item do

  scope :all, :default => true
  scope :available do |items|
    items.where(:giver_id => nil)
  end
  scope :reserved do |items|
    items.where("giver_id IS NOT NULL")
  end

  filter :title
  filter :giver, :as => :select, :collection => lambda { User.all }

  index do
    column :title do |item|
      link_to item.title, admin_item_path(item)
    end
    column "Giver" do |item|
      item.giver.email if item.giver.present?
    end
  end

end
