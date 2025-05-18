class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
  # Method to calculate color based on price
  # Higher price = more red, lower price = whiter
  def color
    # Normalize price to a value between 0 and 1
    # You might want to adjust max_price based on your data
    max_price = 1000.0
    normalized_price = [price.to_f / max_price, 1.0].min
    
    # Calculate red component (255 is always max)
    red = 255
    
    # Calculate green and blue components (lower as price increases)
    # 255 for price=0, approaching 0 for high prices
    green = blue = (255 * (1 - normalized_price)).to_i
    
    # Return hex color code
    format("#%02x%02x%02x", red, green, blue)
  end
end