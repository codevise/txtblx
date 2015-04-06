module Txtblx
  module AbilityMixin
    # Call this in the ability initializer of the host app
    def txtblx_abilities(user)
      return if user.nil?

      can(:manage, Textblock)
    end
  end
end

