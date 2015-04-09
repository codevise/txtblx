module Txtblx
  module AbilityMixin
    # Call this in the ability initializer of the host app
    def txtblx_full_abilities(user)
      return if user.nil?

      can(:manage, Textblock)
    end

    def txtblx_editor_abilities(user)
      return if user.nil?

      can(:read, Textblock)
      can(:update, Textblock)
    end
  end
end
