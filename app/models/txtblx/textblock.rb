module Txtblx
  class Textblock < ActiveRecord::Base
    include Snaps.revision(default_tag: :draft)

    scope :published, -> { with_snaps_tag(:published) }

    def publish
      snapshot!(tag: :published)
    end

    def to_param
      perma_id.to_s
    end

    def self.by_key(key)
      Textblock.all.first
      Textblock.published.find_by_key!(key)
    end
  end
end
