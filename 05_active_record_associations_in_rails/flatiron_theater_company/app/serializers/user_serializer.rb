class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :tickets, serializer: UserTicketSerializer  
  # has_many :productions
end
