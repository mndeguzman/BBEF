include ActionView::Helpers::TextHelper

module TableHelper
 
 def self.assert_table_is_present(model_name,page)
    page.has_css?("##{model_name.pluralize}").should == true
 end

  def self.compareTable(table,table_header_contents,model_name,page)
  table_header = [table_header_contents]
   table_result_loctaion = "##{model_name.pluralize} tr.#{model_name}"
   page.has_css?(table_result_loctaion) === true
   table_results = page.all(table_result_loctaion).map do |row|
      row_values = []
      row.all('td').reject {|cell| cell['class'] =~ /action_link/}.each do |cell|
          row_values << cell.text.strip
          if cell['class']
            cell['class'].split(" ").each do |display_class|
              if(display_class =~ /display_as_(.*)/)
                row_values << $1
              end
            end
          end
      end
      row_values
  end
  table.diff!(table_header+table_results)
 end

end