class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,                    type: String
  field :email,                   type: String
  field :dob,                     type: Date
  field :gender,                  type: String
  field :phone_number,            type: String
  field :password,                type: String

  index( { email: 1 },                 { unique: true })
  index( { name: 1 },                  { background: true })
  index( { email: 1, sort_name: 1 },   { background: true })
  index( { name: 1, sort_name: 1 },    { background: true })
  index( { created_at: 1 },            { background: true })

end
