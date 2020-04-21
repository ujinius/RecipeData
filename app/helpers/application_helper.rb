module ApplicationHelper

  def list_image(image)
    common_image(image, 300, 20)
  end

  def details_image(image)
    common_image(image, 600, 20)
  end

  private

  def common_image(image, width, corner)
    image&.width(width)&.rounded_corners(corner)&.png_8bit&.load
  end

end
