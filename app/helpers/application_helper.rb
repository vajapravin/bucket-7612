module ApplicationHelper
  def alert_style(key)
    case key.to_sym
    when :notice then 'warning'
    when :alert, :error then 'danger'
    else key
    end
  end
end