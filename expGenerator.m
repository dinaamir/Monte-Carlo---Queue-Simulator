function output = expGenerator(cust);
    
group_of_numbers = round(randexp(ones(1,cust))*100);
    

for(j=1:cust)
   if(group_of_numbers(1,j)>101)
       if(group_of_numbers(1,j) >= 701 & group_of_numbers(1,j) <= 800)
            group_of_numbers(1,j) = group_of_numbers(1,j) - 700;
       elseif(group_of_numbers(1,j) >= 601 & group_of_numbers(1,j) <= 700)
            group_of_numbers(1,j) = group_of_numbers(1,j) - 600;
       elseif(group_of_numbers(1,j) >=501 & group_of_numbers(1,j) <= 600)
            group_of_numbers(1,j) = group_of_numbers(1,j) - 500;     
       elseif(group_of_numbers(1,j) >= 401 & group_of_numbers(1,j) <= 500)
            group_of_numbers(1,j) = group_of_numbers(1,j) - 400;
       elseif(group_of_numbers(1,j) >= 301 & group_of_numbers(1,j) <= 400)
            group_of_numbers(1,j) = group_of_numbers(1,j) - 300;
       elseif(group_of_numbers(1,j) >= 201 & group_of_numbers(1,j) <= 300)
            group_of_numbers(1,j) = group_of_numbers(1,j) - 200;
       elseif(group_of_numbers(1,j) >= 101 & group_of_numbers(1,j) <= 200)
            group_of_numbers(1,j) = group_of_numbers(1,j) - 100;
       end
   end
end

output = group_of_numbers;