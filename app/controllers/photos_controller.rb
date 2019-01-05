class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @race = Race.find(params[:race_id])
    @photo.race = @race
    @photo.user = current_user
    if @photo.save
      respond_to do |format|
        format.js  # <-- will render `app/views/photos/create.js.erb`
        format.html { redirect_to race_path(@race) }
      end
    else
      respond_to do |format|
        format.html { render 'races/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_dashboard_path
  end

  def photo_params
    params.require(:photo).permit(:image)
  end


end
