module ApiHelpers

  def json
    JSON.parse(response.body)
  end

  def login_with_api(model)
    post '/login', params: {
      model: {
        email: model.email,
        password: model.password
      }
    }
  end

end
