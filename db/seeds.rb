# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Clear existing data
StatusHistory.destroy_all
Comment.destroy_all
Project.destroy_all
User.destroy_all

# Create users
yasz = User.create!(name: "Yasz Yogi", email: "yasz@yoga.com")
betty = User.create!(name: "Sweaty Betty", email: "betty@sweat.net")
barry = User.create!(name: "Broflex Barry", email: "barry@bros.com")
gavin = User.create!(name: "Gavin Gains", email: "gavin@gym.lift")

# Create a project
project = Project.create!(
  name: "30-Day Shred Challenge",
  status: "open",
  user: betty
)

# Comments (conversation thread)
Comment.create!(body: "Day 1: I did 3 pushups and cried. Off to a strong start 💪", user: betty, project: project)
Comment.create!(body: "Is foam rolling supposed to make you want to scream?", user: yasz, project: project)
Comment.create!(body: "Protein pancakes are not real pancakes and I'm sad now", user: gavin, project: project)
Comment.create!(body: "I benched my emotions today. Gains.", user: barry, project: project)
Comment.create!(body: "I'm proud of us. Even though I skipped yesterday. And maybe today.", user: betty, project: project)

# Status history (status change log)
StatusHistory.create!(
  previous_status: "open",
  new_status: "closed",
  user: betty,
  project: project,
  created_at: Time.now + 5.days
)

# Update project status to reflect final state
project.update!(status: "closed")

puts "🌱 Seeded #{User.count} users, #{Project.count} project, #{Comment.count} comments, #{StatusHistory.count} status history record"


# Create another project
project2 = Project.create!(
  name: "10K Steps-a-Day Accountability Squad",
  status: "open",
  user: yasz
)

# Comments for new project
Comment.create!(body: "Forgot my Fitbit but I *felt* like I walked a lot. That counts, right?", user: yasz, project: project2)
Comment.create!(body: "Treadmill died at 8,732 steps. I carried it the rest of the way.", user: barry, project: project2)
Comment.create!(body: "Did laps around my kitchen during a Zoom call. Innovation.", user: betty, project: project2)
Comment.create!(body: "My dog hid from me when I said 'walk.' We’re both tired.", user: gavin, project: project2)

# Status change for new project
StatusHistory.create!(
  previous_status: "open",
  new_status: "closed",
  user: yasz,
  project: project2,
  created_at: Time.now + 3.days
)

# Final status update
project2.update!(status: "closed")