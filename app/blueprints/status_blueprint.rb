class StatusBlueprint < Blueprinter::Base
    identifier :id
    fields :label, :sort_order, :organization_id, :created_at, :updated_at,

    view :normal do
        fields :label, :sort_order, :organization_id, :created_at, :updated_at,
      end
end