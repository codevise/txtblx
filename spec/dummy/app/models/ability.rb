class Ability
  include CanCan::Ability
  include Txtblx::AbilityMixin

  def initialize(user)
    return if user.nil?

    txtblx_editor_abilities(user)
  end
end
