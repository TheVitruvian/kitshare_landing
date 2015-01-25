
User.delete_all
Kit.delete_all
Rental.delete_all
Endorsement.delete_all
InsurancePolicy.delete_all
InsuranceClaim.delete_all
KitRating.delete_all

user = User.create!(user_name: "Alex", first_name: "Alex", last_name: "Hamlin", address: "19 Tunley Road", postcode: "sw17 7qh", profile_picture: nil, email: "alexham100@aol.com", password: "password", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget lacinia urna. Duis sodales porttitor odio vitae dictum. Maecenas venenatis rutrum sem, et suscipit orci pretium sit amet. Curabitur convallis ligula in eros pulvinar ornare. Donec at lacus rhoncus massa sagittis posuere. Vestibulum at mattis felis, ut molestie eros. Aenean at turpis tempus, ornare libero nec, vestibulum lacus. Donec elementum euismod odio. Duis felis massa, accumsan eu neque in, pretium dictum nulla. Sed auctor erat sit amet feugiat maximus.

Nunc mattis velit in turpis efficitur, sed vestibulum mi pharetra. Fusce pharetra eu lorem ac vulputate. Vestibulum quis tellus in turpis tempor hendrerit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vitae enim orci. Ut hendrerit, nulla id dictum blandit, nisl felis faucibus felis, pretium aliquet libero lacus et odio. Phasellus fermentum, felis id laoreet hendrerit, lacus erat iaculis odio, luctus accumsan ipsum lorem in quam. Ut non mi et ante tristique accumsan non condimentum libero. In mollis gravida libero, vitae convallis sem. Donec non tellus eget tortor laoreet tristique. Pellentesque malesuada nisl id nisl euismod, non efficitur sem efficitur. Fusce eu lacinia diam. Praesent venenatis vel sapien ut ultrices. Nam tempor tortor eget nunc aliquet, eu egestas ante mollis.", activities: "Ski'ing, Snowboarding, Dogging")

user2 = User.create!(user_name: "Neha", first_name: "Neha", last_name: "Shah", address: "123 Poo Street", postcode: "P00 4U", profile_picture: nil, email: "neha.shah@whateva.com", password: "password")

kit1 = Kit.create!(category: "Skiing", 
                                kind: "Skis", 
                                daily_price: 30, 
                                weekly_price: 90, 
                                monthly_price: 300, 
                                condition: "good", 
                                description: "Lorum Ipsum", 
                                insurance_required: true, 
                                location: "SW120DF")
kit2 = Kit.create!(category: "Skiing", 
                                kind: "Skis", 
                                daily_price: 30, 
                                weekly_price: 90, 
                                monthly_price: 300, 
                                condition: "good", 
                                description: "Lorum Ipsum", 
                                insurance_required: true, 
                                location: "London")

kitrating1 = KitRating.create!(rating: 4, content: "Great skis, worth every penny!", author_id: 2)

endorsement1 = Endorsement.create!(user_id: 1, author_id: 2, rating: 5, content: "Awesome chap!", title: "MEGA!")

rental1 = Rental.create!(renter_id: 1, start_date: "2014-08-03", end_date: "2014-08-06", cost: 233, status: "open", kit_id: 1)
rental2 = Rental.create!(renter_id: 2, start_date: "2014-08-08", end_date: "2014-08-09", cost: 133, status: "open", kit_id: 1)

insurance = InsurancePolicy.create!(policy_number: 1, price: 20, start_date: "2014-08-08", end_date: "2015-08-08")
claim = InsuranceClaim.create!(claim_number: 001, cost: 302, closed: true, closed_date: "2014-08-08")




insurance.insurance_claims << claim
user.insurance_policies << insurance

user.kits << kit1
user.kits << kit2

user.endorsements << endorsement1
user2.rentals << rental1


kit1.rentals << rental1
kit1.rentals << rental2
kit1.kit_ratings << kitrating1

user.rentals << rental1
user.rentals << rental2



