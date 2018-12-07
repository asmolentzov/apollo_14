require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:missions).through(:astronaut_missions)}
  end
  
  describe 'Class Methods' do
    describe '.average_age' do
      it 'should return the average age' do
        Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
        Astronaut.create(name: "Buzz Aldrin", age: 39, job: "Commander")
        Astronaut.create(name: "Astronaut", age: 40, job: "Commander")
        average_age = 38.67
        
        expect(Astronaut.average_age.round(2)).to eq(average_age)
      end
    end
  end
  
  describe 'Instance Methods' do
    describe '#sorted_missions' do
      it 'should return a sorted list of missions' do
        astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
        mission_1 = astronaut.missions.create(title: "Gemini 7", time_in_space: 20)
        mission_2 = astronaut.missions.create(title: "Capricorn 4", time_in_space: 20)
        mission_3 = astronaut.missions.create(title: "Apollo 13", time_in_space: 20)
        
        sorted = [mission_3, mission_2, mission_1]
        
        expect(astronaut.sorted_missions).to eq(sorted)
      end
    end
  end
end
