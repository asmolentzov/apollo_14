require 'rails_helper'

# User Story 1 of 4
# 
# As a visitor,
# When I visit '/astronauts'
# I see a list of astronauts with the following info:
# - Name
# - Age
# - Job
# 
# (e.g. "Name: Neil Armstrong, Age: 37, Job: Commander")

describe 'As a visitor to the app' do
  it 'I see a list of astronauts' do
    astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Commander")
    
    visit astronauts_path
    
    expect(page).to have_content(astronaut.name)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content("Job: #{astronaut.job}")
    expect(page).to have_content("Job: #{astronaut_2.job}")
    expect(page).to have_content("Age: #{astronaut.age}")
    expect(page).to have_content("Age: #{astronaut_2.age}")
  end
end