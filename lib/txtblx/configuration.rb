module Txtblx
  class Configuration
    attr_accessor :auto_html_block

    def initialize
      @auto_html_block = Proc.new do
        html_escape
        link :target => "_blank", :rel => "nofollow"
        simple_format
      end
    end

    def load_active_admin
      admin_path = File.join(Txtblx::Engine.root, 'lib', 'txtblx', 'admin')
      ActiveAdmin.application.load_paths.unshift(admin_path)
    end
  end
end
