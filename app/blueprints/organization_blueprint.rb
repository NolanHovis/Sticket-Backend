class OrganizationBlueprint < Blueprinter::Base
    identifier :id
    fields :name, :subdomain, :orgtype

    view :normal do
        fields :name, :subdomain, :orgtype
      end
end