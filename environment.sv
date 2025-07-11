 
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

    class env;
       generator g1;
       driver d1;
       monitor m1;
       scoreboard s1;
   
       mailbox env_gen;
       mailbox env_mtr;
  
       virtual bus env_bus;
       
       function new(virtual bus bus_justhandle2);
         env_gen=new();
         env_mtr=new();
         env_bus=bus_justhandle2;
         g1=new(env_gen);
         d1=new(env_bus,env_gen);
         m1=new(env_bus,env_mtr);
         s1=new(env_mtr);
    
       endfunction:new
       
       
       
      task main();
 
         d1.reset;
        //d1.main1_driv();
          fork
           
         
             g1.main;
   
         

           
             d1.main;
           
          
             m1.main;
          
           
             s1.main_s;
           
             join_any
        
       endtask:main
       
     endclass:env
        