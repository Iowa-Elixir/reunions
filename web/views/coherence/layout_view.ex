defmodule Coherence.LayoutView do
  ## commented out default view
  # use Reunions.Coherence.Web, :view

  use Phoenix.View, root: "web/templates"
  # Import convenience functions from controllers
  import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

  # Use all HTML functionality (forms, tags, etc)
  use Phoenix.HTML

  import Reunions.Router.Helpers
  import Reunions.ErrorHelpers
  import Reunions.Gettext
  import Reunions.Coherence.ViewHelpers

end
