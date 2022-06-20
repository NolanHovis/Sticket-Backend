class UserBlueprint < Blueprinter::Base
    identifier :id
    fields :role, :team_id

    view :normal do
        fields :role, :team_id
      end
end