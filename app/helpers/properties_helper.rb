module PropertiesHelper
  
  def admin_thumbnail_size
    if @properties.length > 4 : tsize = :thumbnail else tsize = :small end
    tsize
  end

end
