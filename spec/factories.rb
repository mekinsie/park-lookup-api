FactoryBot.define do


  factory(:park) do
    State.create!(name: "Oregon")
    type_array = ["State park", "National park"]
    name {Faker::Name.middle_name }
    park_type { type_array.sample }
    state_id { 1 }
  end

  factory(:state) do
    name { Faker::Address.state }
  end

end