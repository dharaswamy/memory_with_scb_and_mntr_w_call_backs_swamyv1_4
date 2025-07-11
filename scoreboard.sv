class scoreboard;
  transaction t7;
 mailbox mail_scb;
  //virtual bus busfscore;
  bit [7:0] memy[4];
  
  function new(mailbox scb);
    this.mail_scb=scb;
    foreach(memy[i]) memy[i] = 8'hFF;
  endfunction:new

/*task sreset();
 @(posedge busfscore.rst);
  for(int i=0;i<4;i++) memy[i]=8'hff;
endtask:sreset*/
  
task main_s;
 t7=new();
forever
begin
 
  //t7=new();
  mail_scb.get(t7);
  
  if(t7.ren)
    begin
      if(memy[t7.addr] != t7.rdata) 
        $error("@%0t:[SCB-FAIL] Addr = %0d,\n \t   Data :: Expected = %0h Actual = %0h",$time,t7.addr,memy[t7.addr],t7.rdata);
  
 else 
   $display("@%0t:[SCB-PASS] Addr = %0d,\n \t   Data :: Expected = %0h Actual = %0h",$time,t7.addr,memy[t7.addr],t7.rdata);
      end
   
  else if(t7.wen)
    begin
      memy[t7.addr] = t7.wdata;
      $display("\n @%0t: scoreboard  write data  addr=%0d,wdata=%0h",$time,t7.addr,t7.wdata);
    end
end
endtask:main_s
endclass:scoreboard