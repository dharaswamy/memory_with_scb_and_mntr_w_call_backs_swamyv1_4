class generator;
transaction t1;
mailbox gen_mail;
shortint unsigned repeat_count;
  
function new(mailbox justhandle4);
gen_mail=justhandle4;
endfunction:new
  
task main;

repeat(repeat_count)
begin
t1=new();
if(!t1.randomize())
$fatal("oops No randomization due to no rand/randc properties in transation class");
gen_mail.put(t1);

end
endtask:main

endclass:generator