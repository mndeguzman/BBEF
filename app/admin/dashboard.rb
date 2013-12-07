ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

  render "summary"

  end # content
end



        # panel "Sponsors" do
        #   table_for Sponsor.order('created_at desc').limit(10) do
        #     column :first_name do |user|
        #       user.first_name
        #     end
        #     column :last_name do |user|
        #       user.last_name
        #     end
        #   end
        # end