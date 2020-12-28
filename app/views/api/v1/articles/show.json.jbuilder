json.extract! @article, :id, :title, :content
json.comments @article.comments do |comment|
  json.extract! comment, :id, :content
end

# renvoit un objet qui contient les infos de l'article et les comments associés
