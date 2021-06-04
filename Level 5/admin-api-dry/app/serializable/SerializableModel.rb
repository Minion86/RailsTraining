class SerializableModel < JSONAPI::Serializable::Resource
  type 'models'

  attributes :email

  link :self do
    #@url_helpers.model_url(@object.id)
  end
end
