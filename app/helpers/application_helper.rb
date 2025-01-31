module ApplicationHelper
  def task_status_color(status)
    case status
    when "completed" then "text-green-600"
    when "in_progress" then "text-blue-600"
    when "pending" then "text-yellow-600"
    else "text-gray-600"
    end
  end

  def task_status_badge(status)
    case status
    when "completed" then "bg-green-100 text-green-800 px-2 py-1 rounded-full"
    when "in_progress" then "bg-blue-100 text-blue-800 px-2 py-1 rounded-full"
    when "pending" then "bg-yellow-100 text-yellow-800 px-2 py-1 rounded-full"
    else "bg-gray-100 text-gray-800 px-2 py-1 rounded-full"
    end
  end
end
