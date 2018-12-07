require 'rails_helper'

# User Story 2 of 4
# 
# As a visitor,
# When I visit '/astronauts'
# I see the average age of all astronauts.
# 
# (e.g. "Average Age: 34")

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
  it 'sees average age of astronauts' do
    astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Commander")
    astronaut_3 = Astronaut.create(name: "Astronaut", age: 39, job: "Commander")
    
    visit astronauts_path
    
    expect(page).to have_content("Average Age: #{Astronaut.average_age}")
  end
end