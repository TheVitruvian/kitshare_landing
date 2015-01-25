class KitPhotosController < ApplicationController
  
  def create

    @kit_photo = KitPhoto.new(params[:image])
    @kit_photo.save
  
  end

  def upload_photos
  end

  def upload
    @photo = KitPhoto.new(image: params[:file])
    # parsed = KitPhoto.parse_filename(params[:name])
    # @photo.title = parsed[:title]
    if @photo.save
      head 200
    end
  end
end

   