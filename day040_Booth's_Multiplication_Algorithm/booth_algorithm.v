module booth_algorithm(
  input signed [3:0] a,b,
  output reg signed [7:0] result
);


integer i;
reg [3:0] A;
reg [3:0] Q;
reg q_1;
reg [1:0] op;

always@(*)
      begin
		A=4'b0000;
		Q=b;
		q_1=1'b0;
		
		for(i=0;i<4;i=i+1)
		begin 
	    op={Q[0],q_1};
	   case(op)
	  
		  2'b01:A=A+a;
		  2'b10:A=A-a;
         default:;
      
     endcase		
	   {A,Q,q_1}=$signed({A,Q,q_1})>>>1;
	  end
	  result={A,Q};
	  end
	  endmodule
	  