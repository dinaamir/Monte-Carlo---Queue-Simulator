function queue
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %start
    disp(' ');
    disp('   +-----------------------------------+');
    disp('   | Welcome to Maybank Service Centre |');
    disp('   +-----------------------------------+');
    disp(' ');
    
    %choose random generator
    disp('Please choose type of random number generator');
    disp('---------------------------------------------');
    disp('1 RANDI Uniformly Distributed Integer');
    disp('2 RANDEXP Exponentially Distributed Integer');
    disp('3 RAND Uniform Random Number Generator');
    choose = input('-> ');
    
    while (choose < 1 || choose > 3)
        disp('The number you chosen is not available ');
        disp(' ');
        disp('Please choose type of random number generator');
        disp('---------------------------------------------');
        disp('1 RANDI Uniformly Distributed Integer');
        disp('2 RANDEXP Exponentially Distributed Integer');
        disp('3 RAND Uniform Random Number Generator');
        choose = input('-> ');
    end
    
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %choose number of customers and max nummber of customer allowed in center
    disp(' ');
    disp('Please choose the number of customers for the simulation');
    disp('--------------------------------------------------------');
    cus_num = input('-> ');
    disp(' ');
    
    disp('Please choose the maximum number of customers that allowed to be in the centre');
    disp('------------------------------------------------------------------------------');
    max_cus = input('-> ');
    disp(' ');
    
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %create and display prob table (inter-arrival and service)
    
    %INTER-ARRIVAL PROBABILITY TABLE
     temp = rand(1,4);
         for (i=1:4)
             smallest = temp(1,i);
                 for (j=(i+1):4)
                     if (smallest > temp(1,j))
                         temp(1,i) = temp(1,j);
                         temp(1,j) = smallest;
                         smallest = temp(1,i);
                     end
                 end
         end
     while (round(temp(1,4)*100)/100 == 1)
         temp = rand(1,4);
         for (i=1:4)
             smallest = temp(1,i);
                 for (j=(i+1):4)
                     if (smallest > temp(1,j))
                         temp(1,i) = temp(1,j);
                         temp(1,j) = smallest;
                         smallest = temp(1,i);
                     end
                 end
         end
     end
         
    inter_time = [1,2,3,4,5];
    inter_CDF = [round(temp(1,1)*100)/100,round(temp(1,2)*100)/100,round(temp(1,3)*100)/100,round(temp(1,4)*100)/100,1];
    inter_prob = [round(temp(1,1)*100)/100,(round(temp(1,2)*100)/100-round(temp(1,1)*100)/100),(round(temp(1,3)*100)/100-round(temp(1,2)*100)/100),(round(temp(1,4)*100)/100-round(temp(1,3)*100)/100),(1-round(temp(1,4)*100)/100)];
    inter_range1 = [1, round(temp(1,1)*100+1), round(temp(1,2)*100+1), round(temp(1,3)*100+1), round(temp(1,4)*100+1)];
    inter_range2 = [round(temp(1,1)*100), round(temp(1,2)*100), round(temp(1,3)*100) , round(temp(1,4)*100), 100];
    disp(' ');
    disp('CUSTOMER INTER-ARRIVAL PROBABILITY TABLE');
    disp('     +------------------------+-------------+------+---------------------+');
    disp('     | Inter-arrival time(min)| Probability | CDF  | Random number range |');
    disp('     +------------------------+-------------+------+---------------------+');
        for (i=1:5)
            if(i < 5)
                fprintf('     |           %1.0f            |    %1.2f     | %1.2f |        %2.0f-%2.0f        |\n', [inter_time(1,i) inter_prob(1,i) inter_CDF(1,i) inter_range1(1,i) inter_range2(1,i)]);
            else
                fprintf('     |           %1.0f            |    %1.2f     | %1.2f |        %2.0f-%2.0f       |\n', [inter_time(1,i) inter_prob(1,i) inter_CDF(1,i) inter_range1(1,i) inter_range2(1,i)]);
            end
        end
    disp('     +------------------------+-------------+------+---------------------+');
    
    %SERVICE COUNTER 1 PROBABILITY TABLE    
    temp = rand(1,4);
         for (i=1:4)
             smallest = temp(1,i);
                 for (j=(i+1):4)
                     if (smallest > temp(1,j))
                         temp(1,i) = temp(1,j);
                         temp(1,j) = smallest;
                         smallest = temp(1,i);
                     end
                 end
         end
    while (round(temp(1,4)*100)/100 == 1)
         temp = rand(1,4);
         for (i=1:4)
             smallest = temp(1,i);
                 for (j=(i+1):4)
                     if (smallest > temp(1,j))
                         temp(1,i) = temp(1,j);
                         temp(1,j) = smallest;
                         smallest = temp(1,i);
                     end
                 end
         end
     end
     
    serviceA_time = [5,6,7,8,9];
    serviceA_CDF = [round(temp(1,1)*100)/100,round(temp(1,2)*100)/100,round(temp(1,3)*100)/100,round(temp(1,4)*100)/100,1];
    serviceA_prob = [round(temp(1,1)*100)/100,(round(temp(1,2)*100)/100-round(temp(1,1)*100)/100),(round(temp(1,3)*100)/100-round(temp(1,2)*100)/100),(round(temp(1,4)*100)/100-round(temp(1,3)*100)/100),(1-round(temp(1,4)*100)/100)];
    serviceA_range1 = [1, round(temp(1,1)*100+1), round(temp(1,2)*100+1), round(temp(1,3)*100+1), round(temp(1,4)*100+1)];
    serviceA_range2 = [round(temp(1,1)*100), round(temp(1,2)*100), round(temp(1,3)*100), round(temp(1,4)*100), 100];
    disp(' ');
    disp('SERVICE COUNTER 1 PROBABILITY TABLE');
    disp('     +-------------------------------+-------------+------+---------------------+');
    disp('     |Service time for Counter 1(min)| Probability | CDF  | Random number range |');
    disp('     +-------------------------------+-------------+------+---------------------+');
        for (i=1:5)
            if(i < 5)
                fprintf('     |               %1.0f               |    %1.2f     | %1.2f |        %2.0f-%2.0f        |\n', [serviceA_time(1,i) serviceA_prob(1,i) serviceA_CDF(1,i) serviceA_range1(1,i) serviceA_range2(1,i)]);
            else
                fprintf('     |               %1.0f               |    %1.2f     | %1.2f |        %2.0f-%2.0f       |\n', [serviceA_time(1,i) serviceA_prob(1,i) serviceA_CDF(1,i) serviceA_range1(1,i) serviceA_range2(1,i)]);
            end
        end
    disp('     +-------------------------------+-------------+------+---------------------+');
    
    %SERVICE COUNTER 2 PROBABILITY TABLE
    temp = rand(1,4);
        for (i=1:4)
            smallest = temp(1,i);
                for (j=(i+1):4)
                    if (smallest > temp(1,j))
                        temp(1,i) = temp(1,j);
                        temp(1,j) = smallest;
                        smallest = temp(1,i);
                    end
                end
        end
    while (round(temp(1,4)*100)/100 == 1)
         temp = rand(1,4);
         for (i=1:4)
             smallest = temp(1,i);
                 for (j=(i+1):4)
                     if (smallest > temp(1,j))
                         temp(1,i) = temp(1,j);
                         temp(1,j) = smallest;
                         smallest = temp(1,i);
                     end
                 end
         end
     end
    
    serviceB_time = [5,6,7,8,9];
    serviceB_CDF = [round(temp(1,1)*100)/100,round(temp(1,2)*100)/100,round(temp(1,3)*100)/100,round(temp(1,4)*100)/100,1];
    serviceB_prob = [round(temp(1,1)*100)/100,(round(temp(1,2)*100)/100-round(temp(1,1)*100)/100),(round(temp(1,3)*100)/100-round(temp(1,2)*100)/100),(round(temp(1,4)*100)/100-round(temp(1,3)*100)/100),(1-round(temp(1,4)*100)/100)];
    serviceB_range1 = [1, round(temp(1,1)*100+1), round(temp(1,2)*100+1), round(temp(1,3)*100+1), round(temp(1,4)*100+1)];
    serviceB_range2 = [round(temp(1,1)*100), round(temp(1,2)*100), round(temp(1,3)*100), round(temp(1,4)*100),100];
    disp(' ');
    disp('SERVICE COUNTER 2 PROBABILITY TABLE');
    disp('     +--------------------------------+-------------+------+---------------------+');
    disp('     | Service time for Counter 2(min)| Probability | CDF  | Random number range |');
    disp('     +--------------------------------+-------------+------+---------------------+');
        for (i=1:5)
            if(i < 5)
                fprintf('     |                %1.0f               |    %1.2f     | %1.2f |        %2.0f-%2.0f        |\n', [serviceB_time(1,i) serviceB_prob(1,i) serviceB_CDF(1,i) serviceB_range1(1,i) serviceB_range2(1,i)]);
            else
                fprintf('     |                %1.0f               |    %1.2f     | %1.2f |        %2.0f-%2.0f       |\n', [serviceB_time(1,i) serviceB_prob(1,i) serviceB_CDF(1,i) serviceB_range1(1,i) serviceB_range2(1,i)]);
            end
        end
    disp('     +--------------------------------+-------------+------+---------------------+');
    disp(' ');
    
    %TEMPERATURE PROBABILITY
    temperature_prob = [36.1, 36.2, 36.3, 36.4, 36.5, 36.6, 36.7, 36.8, 36.9, 37.0, 37.1, 37.2, 37.3, 37.4, 37.5, 37.6, 37.7, 37.8, 37.9, 38.0];
    temperature_range1 = [0, 6, 11, 16, 21, 26, 31, 36, 41, 46, 51, 56, 61, 66, 71, 76, 81, 86, 91, 96];
    temperature_range2 = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100];

    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %generate inter-arrival and service time using chosen random number generator
    
    if (choose == 1)
        disp('   +-------------------------------------+');
        disp('   | RANDI Uniformly Distributed Integer |')
        disp('   +-------------------------------------+');

        %random numbers for inter-arrival time
        ran_inter = [randi(ones(1,cus_num), 100*ones(1,cus_num))];    
        ran_inter(1) = 0;   % to set the first index as 0   
       
        %inter arrival time based on random number's range
        inter_arr = zeros(1,cus_num);
        inter_arr(1) = 0;   % to set the first index as 0         
        for(i = 2:cus_num)
            if(ran_inter(1, i) >= inter_range1(1, 1) & ran_inter(1, i) <= inter_range2(1, 1))
                inter_arr(i) = inter_time(1,1);
            elseif(ran_inter(1, i) >= inter_range1(1, 2) & ran_inter(1, i) <= inter_range2(1, 2))
                inter_arr(i) = inter_time(1,2);
            elseif(ran_inter(1, i) >= inter_range1(1, 3) & ran_inter(1, i) <= inter_range2(1, 3))
                inter_arr(i) = inter_time(1,3);
            elseif(ran_inter(1, i) >= inter_range1(1, 4) & ran_inter(1, i) <= inter_range2(1, 4))
                inter_arr(i) = inter_time(1,4);
            elseif(ran_inter(1, i) >= inter_range1(1, 5) & ran_inter(1, i) <= inter_range2(1, 5))
                inter_arr(i) = inter_time(1,5);
            end
        end
    
        %random numbers for service time
        ran_serve = [randi(ones(1,cus_num), 100*ones(1,cus_num))];      
    
        %service time A based on random number's range
        serve_timeA = zeros(1,cus_num);   
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= serviceA_range1(1, 1) & ran_serve(1, i) <= serviceA_range2(1, 1))
                serve_timeA(i) = serviceA_time(1,1);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 2) & ran_serve(1, i) <= serviceA_range2(1, 2))
                serve_timeA(i) = serviceA_time(1,2);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 3) & ran_serve(1, i) <= serviceA_range2(1, 3))
                serve_timeA(i) = serviceA_time(1,3);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 4) & ran_serve(1, i) <= serviceA_range2(1, 4))
                serve_timeA(i) = serviceA_time(1,4);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 5) & ran_serve(1, i) <= serviceA_range2(1, 5))
                serve_timeA(i) = serviceA_time(1,5);
            end
        end  
   
        %service time B based on random number's range
        serve_timeB = zeros(1,cus_num);
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= serviceB_range1(1, 1) & ran_serve(1, i) <= serviceB_range2(1, 1))
                serve_timeB(i) = serviceB_time(1,1);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 2) & ran_serve(1, i) <= serviceB_range2(1, 2))
                serve_timeB(i) = serviceB_time(1,2);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 3) & ran_serve(1, i) <= serviceB_range2(1, 3))
                serve_timeB(i) = serviceB_time(1,3);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 4) & ran_serve(1, i) <= serviceB_range2(1, 4))
                serve_timeB(i) = serviceB_time(1,4);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 5)) & ran_serve(1, i) <= round(serviceB_range2(1, 5))
                serve_timeB(i) = serviceB_time(1,5);
            end
        end 
        
        %random numbers for temperature
        ran_temperature = [randi(ones(1,cus_num), 100*ones(1,cus_num))];
        
        %customer temperature based on random number's range
        cus_temp = zeros(1,cus_num);
        for(i = 1:cus_num)
            for(j = 1:20)
                if(ran_temperature(1, i) >=  temperature_range1(1, j) & ran_temperature(1, i) <=  temperature_range2(1, j))
                    cus_temp(i) =  temperature_prob(1, j);
                end      
            end
        end
        
    elseif (choose == 2)
        disp('   +-------------------------------------------+');
        disp('   | RANDEXP Exponentially Distributed Integer |');
        disp('   +-------------------------------------------+');
        
        %random numbers for inter-arrival time
        ran_inter = expGenerator(cus_num);
        ran_inter(1) = 0;
        
        %inter arrival time based on random number's range
        inter_arr = zeros(1,cus_num);
        inter_arr(1) = 0;   % to set the first index as 0         
        for(i = 2:cus_num)
            if(ran_inter(1, i) >= inter_range1(1, 1) & ran_inter(1, i) <= inter_range2(1, 1))
                inter_arr(i) = inter_time(1,1);
            elseif(ran_inter(1, i) >= inter_range1(1, 2) & ran_inter(1, i) <= inter_range2(1, 2))
                inter_arr(i) = inter_time(1,2);
            elseif(ran_inter(1, i) >= inter_range1(1, 3) & ran_inter(1, i) <= inter_range2(1, 3))
                inter_arr(i) = inter_time(1,3);
            elseif(ran_inter(1, i) >= inter_range1(1, 4) & ran_inter(1, i) <= inter_range2(1, 4))
                inter_arr(i) = inter_time(1,4);
            elseif(ran_inter(1, i) >= inter_range1(1, 5) & ran_inter(1, i) <= inter_range2(1, 5))
                inter_arr(i) = inter_time(1,5);
            end
        end
        
        %random numbers for service time
        ran_serve = expGenerator(cus_num);
        
        %service time A based on random number's range
        serve_timeA = zeros(1,cus_num);   
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= serviceA_range1(1, 1) & ran_serve(1, i) <= serviceA_range2(1, 1))
                serve_timeA(i) = serviceA_time(1,1);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 2) & ran_serve(1, i) <= serviceA_range2(1, 2))
                serve_timeA(i) = serviceA_time(1,2);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 3) & ran_serve(1, i) <= serviceA_range2(1, 3))
                serve_timeA(i) = serviceA_time(1,3);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 4) & ran_serve(1, i) <= serviceA_range2(1, 4))
                serve_timeA(i) = serviceA_time(1,4);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 5) & ran_serve(1, i) <= serviceA_range2(1, 5))
                serve_timeA(i) = serviceA_time(1,5);
            end
        end  
   
        %service time B based on random number's range
        serve_timeB = zeros(1,cus_num);
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= serviceB_range1(1, 1) & ran_serve(1, i) <= serviceB_range2(1, 1))
                serve_timeB(i) = serviceB_time(1,1);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 2) & ran_serve(1, i) <= serviceB_range2(1, 2))
                serve_timeB(i) = serviceB_time(1,2);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 3) & ran_serve(1, i) <= serviceB_range2(1, 3))
                serve_timeB(i) = serviceB_time(1,3);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 4) & ran_serve(1, i) <= serviceB_range2(1, 4))
                serve_timeB(i) = serviceB_time(1,4);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 5)) & ran_serve(1, i) <= round(serviceB_range2(1, 5))
                serve_timeB(i) = serviceB_time(1,5);
            end
        end 
        
        %random numbers for temperature
        ran_temperature = expGenerator(cus_num);
        
        %customer temperature based on random number's range
        cus_temp = zeros(1,cus_num);
        for(i = 1:cus_num)
            for(j = 1:20)
                if(ran_temperature(1, i) >=  temperature_range1(1, j) & ran_temperature(1, i) <=  temperature_range2(1, j))
                    cus_temp(i) =  temperature_prob(1, j);
                end      
            end
        end
        
    elseif (choose == 3)
        disp('   +--------------------------------------+');
        disp('   | RAND Uniform Random Number Generator |');
        disp('   +--------------------------------------+');
        
        %random numbers for inter-arrival time
        for(i = 1:cus_num)
            A = 1; B = 100; 
            ran_inter = [round(A + (B-A)*rand(1,i))];
        end 
        ran_inter(1) = 0;
        
        %inter arrival time based on random number's range
        inter_arr = zeros(1,cus_num);
        inter_arr(1) = 0;   % to set the first index as 0         
        for(i = 2:cus_num)
            if(ran_inter(1, i) >= inter_range1(1, 1) & ran_inter(1, i) <= inter_range2(1, 1))
                inter_arr(i) = inter_time(1,1);
            elseif(ran_inter(1, i) >= inter_range1(1, 2) & ran_inter(1, i) <= inter_range2(1, 2))
                inter_arr(i) = inter_time(1,2);
            elseif(ran_inter(1, i) >= inter_range1(1, 3) & ran_inter(1, i) <= inter_range2(1, 3))
                inter_arr(i) = inter_time(1,3);
            elseif(ran_inter(1, i) >= inter_range1(1, 4) & ran_inter(1, i) <= inter_range2(1, 4))
                inter_arr(i) = inter_time(1,4);
            elseif(ran_inter(1, i) >= inter_range1(1, 5) & ran_inter(1, i) <= inter_range2(1, 5))
                inter_arr(i) = inter_time(1,5);
            end
        end
        
        %random numbers for service time
        for(i = 1:cus_num)
            A = 1; B = 100; 
            ran_serve = [round(A + (B-A)*rand(1,i))];
        end 
        
        %service time A based on random number's range
        serve_timeA = zeros(1,cus_num);   
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= serviceA_range1(1, 1) & ran_serve(1, i) <= serviceA_range2(1, 1))
                serve_timeA(i) = serviceA_time(1,1);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 2) & ran_serve(1, i) <= serviceA_range2(1, 2))
                serve_timeA(i) = serviceA_time(1,2);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 3) & ran_serve(1, i) <= serviceA_range2(1, 3))
                serve_timeA(i) = serviceA_time(1,3);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 4) & ran_serve(1, i) <= serviceA_range2(1, 4))
                serve_timeA(i) = serviceA_time(1,4);
            elseif(ran_serve(1, i) >= serviceA_range1(1, 5) & ran_serve(1, i) <= serviceA_range2(1, 5))
                serve_timeA(i) = serviceA_time(1,5);
            end
        end  
   
        %service time B based on random number's range
        serve_timeB = zeros(1,cus_num);
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= serviceB_range1(1, 1) & ran_serve(1, i) <= serviceB_range2(1, 1))
                serve_timeB(i) = serviceB_time(1,1);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 2) & ran_serve(1, i) <= serviceB_range2(1, 2))
                serve_timeB(i) = serviceB_time(1,2);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 3) & ran_serve(1, i) <= serviceB_range2(1, 3))
                serve_timeB(i) = serviceB_time(1,3);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 4) & ran_serve(1, i) <= serviceB_range2(1, 4))
                serve_timeB(i) = serviceB_time(1,4);
            elseif(ran_serve(1, i) >= serviceB_range1(1, 5)) & ran_serve(1, i) <= round(serviceB_range2(1, 5))
                serve_timeB(i) = serviceB_time(1,5);
            end
        end 
        
        %random numbers for temperature
        for(i = 1:cus_num)
            A = 1; B = 100; 
            ran_temperature = [round(A + (B-A)*rand(1,i))];
        end
        
        %customer temperature based on random number's range
        cus_temp = zeros(1,cus_num);
        for(i = 1:cus_num)
            for(j = 1:20)
                if(ran_temperature(1, i) >=  temperature_range1(1, j) & ran_temperature(1, i) <=  temperature_range2(1, j))
                    cus_temp(i) =  temperature_prob(1, j);
                end      
            end
        end
    end 
    
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %arrival time based on random number's range
    for(i = 1:cus_num)
        A = 1; B = 5; 
        arr_time = [round(A + (B-A)*rand(1,i))];
    end
    arr_time(1) = 0;
    
    for(i = 2:cus_num)
        arr_time(i) = [arr_time(i-1) + inter_arr(1,i)];
    end
    
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %SAMPLE ARRAY
    %number of customer in the centre (SAMPLE)
    cus_inside = [zeros(1,cus_num)];
    %time customer enter the centre (SAMPLE)
    time_enter = [zeros(1,cus_num)];
    %service A time begins (SAMPLE)
    serve_beginA = [zeros(1,cus_num)];
    %service A time ends (SAMPLE)
    serve_endsA = [zeros(1,cus_num)];
    %service B time begins (SAMPLE)
    serve_beginB = [zeros(1,cus_num)];
    %service B time ends (SAMPLE)
    serve_endsB = [zeros(1,cus_num)];
    %waiting time (SAMPLE)
    wait_time = [zeros(1,cus_num)];
    %time spent (SAMPLE)
    time_spent = [zeros(1,cus_num)];
    %serving time regardless of table (SAMPLE)
    serve_time_end = [zeros(1,cus_num)];
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %Table calculation
    
    %customer status(0 = NOT ARRIVE, 1 = ARRIVE AT CENTER, 2 = HAVE ENTERED THE CENTER, 3 = AT THE COUNTER, 4 = EXITED THE CENTER)
    cus_status = zeros(1,cus_num);
    
    %counter status(0 = available, 1 = not available)
    counterA_status = 0;
    counterA_serviceEnd = zeros(1,cus_num);
    counterB_status = 0;
    counterB_serviceEnd = zeros(1,cus_num);
    
    %time initial set to 0
    time = 0;
    
    %current customer in the center
    center_cus = 0;
    
    %control while loop
    center = 1;
    
   while (center == 1)
        %set arriving customer status to 1
        for(i= 1:cus_num)
            if(arr_time(i) == time)
                cus_status(i) = 1;
                    if(cus_temp(i) > 37.7)
                    cus_status(i) = 5;
                end
            end
        end
        %set customer status to 2 when customer enter center
        for(i= 1:cus_num)
            if(cus_status(i) == 1)
                if(center_cus < max_cus)
                    cus_status(i) = 2;
                    time_enter(i) = time;
                    cus_inside(i) = center_cus;
                    center_cus = center_cus + 1;
                end
            end
        end
        %set customer status to 4 if service has ended
        for(i= 1:cus_num)
            if(counterA_serviceEnd(i) == time & cus_status(i) == 3)
                counterA_status = 0;
                cus_status(i) = 4;
                serve_endsA(1,i) = time;
                serve_time_end(1,i) = time;
                center_cus = center_cus - 1;
            end
            if(counterB_serviceEnd(i) == time & cus_status(i) == 3)
                counterB_status = 0;
                cus_status(i) = 4;
                serve_endsB(1,i) = time;
                serve_time_end(1,i) = time;
                center_cus = center_cus - 1;
            end
        end
        %set customer status to 3 if theres a counter available
        for(i= 1:cus_num)
            if(cus_status(i) == 2)
                if(counterA_status == 0)
                    cus_status(i) = 3;
                    counterA_status = 1;
                    serve_beginA(1,i) = time;
                    wait_time(i) = time - arr_time(i);
                    counterA_serviceEnd(i) = time + serve_timeA(1,i);
                    time_spent(i) = counterA_serviceEnd(i) - arr_time(i);
                elseif(counterB_status == 0)
                    cus_status(i) = 3;
                    counterB_status = 1;
                    serve_beginB(1,i) = time;
                    wait_time(i) = time - arr_time(i);
                    counterB_serviceEnd(i) = time + serve_timeB(1,i);
                    time_spent(i) = counterB_serviceEnd(i) - arr_time(i);
                end
            end
        end
        
       time = time + 1;
       
       counter = 0;
       
       for(i= 1:cus_num)
           if(cus_status(i) == 4 | cus_status(i) == 5)
               counter = counter + 1;
           end
       end
       
       if(counter == cus_num)
           center = 0;
       end
    end

    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %display table of customer entries
    
    %customer entry
    cus_entry = [1:cus_num];
    
    disp(' ');
    disp('CUSTOMER CONDITIONS  TABLE');
    disp('     +----------+-------------+--------------------+---------------+---------+-----------------+---------------+');
    disp('     | Customer | Temperature | Random number for  | Inter-arrival | Arrival | No. of customer | Time entering |');
    disp('     |    no.   |  (Celcius)  | inter-arrival time |     time      |  time   |  in the centre  |   the centre  |');
    disp('     +----------+-------------+--------------------+---------------+---------+-----------------+---------------+');
    for(i = 1:cus_num)
         if(i < 10)
             if(cus_inside(i) == 0 & time_enter(i) == 0 & i ~= 1)
                fprintf('     |    %1.0f     |    %1.1f     |         %3.0f        |      %2.0f       |   %3.0f   |        -        |        -      |\n', [cus_entry(1,i) cus_temp(1,i) ran_inter(1,i) inter_arr(1,i) arr_time(1,i)]);
             else
                fprintf('     |    %1.0f     |    %1.1f     |         %3.0f        |      %2.0f       |   %3.0f   |        %1.0f        |      %3.0f      |\n', [cus_entry(1,i) cus_temp(1,i) ran_inter(1,i) inter_arr(1,i) arr_time(1,i) cus_inside(1,i) time_enter(1,i)]);
             end
         else
             if(cus_inside(i) == 0 & time_enter(i) == 0 & i ~= 1)
                fprintf('     |    %1.0f    |    %1.1f     |         %3.0f        |      %2.0f       |   %3.0f   |        -        |        -      |\n', [cus_entry(1,i) cus_temp(1,i) ran_inter(1,i) inter_arr(1,i) arr_time(1,i)]);
             else
                fprintf('     |    %1.0f    |    %1.1f     |         %3.0f        |      %2.0f       |   %3.0f   |        %1.0f        |      %3.0f      |\n', [cus_entry(1,i) cus_temp(1,i) ran_inter(1,i) inter_arr(1,i) arr_time(1,i) cus_inside(1,i) time_enter(1,i)]);
             end         
         end
    end
    disp('     +----------+-------------+--------------------+---------------+---------+-----------------+---------------+');
    disp(' ');
    disp('2 COUNTERS TABLE');
    disp('                                          +---------------------------------+---------------------------------+');
    disp('                                          |            COUNTER 1            |            COUNTER 2            |');
    disp('     +--------+-----------------+---------+-------+------------+------------+-------+------------+------------+-------+------+');
    disp('     |Customer|Random number for| Arrival |Service|Time service|Time service|Service|Time service|Time service|Waiting| Time |');
    disp('     |   no.  |  service time   |  time   | time  |   begins   |     ends   | time  |   begins   |    ends    |  time |spent |');
    disp('     +--------+-----------------+---------+-------+------------+------------+-------+------------+------------+-------+------+');
    for(i = 1:cus_num)
        if(i < 10)
            if(serve_beginA(i) == 0 & serve_beginB(i) == 0 & i ~= 1)
                fprintf('     |   %1.0f    |       %3.0f       |   %3.0f   |   %1.0f   |      -     |      -     |   %1.0f   |      -     |      -     |    -  |   -  |\n', [cus_entry(1,i) ran_serve(1,i) arr_time(1,i) serve_timeA(1,i) serve_timeB(1,i)]);
            elseif(serve_beginB(i) == 0)
                fprintf('     |   %1.0f    |       %3.0f       |   %3.0f   |   %1.0f   |    %3.0f     |    %3.0f     |   %1.0f   |      -     |      -     |   %2.0f  |  %2.0f  |\n', [cus_entry(1,i) ran_serve(1,i) arr_time(1,i) serve_timeA(1,i) serve_beginA(1,i) serve_endsA(1,i) serve_timeB(1,i)  wait_time(1,i) time_spent(1,i)]);
            else
                fprintf('     |   %1.0f    |       %3.0f       |   %3.0f   |   %1.0f   |      -     |      -     |   %1.0f   |    %3.0f     |    %3.0f     |   %2.0f  |  %2.0f  |\n', [cus_entry(1,i) ran_serve(1,i) arr_time(1,i) serve_timeA(1,i) serve_timeB(1,i) serve_beginB(1,i) serve_endsB(1,i) wait_time(1,i) time_spent(1,i)]);
            end
        else 
            if(serve_beginA(i) == 0 & serve_beginB(i) == 0 & i ~= 1)
                fprintf('     |   %1.0f   |       %3.0f       |   %3.0f   |   %1.0f   |      -     |      -     |   %1.0f   |      -     |      -     |    -  |   -  |\n', [cus_entry(1,i) ran_serve(1,i) arr_time(1,i) serve_timeA(1,i) serve_timeB(1,i)]);
            elseif(serve_beginB(i) == 0)
                fprintf('     |   %1.0f   |       %3.0f       |   %3.0f   |   %1.0f   |    %3.0f     |    %3.0f     |   %1.0f   |      -     |      -     |   %2.0f  |  %2.0f  |\n', [cus_entry(1,i) ran_serve(1,i) arr_time(1,i) serve_timeA(1,i) serve_beginA(1,i) serve_endsA(1,i) serve_timeB(1,i)  wait_time(1,i) time_spent(1,i)]);
            else
                fprintf('     |   %1.0f   |       %3.0f       |   %3.0f   |   %1.0f   |      -     |      -     |   %1.0f   |    %3.0f     |    %3.0f     |   %2.0f  |  %2.0f  |\n', [cus_entry(1,i) ran_serve(1,i) arr_time(1,i) serve_timeA(1,i) serve_timeB(1,i) serve_beginB(1,i) serve_endsB(1,i) wait_time(1,i) time_spent(1,i)]);
            end
        end
    end
    disp('     +--------+-----------------+---------+-------+------------+------------+-------+------------+------------+-------+------+');
    
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %Displaying the message of arrival, enter and departure of the customer.
    disp(' ')
    disp('MESSAGE OF ARRIVAL, ENTERING THE CENTRE AND DEPARTURE OF CUSTOMER');
    disp('-------------------------------------------------------------------------------------------------');
    for(i = 1:cus_num)
        if(cus_temp(1,i) >= 37.8)
            fprintf(' -> Customer %1.0f arrives at minute %3.0f and was not allowed to enter the centre.\n', [cus_entry(1,i) arr_time(1,i)]);
        else
            fprintf(' -> Customer %1.0f arrives at minute %3.0f, enters the centre at minute %3.0f and departs at minute %3.0f.\n', [cus_entry(1,i) arr_time(1,i) time_enter(1,i) serve_time_end(1,i)]);
        end
    end
    
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %Calculations for average waiting time, average time spent, average service time and probability of a customer has to wait
    
    %average waiting time
    for(i=1:cus_num)
        total_wait = total_wait + wait_time(1, i);  
    end
    avg_wait = total_wait / cus_num;
    %average time spent
    for(i=1:cus_num)
        total_spent = total_spent + time_spent(1, i);  
    end
    avg_spent = total_spent / cus_num;
    
    %average service time for counter 1 and counter 2
    for(i=1:cus_num)
        total_serveA = total_serveA + serve_timeA(1, i);  
    end
    avg_serveA = total_serveA / cus_num;
    
    for(i=1:cus_num)
        total_serveB = total_serveB + serve_timeB(1, i);  
    end
    avg_serveB = total_serveB / cus_num;
    
    %probability of a customer has to wait
    for(i=1:cus_num)
        if(wait_time(1, i) > 0)
            count = count + 1;
        end
    end
    prob_wait = count / cus_num;

    %Displaying the evaluation results of the simulation
    disp(' ')
    disp('EVALUATION RESULTS OF THE SIMULATION');
    disp('-----------------------------------------------');
    disp('   The average waiting time', avg_wait);
    disp('   The average time spent', avg_spent);
    disp('   The average service time for counter 1', avg_serveA);
    disp('   The average service time for counter 2', avg_serveB);
    disp('   The probability of a customer has to wait', prob_wait);
    
    %end
    disp('    +-------------------+');
    disp('    | END OF SIMULATION |');
    disp('    +-------------------+');
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------