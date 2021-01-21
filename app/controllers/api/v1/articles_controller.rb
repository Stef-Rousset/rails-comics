class Api::V1::ArticlesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = policy_scope(Article)
  end

  def show
  end

  def update
    if Article.update(article_params)
    render :show
    else
      render_error #cf method en private
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      render :show, status: :created
      # l'ajout du status n'est pas obligatoire, cela renvoie un Status 201 qui indique que le create a bien fonctionne
    else
      render_error
    end
  end

  def destroy
    @article.destroy
    head :no_content # renvoie une reponse sans body avec un head sans content (Status 204 No Content qui
                    # par convention correspond a une requete delete qui a bien fonctionne)
    # render json: { message: "Article deleted"}
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
      status: :unprocessable_entity #status 422 le contenu du body envoyé n'est pas valide
  end
end
