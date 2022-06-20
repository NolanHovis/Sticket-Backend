class TeamBlueprint < Blueprinter::Base
    identifier :id
    fields :client_id, :organization_id, :created_at, :updated_at,

    view :normal do
        fields :client_id, :organization_id, :created_at, :updated_at,
      end
end