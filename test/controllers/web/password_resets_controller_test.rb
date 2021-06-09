require "test_helper"

class Web::PasswordResetsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    user = create(:user)

    assert_emails 1 do
      post :create, params: { password_reset_form: { email: user.email } }
    end

    assert_response :success
  end

  test "should get edit" do
    user = create(:user)
    user.generate_password_reset_token!

    get :edit, params: { id: user.password_reset_token, email: user.email }
    assert_response :success
  end

  test "should get update" do
    user = create(:user)
    user.generate_password_reset_token!

    new_password = generate(:string)

    attrs = {
      password: new_password,
      password_confirmation: new_password,
    }

    patch :update, params: { id: user.password_reset_token, email: user.email, user: attrs }
    assert_response :redirect
  end
end
