class TableWarsController < ApplicationController
  # GET /table_wars
  # GET /table_wars.json
  before_filter :auth_user

   def auth_user
    redirect_to new_user_session_url unless user_signed_in?
  
  end

  def createpoint
  @clicked_id = params["clicked_id"].to_i
  @attack_speed = params["attack_speed"]
  @accuracy = params["accuracy"]
  @speed = params["speed"]
  @attack_damage = params["attack_damage"]
  @defense = params["defense"]
  @unit_id = params["unit_id"].to_i
  @unit = Unit.where(:id => @unit_id)
  @unit.each do |uu|
     uu["clicked_id"] = @clicked_id
     uu.save
  end
 
  @point = Point.where(:unit_id => @unit_id)
  if @point.count == 0
    then
      @point = Point.new
      @point.unit_id = @unit_id
      @point.attack_speed = @attack_speed
      @point.accuracy = @accuracy
      @point.speed = @speed
      @point.attack_damage = @attack_damage
      @point.defense = @defense
      @point.save

    else

      @point.each do |pp|
        pp["unit_id"] = @unit_id
        pp["attack_speed"] = @attack_speed
      pp["accuracy"] = @accuracy
      pp["speed"] = @speed
      pp["attack_damage"] = @attack_damage
      pp["defense"] = @defense
      pp.save



      end
    end
  

  respond_to do |format| 
      format.html
  end

  end

  def createunit

    @A = params[:A]
    @B = params[:B]
    @C = params[:C]
    @D = params[:D]
    counter = 0
    counter = @A

    15.times do |count|

      @unit = Unit.new
      @unit.name = "A"
      @unit.user = current_user
      @unit.save

      break if count.to_i == @A.to_i - 1
    end

    15.times do |count|

      @unit = Unit.new
      @unit.name = "B"
      @unit.user = current_user
      @unit.save

      break if count.to_i == @B.to_i - 1
    end

    15.times do |count|

      @unit = Unit.new
      @unit.name = "C"
      @unit.user = current_user
      @unit.save

      break if count.to_i == @C.to_i - 1
    end

    15.times do |count|

      @unit = Unit.new
      @unit.name = "D"
      @unit.user = current_user
      @unit.save

      break if count.to_i == @D.to_i - 1
    end
    respond_to do |format|
        format.html
    end





  end

  def newunit
    @unit = Unit.new

    @ExitedUnit = Unit.where(:user_id => current_user.id)

     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_war }
    end

  end

  def index
    @table_wars = TableWar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_wars }
    end
  end

  # GET /table_wars/1
  # GET /table_wars/1.json
  def show
    @table_war = TableWar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_war }
    end
  end

  # GET /table_wars/new
  # GET /table_wars/new.json
  def new
    @table_war = TableWar.new
     @AA = 0.to_i

     @BB = 0.to_i

     @CC = 0.to_i

     @DD = 0.to_i
     counter = 0
     counter1 = 0
    @unit = Unit.where(:user_id => current_user.id)
    @Arrayids = Array.new

    @Arrayfoundclick = Array.new(0)

    @Arrayfoundname = Array.new(0)

    @Arrayfoundunit = Array.new(0)

    @unit.each do |uu|

      if (uu["name"] == "A" && uu["clicked_id"] == -1)

        then @AA  = @AA + 1
        @Arrayids[counter] = uu["id"].to_s
        counter = counter + 1
      elsif (uu["name"] == "A" && uu["clicked_id"] > -1)
        then 
        @Arrayfoundclick[counter1] = uu["clicked_id"]
        @Arrayfoundunit[counter1] = uu["id"].to_s
        @Arrayfoundname[counter1] = uu["name"]
        counter1 = counter1 + 1
      end


      if (uu["name"] == "B" && uu["clicked_id"] == -1)
        then @BB  = @BB + 1
        @Arrayids[counter] = uu["id"].to_s
        counter = counter + 1
      elsif (uu["name"] == "B" && uu["clicked_id"] > -1)
        then 
        @Arrayfoundclick[counter1] = uu["clicked_id"]
        @Arrayfoundunit[counter1] = uu["id"].to_s
        @Arrayfoundname[counter1] = uu["name"]
        counter1 = counter1 + 1
      end


      if (uu["name"] == "C" && uu["clicked_id"] == -1)
        then  @CC = @CC + 1
        @Arrayids[counter] = uu["id"].to_s
        counter = counter + 1
      elsif (uu["name"] == "C" && uu["clicked_id"] > -1)
        then 
        @Arrayfoundclick[counter1] = uu["clicked_id"]
        @Arrayfoundunit[counter1] = uu["id"].to_s
        @Arrayfoundname[counter1] = uu["name"]
        counter1 = counter1 + 1
      end


      if (uu["name"] == "D" && uu["clicked_id"] == -1)
        then @DD = @DD + 1
        @Arrayids[counter] = uu["id"].to_s
        counter = counter + 1
      elsif (uu["name"] == "D" && uu["clicked_id"] > -1)
        then 
        @Arrayfoundclick[counter1] = uu["clicked_id"]
        @Arrayfoundunit[counter1] = uu["id"].to_s
        @Arrayfoundname[counter1] = uu["name"]
        counter1 = counter1 + 1
      end

    end

    #@Arrayids = @Arrayids.to_json.html_safe

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_war }
    end
  end

  # GET /table_wars/1/edit
  def edit
    @table_war = TableWar.find(params[:id])
  end

  # POST /table_wars
  # POST /table_wars.json
  def create
    @table_war = TableWar.new(params[:table_war])

    respond_to do |format|
      if @table_war.save
        format.html { redirect_to @table_war, notice: 'Table war was successfully created.' }
        format.json { render json: @table_war, status: :created, location: @table_war }
      else
        format.html { render action: "new" }
        format.json { render json: @table_war.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /table_wars/1
  # PUT /table_wars/1.json
  def update
    @table_war = TableWar.find(params[:id])

    respond_to do |format|
      if @table_war.update_attributes(params[:table_war])
        format.html { redirect_to @table_war, notice: 'Table war was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table_war.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_wars/1
  # DELETE /table_wars/1.json
  def destroy
    @table_war = TableWar.find(params[:id])
    @table_war.destroy

    respond_to do |format|
      format.html { redirect_to table_wars_url }
      format.json { head :no_content }
    end
  end
end
