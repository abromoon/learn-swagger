class RegionSale < ApplicationRecord
  self.table_name = 'region_sales'

  belongs_to :region
  belongs_to :GamePlatform
end
