# frozen_string_literal: true  
    module Enumerable    
    # Handles storing the possible states    
      module TeamRoles    
        TeamRoles_OPTION_TEXT = {
              admin: 'admin',        
              member: 'member',
              read_only: 'read only'
        }.freeze      
        
        TeamRoles_OPTIONS = {
              admin: 1,        
              member: 2,
              read_only: 3
        }.freeze      
        
        def self.options        
          TeamRoles_OPTIONS      
        end      
        
        # This method allows us to return an array of the integer, sym/key, and human readable value for populating form selectors.
        def self.readable_types        
          TeamRoles_OPTIONS.map { |key, value| { key: key, hr: TeamRoles_OPTION_TEXT[key.to_sym], value: value } }
        end      
        
        # When using a serialier like 'Blueprinter' we can use this method to return friendly text on return
        def self.friendly_name(teamrole_option)
          TeamRoles_OPTION_TEXT[teamrole_option.to_sym]
        end    
      end  
    end
  