class ProjectPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  def show?
    true
  end

  def index?
    user.email == 'jlricoramos@gmail.com'
  end

  def create?
    user.email == 'jlricoramos@gmail.com'
  end

  def new?
    create?
  end

  def update?
    user.email == 'jlricoramos@gmail.com'
  end

  def edit?
    update?
  end

  def destroy?
    user.email == 'jlricoramos@gmail.com'
  end
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      if user.email == 'jlricoramos@gmail.com'
        scope.all
      else
        scope.none
      end
    end
  end
end
