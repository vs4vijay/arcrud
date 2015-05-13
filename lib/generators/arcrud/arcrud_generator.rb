require 'rails/generators/base'

class ArcrudGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :entity_name, :type => :string, :default => "entity"

  class_option :angular_only, :type => :boolean, :default => false, :description => "Only include angular codebase NOT RoR."

  def copy_entity_base
    angular_app_location = 'app/assets/javascripts/app'
    #copy_file "entity/entity-ctrl.js", angular_app_location + "/#{file_name}/#{file_name}-ctrl.js"

    # Copy the entity templates to app codebase
    directory 'entity', angular_app_location + '/%file_name%'

    # Add routes to state provider
    inject_into_file angular_app_location + '/app.js', :after => "\t$stateProvider" do
      "\n\t\t\t.state('" + file_name + "', {
        url: '/" + file_name + "',
        controller: '" + file_name.capitalize + "Ctrl',
        templateUrl: 'app/" + file_name + "/" + file_name + ".html',
        resolve: {
          " + file_name.capitalize + "List: ['" + file_name.capitalize + "Service', function(" + file_name.capitalize + "Service) {
            return " + file_name.capitalize + "Service.query();
          }]
        }
      })\n"
    end

  end

  private

  def file_name1
    entity_name.underscore
  end

end
