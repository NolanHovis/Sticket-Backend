# frozen_string_literal: true  
module Enumerable    
    # Handles storing the possible states    
      module UserRoles    
        USER_ROLESOPTION_TEXT = {
              admin: 'Admin',        
              general: 'Member'
            }.freeze      
        
        USER_ROLES_OPTIONS = {
              admin: 1,        
              general: 2
        }.freeze      
        
        def self.options        
          USER_ROLES_OPTIONS      
        end      
        
        # This method allows us to return an array of the integer, sym/key, and human readable value for populating form selectors.
        def self.readable_types        
          UserRoles_OPTIONS.map { |key, value| { key: key, hr: User_OPTION_TEXT[key.to_sym], value: value } }
        end      
        
        # When using a serialier like 'Blueprinter' we can use this method to return friendly text on return
        def self.friendly_name(userrole_option)
          UserRoles_OPTION_TEXT[userrole_option.to_sym]
        end    
      end  
    end