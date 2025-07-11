 
class driver;
  
 
  mailbox mail_driver;
  virtual bus.driver_tb b2;
  
  function new(virtual bus bus_justhandle1,mailbox justhandle2);
    this.mail_driver=justhandle2;
    this.b2=bus_justhandle1;
   
  endfunction:new
  
  
  
  task reset();
   //transaction t1;
    wait(b2.rst);
    $display("@%0t:Reset activated ",$time);
    b2.addr<=0;
    b2.wen<=0;
    b2.ren<=0;
    b2.wdata<=0;
    //t1.display_intilize;
    wait(!b2.rst);
    $display("@%0t:Reset is  completed \n ",$time);
    endtask:reset
  
  //dummy method for call back implementation.
  virtual task addr_2(transaction trans);
    
  endtask:addr_2
  
  //dummy method for call back implementation.
  virtual task data_change(virtual bus.driver_tb intf);
    
  endtask:data_change
    
  task main;
    transaction t1;
     //t1=new();
   forever
   begin
   //t1=new();
  b2.wen<=0;
  b2.ren<=0;
     mail_driver.get(t1);
     $display("\n@%0t:After get() write data into mem wen=%0b addr=%0d,wdata=%0h,",$time,t1.wen,t1.addr,t1.wdata);
     //call back method calling.
     addr_2(t1);
     
     @(posedge b2.clk);
     b2.addr<=t1.addr;
    
     if(t1.wen)
      begin
     b2.wen<=t1.wen;
     //b2.addr<=t2.addr;
       //$display("\n@%0t:write data into mem is started",$time);
     b2.wdata<=t1.wdata;
      data_change(b2);
         //@(posedge b2.clk);
        //b2.wdata<=0;
         @(posedge b2.clk);
        $display("\n@%0t:write data into mem wen=%0b addr=%0d,wdata=%0h,",$time,t1.wen,t1.addr,t1.wdata);
 //$display("@%0t:write data is completed \n",$time);
  //@(posedge b2.clk);
     end 
     
     if( t1.ren)
     begin
     b2.ren<=t1.ren;
     //b2.addr<=t2.addr;
    
     @(posedge b2.clk);
     b2.ren<=0;
    //@(posedge b2.clk);
     t1.rdata=b2.rdata;
     @(posedge b2.clk);
       $display("\n@%0t: read  data from mem ren=%0b addr=%0d,rdata=%0h",$time,t1.ren,t1.addr,t1.rdata);
     //t2.display();
       
     end
   
      end
     endtask:main
     
 /* task main1_driv();
    
 for(int k=0;k<4;k++) begin
   t2=new();
 t2.addr=k;
   t2.wen=1;
   t2.ren=0;
   t2.wdata=k+10;
      @(posedge b2.clk);
      b2.addr<=t2.addr;
   b2.wen<=t2.wen;
   b2.ren<=t2.ren;
   b2.wdata<=t2.wdata;
    @(posedge b2.clk);
   $dispaly("write data into mem add=%0d,wdata=%0d",t2.addr,t2.wdata);
       @(posedge b2.clk);
    t2.addr=k;t2.wen=0;t2.ren=1;
      b2.addr<=t2.addr; b2.wen<=t2.wen;b2.ren<=t2.ren;
       @(posedge b2.clk);
       t2.rdata=b2.rdata;
    @(posedge b2.clk);
   $dispaly("read data from mem add=%0d,rdata=%0d",t2.addr,t2.rdata);
         end
       
  endtask:main1_driv*/
     
  
  
     endclass:driver


class addr_2_call_imp extends driver;
  
  virtual bus bus_justhandle1;
  mailbox justhandle2;
  
  function new(virtual bus bus_justhandle1,mailbox justhandle2);
   // this.bus_justhandle1 = bus_justhandle1;
   // this.justhandle2 = justhandle2;
    super.new(bus_justhandle1,justhandle2);
  endfunction
  
  
  //dummy method for call back implementation.
  virtual task addr_2(transaction trans);
    
    trans.addr=3;
    $display(" addr_2 call back method is called");
    
  endtask:addr_2
  
 
endclass:addr_2_call_imp



class addr_2_data_change_call_imp extends driver;
  
  virtual bus bus_justhandle1;
  mailbox justhandle2;
  
  function new(virtual bus bus_justhandle1,mailbox justhandle2);
   // this.bus_justhandle1 = bus_justhandle1;
   // this.justhandle2 = justhandle2;
    super.new(bus_justhandle1,justhandle2);
  endfunction
  
  
  //dummy method for call back implementation.
  virtual task addr_2(transaction trans);
    
    trans.addr=1;
    $display(" addr_2 call back method is called");
    
  endtask:addr_2
  
 
 //dummy method for call back implementation.
  virtual task data_change(virtual bus.driver_tb intf);
    int temp;
    temp= $urandom_range(0,7);
    case(temp)
        0:  intf.wdata <= 8'b1111_000x ;
        1:  intf.wdata <= 8'b1010_10x1 ;
        2:  intf.wdata <= 8'b0101_1x11 ;
        3:  intf.wdata <= 8'b1101_x000 ;
        4:  intf.wdata <= 8'b011x_1110 ;
        5:  intf.wdata <= 8'b10x1_1011 ;
        6:  intf.wdata <= 8'b0x11_0010 ;
        7:  intf.wdata <= 8'bx101_1101 ;
    endcase
   
  endtask:data_change
    
  
 
endclass:addr_2_data_change_call_imp



     