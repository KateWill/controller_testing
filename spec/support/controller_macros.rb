# creates a user and logs them in because of devise

module ControllerMacros
  def login_user
    # before all of our tests make sure a user is logged in
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.create(
        email: 'sam@test.com',
        password: 'password',
        first_name: 'Sam',
        last_name: 'Robinson',
        age: 32
      )
      sign_in @user
    end
  end
end