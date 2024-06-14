class GamePublisher < ApplicationRecord
  self.table_name = 'game_publisher'
  
  belongs_to :game
  belongs_to :publisher
end
