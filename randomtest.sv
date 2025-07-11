`include "environment.sv"

 program test(bus bus_test);
         env e1;
          initial begin
            e1=new(bus_test);
            e1.g1.repeat_count=20;
            e1.main();
            #1000 $finish;
          end
          
        endprogram:test
        
        