class StoreTemplate < ActiveRecord::Base
    # self.table_name = "templates"

    # # validates_attachment_presence :thumb
    # do_not_validate_attachment_file_type :thumb
    # has_attached_file :thumb,
    #   styles: { mini: '48x48>', small: '248x80>', medium: '500x500>' },
    #   default_style: :medium,
    #   url: '/stores/templates/:id/:style/:basename.:extension',
    #   path: ':rails_root/public/stores/templates/:id/:style/:basename.:extension',
    #   convert_options: { all: '-strip -auto-orient' }
end
