# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
TaskList.destroy_all
Chatroom.destroy_all
Message.destroy_all
Invitation.destroy_all
TaskCategory.destroy_all
Level.create(name: "one", description: "This is the first level", min_points: 0)

TaskCategory.create(name: "Work", description: "The work category")
TaskCategory.create(name: "Exercise", description: "The work category")
TaskCategory.create(name: "Chores", description: "The work category")
