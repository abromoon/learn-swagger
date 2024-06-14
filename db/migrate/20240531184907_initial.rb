class Initial < ActiveRecord::Migration[7.1]
  def up
    execute File.read("#{Rails.root}/db/01_reference_data.sql")
    execute File.read("#{Rails.root}/db/02_game.sql")
    execute File.read("#{Rails.root}/db/03_game_publisher.sql")
    execute File.read("#{Rails.root}/db/04_game_platform.sql")
    execute File.read("#{Rails.root}/db/05_region_sales.sql")
  end

  def down
  end
end
