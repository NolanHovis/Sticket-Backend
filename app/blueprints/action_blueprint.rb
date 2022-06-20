# frozen_string_literal: true

# Defines the JSON blueprint for the User model
class ActionBlueprint < Blueprinter::Base
    identifier :id
    fields :comment, :movement, :attachment, :assignment, :priority
  
    view :normal do
      fields :comment, :movement, :attachment, :assignment, :priority
    end
  
  end
  
  