class Task < ActiveRecord::Base
  before_save             :check_status
  has_many :items, :dependent => :destroy
  accepts_nested_attributes_for :items, :allow_destroy => true
  with_options :presence => true do |f|
    f.validates :name
  end
  def to_s
    name
  end
  def check_status
    #breakpoint
    self.items.each do |item|
      if item.finished
        self.finished=true
      else
        self.finished=false
        break
      end
    end
  end
end
