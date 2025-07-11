`include "environment.sv"  

program addr_2_cal_back_test(bus bus_test);
  
  
        env e1;
   addr_2_call_imp  addr_2_cal;
  
          initial begin
           
            e1=new(bus_test);
            addr_2_cal = new(bus_test,e1.env_gen);
            e1.d1=addr_2_cal;
            e1.g1.repeat_count=20;
            e1.main();
            #1000 $finish;
          end
          
        endprogram:addr_2_cal_back_test