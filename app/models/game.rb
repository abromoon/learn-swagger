class Game < ApplicationRecord
  self.table_name = 'game'

  belongs_to :genre
end
