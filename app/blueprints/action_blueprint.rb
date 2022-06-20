# frozen_string_literal: true

# Defines the JSON blueprint for the User model
class ActionBlueprint < Blueprinter::Base
    identifier :id
    fields :comment, :movement, :attachment, :assignment, :priority
  
    view :login do
      association :token, blueprint: TokenBlueprint do |action_types_option, _options|
        action_types_option.tokens.last
      end
    end
  
    view :normal do
      fields :comment, :movement, :attachment, :assignment, :priority
    end
  
  end
  
  