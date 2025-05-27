# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"
require 'date'

csv_path = Rails.root.join("db", "seed_files", "concerts_data.csv")

CSV.foreach(csv_path, headers: true) do |row|

  date_string = row["date"]
  date = Date.parse("#{date_string}2025")
  puts Event.create!(
    url: row["link"],
    title: row["name"],
    date: date,
    price: row["price"]
  )
end
