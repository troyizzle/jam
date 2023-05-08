# frozen_string_literal: true
require 'seeds_helper'

def seed(file)
  load Rails.root.join('db', 'seeds', "#{file}.rb")
  puts "Seeded #{file}"
end

puts "Seeding #{Rails.env} environment"
seed 'users'
seed 'betting_books'
