class PostPolicy < ApplicationPolicy
  
  class Scope
    # attr_accessor :user, :scope
    attr_reader :user, :scope

      def initialize (user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        if user && (user.admin? || user.moderator?)
          scope.all
        else
          scope.where(:user => user)
        end
      end 

  end

  def index?
    true
  end
end
