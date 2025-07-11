`include "environment.sv"  


program addr_2_data_change_call_imp_test(bus bus_test);
  
  
  env e1;
  
   addr_2_data_change_call_imp  adr_dat_cal;
  
          initial begin
           
            e1=new(bus_test);
            adr_dat_cal = new(bus_test,e1.env_gen);
            e1.d1=adr_dat_cal;
            e1.g1.repeat_count=20;
            e1.main();
            #1000 $finish;
          end
          
        
  
  
endprogram:addr_2_data_change_call_imp_test