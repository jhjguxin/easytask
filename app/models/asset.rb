class Asset < ActiveRecord::Base
  belongs_to :item
  with_options :presence => true do |f|
    f.validates :item
    f.validates :username
    f.validates :url
  end
  def to_s
    username
  end
end
