def stock_picker(stock_projections)
    x=0
    sale_element=0
    element_position=0
    element_count=Array.new(stock_projections)
    profit=0
    profits_array=[]
    max_profit_array=[]
    cost_profit=[]
    position=0
    update_position=0
    best_day_array=[]
    
    stock_projections.each do |cost_element|
        #pop element_count array where the value is equal to the cost element
       element_position=element_count.index(cost_element)
       element_count.delete_at(element_position)
        if cost_element != stock_projections.last then
            #then use that arrays length as the loop
            while x< element_count.length do
                update_position=x
                position=stock_projections.index(cost_element) + update_position
                profit= element_count[x] - cost_element.to_i
                profits_array.push(profit)
                x+=1
            end
            max_profit_array.push(profits_array.max)
            cost_profit.push([cost_element,profits_array.max])
            profits_array=Array.new
            x=0
        end
    end
    cost_profit.each do |element|
        if element.include?(max_profit_array.max) then
            sale_element= element[0]+element[1]
            best_day_array.push(stock_projections.index(element[0]),stock_projections.index(sale_element))
            return best_day_array
        end
    end
end
