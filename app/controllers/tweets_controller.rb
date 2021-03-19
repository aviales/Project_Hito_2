class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy retweet ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]


  # GET /tweets or /tweets.json
  def index

    @q = params[:query]

    if @q
      @tweets = Tweet.where("content ~* ?", @q).page(params[:page])
    else
      @tweets = Tweet.page(params[:page])
    end

    current_user
    # @tweets = Tweet.page(params[:page])
    # @tweet = Tweet.new
    
  end

  # GET /tweets/1 or /tweets/1.json
  def show
    @likes = Like.all
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create

    @tweet = Tweet.new
    @tweet.content = params[:content]
    @tweet.user_id = current_user.id

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def retweet
    tweet = @tweet.retweets.build(user_id: current_user.id, content: @tweet.content)

    if tweet.save
      redirect_to root_path
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweets).permit(:content, :user_id)
    end
end
