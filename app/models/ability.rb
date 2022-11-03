class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[read create], Post
    can %i[read create], Comment
    can %i[update destroy], Post, author_id: user.id
    can %i[update destroy], Comment, author_id: user.id

    return unless user.role == 'admin'

    can [:manage], :all
  end
end
