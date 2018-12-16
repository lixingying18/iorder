class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index:users,:email,unique:true
    add_index:users,:name,unique:true
    add_index:users, :phonenum,unique:true
  end
end
