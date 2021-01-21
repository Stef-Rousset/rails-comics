class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # tt le monde peut acceder a la show
  def show?
    true
  end

  # seulement celui qui a ecrit l'article peut updater
  def update?
    record.user == user
  end

  # tt user qui est logged in peut creer un article
  def create?
    !user.nil?
  end

  # seulement celui qui a ecrit l'article peut le supprimer
  def destroy?
    record.user == user
  end
end
