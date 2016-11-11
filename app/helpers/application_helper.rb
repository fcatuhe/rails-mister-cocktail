module ApplicationHelper
  def yield_with_default(holder, default)
    if content_for?(holder)
      "#{content_for(holder).squish} | #{default}"
    else
      default
    end
  end

  def image_path_with_default(cocktail)
    if cocktail.photo?
      cl_image_path cocktail.photo.path, height: 300, width: 400, crop: :fill
    else
      image_path 'cocktail345.gif'
    end
  end
end
