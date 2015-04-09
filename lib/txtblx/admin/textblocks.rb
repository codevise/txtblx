module Txtblx
  if defined?(ActiveAdmin)
    ActiveAdmin.register Textblock, as: 'Textblock' do
      actions :all
      filter :description
      filter :text

      index do
        column :key if authorized?(:manage, Textblock)
        column :description do |textblock|
          link_to(textblock.description, admin_textblock_path(textblock))
        end
      end

      show title: :description do |textblock|
        div :class => :columns do
          attributes_table_for textblock do
            row :key if authorized?(:manage, textblock)
            row :description
            row :text do
              textblock.text_html
            end
          end
        end
      end

      form title: :description do |f|
        if authorized?(:manage, f.object)
          f.inputs :key, :description, :text
        else
          f.inputs do
            li("<label>Beschreibung</label> <b>#{f.object.description}</b>".html_safe)
            f.input  :text
          end
        end
        f.actions do
          f.action :submit
          f.action :cancel, as: :link, button_html: {class: 'button'}
        end
      end

      controller do
        def permitted_params
          params.permit(:utf8, :_method, :authenticity_token, :commit, :id,
            textblock: [:key, :perma_id, :description, :text])
        end

        def update
          result = super
          resource.publish if resource.valid?
          result
        end

        def create
          result = super
          resource.publish if resource.valid?
          result
        end

        def find_resource
          Textblock.drafts.where(perma_id: params[:id]).first!
        end

        def scoped_collection
          Textblock.drafts
        end
      end
    end
  end
end
