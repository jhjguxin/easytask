class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end


  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
#    @item = Item.new(params[:item])
    @task = Task.find(params[:task_id])
    #breakpoint
    @item = @task.items.new(params[:item])

 
    #breakpoint

    respond_to do |format|
      if @item.save
#        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.html { redirect_to @task, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
#        format.html { render action: "new" }
        format.html { redirect_to task_path(@task), notice: 'Item was not successfully created.' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  # GET /items/doitem
  # GET /items.json
  def doitem
    @item = Item.find(params[:item_id])
    @task = Task.find(params[:task_id])
    #breakpoint
    #(5 - @task.items.length).times { @task.items.build }
    (@item.count - @item.assets.count).times { @item.assets.build }
    #breakpoint
 
  end

  def updateitem
    @item = Item.find(params[:item_id])
    @task = Task.find(params[:task_id])
    #breakpoint
    @item.update_attributes(params[:item])
    #(5 - @task.items.length).times { @task.items.build }
    delete_empty_asset
    respond_to do |format|
      if @item.save
#        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.html { redirect_to @task, notice: 'Item was successfully update.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        (@item.count - @item.assets.count).times { @item.assets.build }
#        format.html { render action: "new" }
        format.html { redirect_to "/tasks/#{@task.id}/items/#{@item.id}/doitem", notice: 'Item was not successfully created.' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  protected
  def delete_empty_asset
    @item.assets.each do |a|
      if a.username=='' or a.url==''
        a.destroy
      end
    end
  end

end
