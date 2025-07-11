`include "environment.sv"

program default_values(bus bus_default);
 env e1;
  
 class my_trans extends transaction;
    
     bit [1:0] count;
    
    function void pre_randomize();
      wen.rand_mode(0);
      ren.rand_mode(0);
      addr.rand_mode(0);
        wen = 0;
        ren = 1;
        addr  = cnt;
      cnt++;
    endfunction
    
  endclass
   
  
  
/*initial begin
env_d=new(bus_default);
env_d.d1.t2=new();
env_d.d1.reset();
repeat(4)
begin
bus_default.addr<=env_d.d1.t2.addr;
@(posedge bus_default.clk);
env_d.d1.t2.rdata=bus_default.rdata;
  $display("@%0t:default vlaues of mem[%0d]=%0h",$time,env_d.d1.t2.addr,env_d.d1.t2.rdata);
env_d.d1.t2.addr++;
 end
  
#200 $finish;
end*/
  
my_trans my_tr;
 
  
  
  initial begin
   e1=new(bus_default); 
   //e1.g1.t1.wen.rand_mode(0);
   //env_d.g1.t1.wdata.randmode(0);
    my_tr=new();
    //e1.g1.t1=null;
    e1.g1.t1=new my_tr;
    e1.g1.repeat_count=10;
    //fork
    e1.main();
     #500 $finish;
    //join_none
    
  end
    
  
  
endprogram:default_values
        
        