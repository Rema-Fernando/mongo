class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  after_create :print_detail

  has_and_belongs_to_many :blogs

  user = User.first
  user.blogs.each do |blog|
    puts "blog: #{blog.title}"
  end

  has_secure_password

  def print_detail
    ExampleJob.perform_now(self.id)
  end


    validates :password, presence: true, on: :create
    validates :password, length: { minimum: 6 }, allow_blank: true, allow_nil: true
    # after_create :
    # validates_presence_of :first_name, :last_name, :email_id, :mobile_number, :password
    # allow_blank: true, allow_nil: true
    def email_verification
        user_hash = self.as_json(only: [:_id, :email])
        puts user_hash
        # binding.pry
        TokenHandler.encode(user_hash, expiry: 1.hours.from_now.to_i)
    end
end