module ApplicationHelper
  def icon_image_tag(user)
    if user.profile_image.attached?
      image_tag user.profile_image.variant(:icon), alt: user.name, class: 'w-full h-full object-cover'
    else
      content_tag :div, 'NO IMAGE', class: 'w-full h-full bg-base-200 flex justify-center items-center text-xs font-bold opacity-50'
    end
  end
end
