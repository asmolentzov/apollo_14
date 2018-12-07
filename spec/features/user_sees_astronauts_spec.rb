require 'rails_helper'

describe 'As a visitor to the app' do
  it 'I see a list of astronauts' do
    astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Commander")
    
    visit astronauts_path
    
    within "#astronaut-#{astronaut.id}" do
      expect(page).to have_content(astronaut.name)
      expect(page).to have_content("Job: #{astronaut.job}")
      expect(page).to have_content("Age: #{astronaut.age}")
    end
    within "#astronaut-#{astronaut_2.id}" do
      expect(page).to have_content(astronaut_2.name)
      expect(page).to have_content("Job: #{astronaut_2.job}")
      expect(page).to have_content("Age: #{astronaut_2.age}")
    end
  end
  it 'sees average age of astronauts' do
    astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Commander")
    astronaut_3 = Astronaut.create(name: "Astronaut", age: 39, job: "Commander")
    
    visit astronauts_path
    
    expect(page).to have_content("Average Age: #{Astronaut.average_age.round(2)}")
  end
  it "should display missions for each astronaut in alphabetical order" do
    astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Commander")
    mission_1 = astronaut.missions.create(title: "Gemini 7", time_in_space: 20)
    mission_2 = astronaut.missions.create(title: "Capricorn 4", time_in_space: 20)
    mission_3 = astronaut.missions.create(title: "Apollo 13", time_in_space: 20)
    mission_4 = astronaut_2.missions.create(title: "Gemini 7", time_in_space: 20)
    mission_5 = astronaut_2.missions.create(title: "Apollo 13", time_in_space: 20)
    
    visit astronauts_path
    
    within "#astronaut-#{astronaut.id}" do
      expect(page).to have_content("Apollo 13\nCapricorn 4\nGemini 7")
    end
    within "#astronaut-#{astronaut_2.id}" do
      expect(page).to have_content("Apollo 13\nGemini 7")
    end
  end
  
  it "should show total time in space for each astronaut" do
    astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Commander")
    mission_1 = astronaut.missions.create(title: "Gemini 7", time_in_space: 20)
    mission_2 = astronaut.missions.create(title: "Capricorn 4", time_in_space: 30)
    mission_3 = astronaut.missions.create(title: "Apollo 13", time_in_space: 10)
    mission_4 = astronaut_2.missions.create(title: "Gemini 7", time_in_space: 10)
    mission_5 = astronaut_2.missions.create(title: "Apollo 13", time_in_space: 20)
    
    visit astronauts_path
    
    within "#astronaut-#{astronaut.id}" do
      expect(page).to have_content("Total Time in Space: #{astronaut.total_time_in_space} days")
    end
    within "#astronaut-#{astronaut_2.id}" do
      expect(page).to have_content("Total Time in Space: #{astronaut_2.total_time_in_space} days")
    end
  end
  
end