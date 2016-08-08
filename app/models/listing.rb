class Listing < ApplicationRecord
  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg",
      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end