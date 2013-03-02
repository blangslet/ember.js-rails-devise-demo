# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create(name: "Ribs n' Grits")
Company.create(name: "Braveheart Brewery")

CompanyMembership.create(name: "Johnny", company_id: 1, user_id: 1)
CompanyMembership.create(name: "Plato", company_id: 1, user_id: 1)
CompanyMembership.create(name: "Marmelade", company_id: 1, user_id: 1)
CompanyMembership.create(name: "Bubba", company_id: 1, user_id: 1)
CompanyMembership.create(name: "Aristotle", company_id: 2, user_id: 1)
CompanyMembership.create(name: "Maybeline", company_id: 2, user_id: 1)

Post.create(title: "Post1", body: "Post 1 body", company_id: 1)
Post.create(title: "Post2", body: "Post 2 body", company_id: 1)
Post.create(title: "Post3", body: "Post 3 body", company_id: 1)
Post.create(title: "Post4", body: "Post 4 body", company_id: 2)
Post.create(title: "Post5", body: "Post 5 body", company_id: 2)

Comment.create(post_id: 1, description: "Great post!", is_active: true, rank: 11, company_id: 1)
Comment.create(post_id: 1, description: "Post sucks.", is_active: true, rank: 5, company_id: 1)
Comment.create(post_id: 1, description: "Nice style", is_active: false, rank: 7, company_id: 1)
Comment.create(post_id: 2, description: "Horrible writing", is_active: true, rank: 9, company_id: 1)
Comment.create(post_id: 3, description: "Ember.js FTW", is_active: true, rank: 10, company_id: 1)
Comment.create(post_id: 4, description: "Get up get out n' get something", is_active: false, rank: 8, company_id: 1)
Comment.create(post_id: 1, description: "Great post!", is_active: true, rank: 1, company_id: 1)
Comment.create(post_id: 1, description: "Post sucks.", is_active: true, rank: 5, company_id: 1)
Comment.create(post_id: 1, description: "Nice style", is_active: true, rank: 3, company_id: 1)
Comment.create(post_id: 2, description: "Horrible writing", is_active: true, rank: 2, company_id: 1)
Comment.create(post_id: 3, description: "Ember.js FTW", is_active: true, rank: 4, company_id: 1)
Comment.create(post_id: 4, description: "Get up get out n' get something", is_active: true, rank: 6, company_id: 1)
Comment.create(post_id: 1, description: "Great post!", is_active: true, rank: 1, company_id: 2)
Comment.create(post_id: 1, description: "Post sucks.", is_active: false, rank: 5, company_id: 2)
Comment.create(post_id: 1, description: "Nice style", is_active: true, rank: 3, company_id: 2)
Comment.create(post_id: 2, description: "Horrible writing", is_active: true, rank: 2, company_id: 2)
Comment.create(post_id: 3, description: "Ember.js FTW", is_active: false, rank: 4, company_id: 2)
Comment.create(post_id: 4, description: "Get up get out n' get something", is_active: true, rank: 6, company_id: 2)
