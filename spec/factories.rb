FactoryBot.define do

  factory(:park) do
    type_array = ["State park", "National park"]
    name {Faker::Name.middle_name }
    park_type { type_array.sample }
    state_id { 1 }
  end

end