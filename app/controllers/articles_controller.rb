class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :most_popular]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article.increment!(:views)
    @comments = Comment.order(created_at: :desc).last(5)
    @comment = Comment.new
    @comment.article = @article
  end

  def new
    @user = current_user
    @article = Article.new
    @article.user = @user
  end

  def create
    @user = current_user
    @article = Article.new(article_params)
    @article.user = @user
    if @article.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @article.user = current_user
    if @article.update(article_params)
      flash.notice = "L'article '#{@article.title}' a bien été modifié !"
    redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def most_popular
    @articles = Article.order(views: :desc).first(5)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :photo, :user_id)
  end
end
