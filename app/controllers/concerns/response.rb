module Response
  def render_resource(resource)
    data_render =  ActiveModelSerializers::SerializableResource.new resource
    render json: {
      success: true,
      data: data_render,
    }
  end

  def render_resource_nil 
    render json: {
      success: true,
      data: {}
    }
  end
end
