class Task < ActiveRecord::Base
  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items, :allow_destroy => true
  with_options :presence => true do |f|
    f.validates :name
  end
  def to_s
    name
  end
end
