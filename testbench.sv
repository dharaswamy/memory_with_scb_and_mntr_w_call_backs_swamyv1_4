// Eda link : https://edaplayground.com/x/v6eF

// ( swamy ) please copy the code but don't change/modify the code here.


//======================================================================================
//project Nam :memory model project sv based  ,in this i used and implemented the call back methods.
// NOte : eda link name changed from  memory_ with scb& mntr_w_call_backs_swamyv1.4.sv to memory_with_scb_and_mntr_w_call_backs_swamyv1_4.sv
//======================================================================================



`include "interface.sv"
//`include "default_test.sv"
//`include "randomtest.sv"
//`include "addr_2_cal_back_test.sv"
`include "addr_2_data_change_call_imp_test.sv"




module tb_top;
 bit clk ,rst; 
bus org(clk ,rst);
   
 initial
   begin
forever
  begin
  #5;
  clk=~clk;
  end
   end
   
initial begin
clk=1;
  rst=1;
  #5;
  rst=0;
end

//for the reset operation in b/w the write and read operation
/*initial begin
fork 
begin
#50; rst=1;
end
begin
#52; rst=0;
end
begin
#54;rst=1;
end
begin
#56; rst=0;
end
begin
#90; rst=1;
end
begin
#92; rst=0;
end
begin
#100; rst=1;
end
begin
#102; rst=0;
end
begin
#106; rst=1;
end
begin
#108; rst=0;
end
begin
#180; rst=1;
end
begin
#182; rst=0;
end
begin
#200; rst=1;
end
begin
#202; rst=0;
end
join_none
  end */
  
    
  
 // default_values q2(org);
  
  //addr_2_cal_back_test q4(org);
  addr_2_data_change_call_imp_test q5(org);
  
   //test t1(org);
  memory  q3(org);
   
   
    initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
   
endmodule
   
    
    
  

        
        
        
  
  