class Ability
  include CanCan::Ability
  include Txtblx::AbilityMixin

  def initialize(user)
    return if user.nil?

    if user.role == 'editor'
      txtblx_editor_abilities(user)
    end

    if user.role == 'admin'
      txtblx_full_abilities(user)
    end
  end
end
