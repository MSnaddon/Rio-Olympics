get "/nation" do
  @nation = Nation.all
  erb(:'nation/index')
end

get "/nation/new" do
  erb(:'nation/new')
end

post "/nation" do
  @nation = Nation.new(params)
  @nation.save
  erb(:'nation/create')
  redirect(to("/nation"))
end


get "/nation/:id" do
  @nation = Nation.find(params[:id])
  erb(:'nation/show')
end

post "/nation/:id" do
  nation = Nation.new(params)
  nation.update
  redirect(to("nation/#{params[:id]}"))
end


get "/nation/:id/edit" do
  @nation = Nation.find(params[:id])
  erb(:'nation/edit')
end

post "/nation/:id/delete" do
  Nation.delete(params[:id])
  redirect(to("nation/#{params[:id]}"))
end