class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :address_line_1, :dob, :name, :age

  def name
     object.name
  end

  def age
    object.age
  end
end
