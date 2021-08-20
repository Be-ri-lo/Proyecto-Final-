ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      #Usuarios
      column do
        panel "Usuario" do
          ul do
            User.all.map do |user|
              li link_to(user.name, admin_dashboard_path(user))
            end
          end
        end
      end

      #Entrenamientos
      column do
        panel "Entrenamientos recientes" do
          ul do
            Training.last(5).map do |training|
              li link_to(training.name, admin_dashboard_path(training))
            end
          end
        end
      end
      
      #Deportes
      column do
        panel "Deportes creados" do
          ul do
            Training.group(:sport).count
          end
        end
      end

      column do
        panel "Lugares totales creados hasta el momento" do
          para do
            Place.all.count do |place|
              place = Place.name
            end
          end
        end
      end
    end
  end 
  #content
end
