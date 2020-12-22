module CarouselHelper
  def array_carousels
    # all_carousels   = Carousel.active.includes([image_attachment: :blob]).order(created_at: :desc)
    all_carousels   = Carousel.active.order(created_at: :desc)
    first_carousel  = all_carousels.first if all_carousels
    [all_carousels, first_carousel]
  end

  def recently_active_carousel
    carousel_ids = array_carousels&.first&.ids
    carousel_ids = carousel_ids.delete_if {|id| id == array_carousels&.last&.id }
    # Carousel.active.includes([image_attachment: :blob]).where(id: carousel_ids)
    Carousel.active.where(id: carousel_ids)
  end
end