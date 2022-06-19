class PriorityBlueprint < Blueprinter::Base
  identifier :id
  field :label, :sort_order, :organization

  view :normal do
    fields :created_at, :updated_at
  end
end