
FixtureBuilder.configure do |fbuilder|
  # rebuild fixtures automatically when these files change:
  fbuilder.files_to_check += Dir["spec/factories/*.rb", "spec/support/fixture_builder.rb"]

  # now declare objects
  fbuilder.factory do
    fbuilder.name :default, User.create!(name: "Fake User", first_name: "Fake", email: "test@example.com")
    fbuilder.name :another_user, User.create!(name: "Super Fake User", first_name: "Fakey faker", email: "test2@example.com")
  end
end
