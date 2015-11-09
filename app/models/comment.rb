class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :post, inverse_of: :comments

  field :body, type: String
  field :user_id

  index( { user_id: 1 }, { background: true })

  def author
    User.find(self.user_id)
  end
end
