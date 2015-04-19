
namespace :txtblx do
  desc "Import Textblocks from files"

  task import: :environment do

    txtdir = Rails.root.join('textblocks')
    puts "Looking for markdown files in #{txtdir}"
    Dir.glob(File.join(txtdir, "*.md")) do |mdfile|
      key = File.basename(mdfile, '.md')
      puts "Processing key '#{key}'"

      Txtblx::Textblock.find_or_create_by(key: key) do |txtb|
        description_indicator = '->'

        lines = File.readlines(mdfile)

        first_line = lines.first.strip
        if first_line.start_with?(description_indicator)
          description = first_line[description_indicator.length, first_line.length]
          content = lines[1, lines.length].join("\n")
        else
          description = key
          content = lines.join("\n")
        end

        puts " -- Created Textblock (#{description})"
        txtb.text = content
        txtb.description = description
        txtb.save
        txtb.publish
      end
    end
  end

  desc 'Print out all defined routes in match order, with names. Target specific controller with CONTROLLER=x.'
  task routes: :environment do
    all_routes = Txtblx::Engine.routes.routes
    require 'action_dispatch/routing/inspector'
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    puts inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER'])
  end
end
