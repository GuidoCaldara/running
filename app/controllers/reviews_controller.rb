class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @race = Race.find(params[:race_id])
    @review.race = @race
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.js  # <-- will render `app/views/reviews/create.js.erb`
        format.html { redirect_to race_path(@race) }
      end
    else
      respond_to do |format|
        format.html { render 'races/show' }
        format.js  # <-- idem
      end
    end
  end
  def review_params
    params.require(:review).permit(:text, :overall_rate, :path_rate, :organisation_rate)
  end

end
