namespace :datashift do

  desc "Export all "
  task :export_all => :environment do
    Rails.application.eager_load!
    models = ActiveRecord::Base.descendants
    models.each do |model|
      result = %x(bundle exec thor datashift:export:excel --model=#{model.name} --result=bin/#{model.name}.xls)
      puts "#{model.name} RESULT: #{result.blank? ? 'OK' : result}"
    end
  end

end
