class PriorityBlueprint < Blueprinter::Base
  identifier :id
  field :organization

  view :normal do
    fields :created_at, :updated_at
  end
end