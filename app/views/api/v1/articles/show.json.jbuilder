json.extract! @article, :id, :title, :content
json.comments @article.comments do |comment|
  json.extract! comment, :id, :content
  json.user do
    json.id comment.user.id  #json.id correspond a la clé qui s'appelera id
    json.pseudo comment.user.pseudo
  end
end

# renvoit un objet qui contient les infos de l'article et les comments associés
