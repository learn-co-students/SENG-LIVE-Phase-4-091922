class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :title, :director, :description, :budget, :ongoing
  has_many :cast_members

  def budget
    "$#{'%.2f' % object.budget}"
  end 

  def ongoing
    object.ongoing ? "Activley Showing" : "Not Showing"
  end 
                                                       

end
