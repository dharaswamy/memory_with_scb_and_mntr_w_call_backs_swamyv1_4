class monitor;
  transaction t6;
 virtual bus.monitor_tb bus_mntr;
  mailbox mail_mntr;
  
function new(virtual bus bus_mntr,mailbox mail_mntr);
this.bus_mntr=bus_mntr;
this.mail_mntr=mail_mntr;
endfunction:new
  
  
task main;
forever begin

t6=new();
@(posedge bus_mntr.clk);
  wait(bus_mntr.wen || bus_mntr.ren);
  
if(bus_mntr.wen)
begin
t6.addr=bus_mntr.addr;
t6.wen=bus_mntr.wen;
t6.wdata=bus_mntr.wdata;
//@(posedge bus_mntr.clk);
@(posedge bus_mntr.clk); 
 end
      
if(bus_mntr.ren)
begin
t6.addr=bus_mntr.addr;
t6.ren=bus_mntr.ren;
@(posedge bus_mntr.clk);
//@(posedge bus_mntr.clk);
t6.rdata=bus_mntr.rdata;
@(posedge bus_mntr.clk); 
 end
mail_mntr.put(t6);
 end
endtask:main
  
endclass:monitor
  