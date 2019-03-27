ActiveAdmin.register Notice do
  permit_params :notice_type, :message, :event_time, :location, :contact, :image

  show do
    attributes_table do
      row :notice_type
      row :message
      row :location
      row :contact
      row :event_time
      row(:image) {|n| n.image.attached? ? image_tag(n.image) : '-'}
    end
  end

  form do |f|
    f.inputs do
      f.input :notice_type, as: :select, collection: %i[notice event ask intro]
      f.input :message
      f.input :location
      f.input :contact
      f.input :event_time, as: :date_time_picker
      f.input :image, as: :file
    end
    f.actions
  end
end
