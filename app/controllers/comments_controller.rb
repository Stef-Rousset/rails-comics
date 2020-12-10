class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.user = current_user
    @comment.article = @article
    if @comment.save
      redirect_to article_path(@comment.article) # redirige sur la show à l'endroit ou est cree le commentaire
    else
      flash.alert = 'Tu dois remplir le champ contenu pour valider ton commentaire'
      redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id)
  end
end
