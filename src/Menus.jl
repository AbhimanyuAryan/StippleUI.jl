module Menus

using Genie, Stipple, StippleUI, StippleUI.API
import Genie.Renderer.Html: HTMLString, normal_element, register_normal_element

export menu

register_normal_element("q__menu", context = @__MODULE__)

function menu(
              fieldname::Union{Symbol,Nothing} = nothing,
              args...;
              content::Union{String,Vector} = "",
              kwargs...)

  q__menu(args...; kw([:fieldname => fieldname, kwargs...])...) do
    join(content)
  end
end

function menu(content::Function,
              fieldname::Union{Symbol,Nothing} = nothing,
              args...;
              kwargs...)
  menu(label, fieldname, args...; content = content(), kwargs...)
end

end
