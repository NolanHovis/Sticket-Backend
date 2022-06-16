# frozen_string_literal: true  
    module Enumerable    
    # Handles storing the possible states    
      module Organization      
        ORGANIZATION_OPTION_TEXT = {
              engineering: 'engineering',        
              marketing: 'marketing'  
        }.freeze      
        
        ORGANIZATION_OPTIONS = {
              engineering: 1,        
              marketing: 2
        }.freeze      
        
        def self.options        
          ORGANIZATION_OPTIONS      
        end      
        
        # This method allows us to return an array of the integer, sym/key, and human readable value for populating form selectors.
        def self.readable_types        
          ORGANIZATION_OPTIONS.map { |key, value| { key: key, hr: ORGANIZATION_OPTION_TEXT[key.to_sym], value: value } }
        end      
        
        # When using a serialier like 'Blueprinter' we can use this method to return friendly text on return
        def self.friendly_name(organization_option)
          ORGANIZATION_OPTION_TEXT[organization_option.to_sym]
        end    
      end  
    end
  