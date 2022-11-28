class UserTicketSerializer < ActiveModel::Serializer
  attributes :id, :price, :production

  def production
    {title: object.production.title}
  end 

  def price 
    "$#{'%.2f' % object.price}"
  end 
end
