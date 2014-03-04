module ApplicationHelper

  def active_home
    active_matcher URI.decode(request.fullpath) == "/"
  end

  def active_if(url)
    active_matcher URI.decode(request.fullpath).match(url)
  end

  def active_matcher(matcher)
    matcher ? "active" : ""
  end
end
