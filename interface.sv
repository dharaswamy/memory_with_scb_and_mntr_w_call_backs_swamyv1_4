//interface for mem

interface bus(input clk,rst);
logic wen;
logic ren;
logic [1:0] addr;
logic [7:0] wdata;
logic [7:0] rdata;
modport driver_tb(input rdata,clk,rst,output wen,ren,addr,wdata);
modport dut(input wen,ren,addr,wdata,clk,rst,output rdata);
modport monitor_tb(input rdata,clk,rst,wen,ren,addr,wdata); 
  
endinterface:bus
