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
  end
end
