# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Room.create!([
    {
        name: 'Main meeting room',
        room_type: 'Meeting Room'
    },
    {
        name: 'Privacy booth 1',
        room_type: 'Phone Booth'
    },
    {
        name: 'Privacy booth 2',
        room_type: 'Phone Booth'
    },
    {
        name: 'Privacy booth 3',
        room_type: 'Phone Booth'
    },
])
User.create!([
    {
        name: "Derrick Loo",
        email: 'derrick.loo@omnihr.co',
        organization: 'Omni HR',
        admin: true,
        password: 'secret',
        password_confirmation: 'secret'
    },
    {
        name: "Brian Ip",
        email: 'brian.ip@omnihr.co',
        organization: 'Omni HR',
        admin: true,
        password: 'secret',
        password_confirmation: 'secret'
    },
    {
        name: "Nara",
        email: 'nara@ideaink.co',
        organization: 'Idea Ink',
        admin: true,
        password: 'secret',
        password_confirmation: 'secret'
    },
    {
        name: "Yu Hu",
        email: 'yuhu@kaito.ai',
        organization: 'Kaito',
        admin: true,
        password: 'secret',
        password_confirmation: 'secret'
    },
])