json.array! @articles do |article|
  json.extract! article, :id, :title, :content
end

# renvoit un array qui contient les articles sous forme d'objets avec les clés id, title et content
