module ItemsHelper
  def doitems_path(task,item)
    unless task.nil? and item.nil
      "/tasks/#{task.id}/items/#{item.id}/doitem"
    end
  end
  def updateitem_path(task,item)
    unless task.nil? and item.nil
      "/tasks/#{task.id}/items/#{item.id}/updateitem"
    end
  end
end
