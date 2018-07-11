# Copyright 2016 Trimble Inc
# Licensed under the MIT license

require 'sketchup.rb'

module Zjonn
  module NewPoint

    # This method creates a simple cube inside of a group in the model.
    def self.add_point
      # We need a reference to the currently active model. The SketchUp API
      # currently only lets you work on the active model. Under Windows there
      # will be only one model open at a time, but under OS X there might be
      # multiple models open.
      #
      # Beware that if there is no model open under OS X then `active_model`
      # will return nil. In this example we ignore that for simplicity.
      model = Sketchup.active_model

      # Whenever you make changes to the model you must take care to use
      # `model.start_operation` and `model.commit_operation` to wrap everything
      # into a single undo step. Otherwise the user risks not being able to
      # undo everything and she may loose work.
      #
      # Making sure your model changes are undoable in a single undo step is a
      # requirement of the Extension Warehouse submission quality checks.
      #
      # Note that the first argument name is a string that will be appended to
      # the Edit > Undo menu - so make sure you name your operations something
      # the users can understand.
      model.start_operation('Add Point', true)

      # Creating a group via the API is slightly different from creating a
      # group via the UI.  Via the UI you create the faces first, then group
      # them. But with the API you create the group first and then add its
      # content directly to the group.
      selection = model.selection
      entities = model.entities
      p "TEST"

      if selection != nil

        point = selection[0].vertices[0].position
        point.x+=10
        point.y+=10
        point.z+=10

        for ent in selection
          selection.each do |sec|
            case sec
            when Sketchup::Face
              sec.vertices{|sec2| entities.add_face sec2.start.position, sec2.end.position, point}
            else
              entities.add_face sec.start.position, sec.end.position, point
            end
          end
        end
      end

      # Finally we are done and we close the operation. In production you will
      # want to catch errors and abort to clean up if your function failed.
      # But for simplicity we won't do this here.
      model.commit_operation
    end

    # Here we add a menu item for the extension. Note that we again use a
    # load guard to prevent multiple menu items from accidentally being
    # created.
    #unless file_loaded?(__FILE__)

      # We fetch a reference to the top level menu we want to add to. Note that
      # we use "Plugins" here which was the old name of the "Extensions" menu.
      # By using "Plugins" you remain backwards compatible.
      menu = UI.menu('Plugins')

      # We add the menu item directly to the root of the menu in this example.
      # But if you plan to add multiple items per extension we recommend you
      # group them into a sub-menu in order to keep things organized.
      menu.add_item('New Point') {
        self.add_point
      }

      toolbar = UI::Toolbar.new "Test"
      # This toolbar icon simply displays Hello World on the screen
      cmd = UI::Command.new("Test") {
        self.add_point
      }
      cmd.small_icon = "newPoint.png"
      cmd.large_icon = "newPoint.png"
      cmd.tooltip = "Zaznacz kilka punktów i kliknij"
      cmd.status_bar_text = "W ten sposób stworzysz nowy punkt połączony z całą resztą :D"
      cmd.menu_text = "New point"
      toolbar = toolbar.add_item cmd
      toolbar.show

      file_loaded(__FILE__)
    #end

  end # module HelloCube
end # module Examples
