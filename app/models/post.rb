class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :comments do
    def find_by_user_id(user_id)
      where(user_id: user_id).first
    end
  end
  belongs_to :user

  field :title, type: String
  field :body, type: String
  field :starred, type: Boolean

  index({ starred: 1 })
end
