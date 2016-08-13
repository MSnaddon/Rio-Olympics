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

