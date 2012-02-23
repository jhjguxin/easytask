class Item < ActiveRecord::Base
  belongs_to :task
  before_save             :check_status
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true
  with_options :presence => true do |f|
    f.validates :task
    f.validates :name
    f.validates :count,:numericality => { :only_integer => true }
  end
  def to_s
    name
  end
  def delete_empty_asset
    self.assets.each do |a|
      if a.username=='' or a.url==''
        a.destroy
      end
    end
  end
  def check_status
    delete_empty_asset
    #breakpoint
    if self.count==self.assets.count
      #breakpoint
       self.finished=true
     else 
       self.finished=false
     end
     return true
  end
end
