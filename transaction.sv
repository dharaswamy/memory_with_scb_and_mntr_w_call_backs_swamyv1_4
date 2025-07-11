class transaction;
randc bit wen;
randc bit ren;
rand bit [1:0] addr;
rand bit [7:0] wdata;
bit [7:0] rdata;
bit [1:0] cnt;
  constraint wr_rd_c { wen != ren; }; 

function void display;
  $display("@%0t: wen=%0b,ren=%0b,addr=%0d,wdata=%0h,rdata=%0h \n",$time,wen,ren,addr,wdata,rdata);
endfunction:display
  
function void display_intilize;
  $display("@%0t:initilize the vlaues of the wen=%0b,ren=%0b,addr=%0d,wdata=%0h \n",$time,wen,ren,addr,wdata);
endfunction:display_intilize
  
endclass:transaction
