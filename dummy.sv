


 //dummy method for call back implementation.
  virtual task data_change();
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
    
  