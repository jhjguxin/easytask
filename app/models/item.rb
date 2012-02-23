class Item < ActiveRecord::Base
  belongs_to :task
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  with_options :presence => true do |f|
    f.validates :task
    f.validates :name
    f.validates :count
  end
  def to_s
    name
  end
end
