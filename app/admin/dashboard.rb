ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Summary" do
          h2 "This is where the total students will go"
          h2 "This is where students without sponsors will show"
          h2 "This is the breakdown of male vs female"
          h2 "This will break down the number of people in different year levels"
        end

      end
    end

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