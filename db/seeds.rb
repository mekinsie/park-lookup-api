class Seed

  def self.begin
    Park.destroy_all
    State.destroy_all
    seed = Seed.new
    seed.generate_parks
  end

  def generate_parks
    states_list = ['Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Federated States of Micronesia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Marshall Islands','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Mariana Islands','Ohio','Oklahoma','Oregon','Palau','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virgin Island','Virginia','Washington','West Virginia','Wisconsin','Wyoming']
    type = ["State park", "National park"]
    states_list.each do |state|
      park_state = State.create!(name: state)
      5.times do |i|
        Park.create!(name: Faker::Name.middle_name, type: type.sample, state_id: park_state.id
        )
      end
    end
    puts "Generated #{State.count} states and #{Park.count} parks."
  end
end
Seed.begin