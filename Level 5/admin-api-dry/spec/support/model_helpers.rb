require 'faker'
require 'factory_bot_rails'

module ModelHelpers

  def create_model
    FactoryBot.create(:models,
            email: Faker::Internet.email,
            password: Faker::Internet.password
        )
  end

    def build_model
    FactoryBot.build(:models,
            email: Faker::Internet.email,
            password: Faker::Internet.password
        )
  end

end
