module memory(bus.dut b1);
  //Memory
  reg [7:0] mem [4];

  //Reset 
  always @( posedge b1.rst)
    
      begin
        for(int i=0;i<4;i++)
   mem[i]=8'hFF;
      end
   
  // Write data to Memory
  always @(posedge b1.clk)
    begin
      
    if (b1.wen)
     mem[b1.addr] <= b1.wdata;
    end
  
   always @(posedge b1.clk)
     begin
       if (b1.ren)
    b1.rdata <=mem[b1.addr];
     
    //else
    //b1.rdata<=mem[b1.addr];
   
    end

endmodule