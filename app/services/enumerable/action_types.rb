# frozen_string_literal: true
    module Enumerable    
    # Handles storing the possible states    
      module ActionModel  
        ACTION_TYPES_OPTION_TEXT = {       
              comment: 'Comment',        
              movement: 'Movement',
              attachment: 'Attachment',
              assignment: 'Assignment',
              priority: 'Priority'  
        }.freeze      
        
        ACTION_TYPES_OPTIONS = {
              comment: 1,        
              movement: 2,
              attachment: 3,
              assignment: 4,
              priority: 5
        }.freeze      
        
        def self.options        
          ACTION_TYPES_OPTIONS      
        end      
        
        # This method allows us to return an array of the integer, sym/key, and human readable value for populating form selectors.
        def self.readable_types        
          ACTION_TYPES_OPTIONS.map { |key, value| { key: key, hr: ACTION_TYPES_OPTION_TEXT[key.to_sym], value: value } }
        end      
        
        # When using a serialier like 'Blueprinter' we can use this method to return friendly text on return
        def self.friendly_name(action_types_option)
          ACTION_TYPES_OPTION_TEXT[action_types_option.to_sym]
        end    
      end  
    end
  end
  