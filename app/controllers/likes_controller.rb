class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_tweet

  # GET /likes or /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1 or /likes/1.json
  def show
    
  end

  # GET /likes/new
  def new
    @tweet = Tweet.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes or /likes.json
  def create



    if @tweet.likes.where(user_id: current_user.id).count === 0

      @like = Like.create(tweet_id: @tweet.id, user_id: current_user.id)

    elsif @tweet.likes.where(user_id: current_user.id).count > 0
      @tweet.likes.where(user_id: current_user.id).each do |like|
        like.delete
      end
    end      
    redirect_to(root_path)
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: "Like was successfully updated." }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    def set_tweet
      @tweet = Tweet.find(params[:tweet_id]) 
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.fetch(:like, {})
    end
end
