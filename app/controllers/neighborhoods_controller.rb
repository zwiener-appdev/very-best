class NeighborhoodsController < ApplicationController
  def index
    @q = Neighborhood.ransack(params.fetch("q", nil))
    @neighborhoods = @q.result(:distinct => true).includes(:venues).page(params.fetch("page", nil)).per(10)

    render("neighborhoods_templates/index.html.erb")
  end

  def show
    @venue = Venue.new
    @neighborhood = Neighborhood.find(params.fetch("id"))

    render("neighborhoods_templates/show.html.erb")
  end

  def new
    @neighborhood = Neighborhood.new

    render("neighborhoods_templates/new.html.erb")
  end

  def create
    @neighborhood = Neighborhood.new

    @neighborhood.name = params.fetch("name")
    @neighborhood.city = params.fetch("city")
    @neighborhood.state = params.fetch("state")

    save_status = @neighborhood.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/neighborhoods/new", "/create_neighborhood"
        redirect_to("/neighborhoods")
      else
        redirect_back(:fallback_location => "/", :notice => "Neighborhood created successfully.")
      end
    else
      render("neighborhoods_templates/new.html.erb")
    end
  end

  def edit
    @neighborhood = Neighborhood.find(params.fetch("id"))

    render("neighborhoods_templates/edit.html.erb")
  end

  def update
    @neighborhood = Neighborhood.find(params.fetch("id"))

    @neighborhood.name = params.fetch("name")
    @neighborhood.city = params.fetch("city")
    @neighborhood.state = params.fetch("state")

    save_status = @neighborhood.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/neighborhoods/#{@neighborhood.id}/edit", "/update_neighborhood"
        redirect_to("/neighborhoods/#{@neighborhood.id}", :notice => "Neighborhood updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Neighborhood updated successfully.")
      end
    else
      render("neighborhoods_templates/edit.html.erb")
    end
  end

  def destroy
    @neighborhood = Neighborhood.find(params.fetch("id"))

    @neighborhood.destroy

    if URI(request.referer).path == "/neighborhoods/#{@neighborhood.id}"
      redirect_to("/", :notice => "Neighborhood deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Neighborhood deleted.")
    end
  end
end
