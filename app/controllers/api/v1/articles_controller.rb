class Api::V1::ArticlesController < Api::V1::BaseController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.all
  end

  def show
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

end
