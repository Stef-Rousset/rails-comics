class Api::V1::ArticlesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_article, only: [:show, :update]

  def index
    @articles = policy_scope(Article)
  end

  def show
  end

  def update
    if @article = Article.update(article_params)
    render :show
    else
      render_error #cf method en private
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :photo)
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
