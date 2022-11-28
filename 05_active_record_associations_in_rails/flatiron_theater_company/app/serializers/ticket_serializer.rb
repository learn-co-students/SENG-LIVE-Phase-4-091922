class TicketSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :user
  has_one :production

  # def production
  #   {title: object.production.title}
  # end 
end
