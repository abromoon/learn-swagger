class GamePlatform < ApplicationRecord
  self.table_name = 'game_platform'

  belongs_to :GamePublisher
  belongs_to :Platform
end
