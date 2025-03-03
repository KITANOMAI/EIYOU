class TweetsController < ApplicationController

  # before_action :if_not_admin, except: [:show, :index]

  def index
    @tweets = Tweet.all

    if params[:tag]
      Tag.create(name: params[:tag])
    end
    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_tweets = Tag.find_by(name: key).tweets
          @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_tweets
        end
      end
    end
  end
  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

    before_action :authenticate_user! 
  
    def nyuuziki
      @posts = Tweet.all
    end
  
    def youziki
      @posts = Tweet.all
    end
  
    def gakureiki
      @posts = Tweet.all
    end
  
    def cyuugakusei
      @posts = Tweet.all
    end
  
    def seinennki
      @posts = Tweet.all
    end
  
    def sounennki
      @posts = Tweet.all
    end

    def cyuunennki
      @posts = Tweet.all
    end
  
    def rounennki
      @posts = Tweet.all
    end
  
    def sports
      @posts = Tweet.all
    end

    def nennsinnki
      @posts = Tweet.all
    end

    def result
      @tweets = Tweet.all
    end

  private
  def tweet_params
    params.require(:tweet).permit(:body, :category, :result_key, :result_detail, :image, tags_ids:[])
  end
  def if_not_admin
      redirect_to root_path unless current_user.email == ENV['ADMIN_EMAIL']
  end
end
