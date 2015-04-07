module Txtblx
  if defined?(ActiveAdmin)
    ActiveAdmin.register Textblock, as: 'Textblock' do
      actions :all, except: [:destroy]

      index do
        column :key do |textblock|
          link_to(textblock.key, admin_textblock_path(textblock))
        end
        column :description
      end

      show do |textblock|
        div :class => :columns do
          attributes_table_for textblock do
            row :key
            row :description
            row :text
          end
        end
      end

      form do |f|
        f.inputs :key, :description, :text
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
