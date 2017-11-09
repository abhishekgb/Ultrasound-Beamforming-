

module adder(clk,rst,ce,din1,din2,din3,din4,din5,din6,din7,din8,dout,data_valid);
parameter INPUT_BIT_WIDTH_ADDER = 32;
parameter OUTPUT_BIT_WIDTH_ADDER = 16;


input clk,rst,ce;
input signed [INPUT_BIT_WIDTH_ADDER-1:0] din1,din2,din3,din4,din5,din6,din7,din8;

output signed [OUTPUT_BIT_WIDTH_ADDER-1:0] dout;
output data_valid;

reg ce_d;
reg data_valid;
reg signed [39:0] adder_reg;
reg signed [39:0] adder_reg1;
reg signed [39:0] adder_reg2;
reg signed [39:0] adder_reg3;
reg signed [39:0] adder_reg4;
reg signed [39:0] adder_reg5;
reg signed [39:0] adder_reg6;
reg signed [INPUT_BIT_WIDTH_ADDER-1:0] din1_d;
reg signed [INPUT_BIT_WIDTH_ADDER-1:0] din2_d;
reg signed [INPUT_BIT_WIDTH_ADDER-1:0] din3_d;
reg signed [INPUT_BIT_WIDTH_ADDER-1:0] din4_d;
reg signed [INPUT_BIT_WIDTH_ADDER-1:0] din5_d;
reg signed [INPUT_BIT_WIDTH_ADDER-1:0] din6_d;
reg signed [INPUT_BIT_WIDTH_ADDER-1:0] din7_d;
reg signed [INPUT_BIT_WIDTH_ADDER-1:0] din8_d;


always @ (posedge clk or posedge rst)
begin
	if(rst)
	 begin
		din1_d <= 1'b0;  
		din2_d <= 1'b0;
		din3_d <= 1'b0;
		din4_d <= 1'b0;
		din5_d <= 1'b0;
		din6_d <= 1'b0;
		din7_d <= 1'b0;
		din8_d <= 1'b0; 
	 end	
	else
		begin
		 ce_d <= ce;
			 if (ce)
			 begin
          din1_d <= din1 ;
          din2_d <= din2 ;
          din3_d <= din3 ;
          din4_d <= din4 ;
          din5_d <= din5 ;
          din6_d <= din6 ;
          din7_d <= din7 ;
          din8_d <= din8 ;
			 end	
		end
end

always @ (posedge clk or posedge rst)
begin
	if(rst)
	 begin
		data_valid <= 1'b0;
		
		adder_reg <= 0;
		//ce_d <= 0;
	 end	
	else
		begin
		 ce_d <= ce;
			//if (ce & ~ce_d)
			 if (ce)
			 begin
				adder_reg1 <= (din1_d + din2_d); // + din3_d + din4_d); 
				adder_reg2 <= (din3_d + din4_d +adder_reg1);
				adder_reg3 <= (din5_d + din6_d); // + din7_d + din8_d); 
				adder_reg4 <= (din7_d + din8_d + adder_reg3);
				adder_reg  <= (adder_reg2 + adder_reg4);
//				adder_reg6 <= (adder_reg3 + adder_reg4);
//				adder_reg <= (adder_reg5 + adder_reg6);
				
				data_valid <= 1;
			 end	
			else
			   data_valid <= 0;		
		end
end

//always @ (posedge clk or posedge rst)
//begin
//	if(rst)
//	 begin
//		data_valid <= 1'b0;
//		adder_reg <= 0;
//		//ce_d <= 0;
//	 end	
//	else
//		begin
//		 ce_d <= ce;
//			//if (ce & ~ce_d)
//			 if (ce)
//			 begin
//				adder_reg <= (din1 + din2 + din3 + din4) + (din5 + din6 + din7 + din8);
//				data_valid <= 1;
//			 end	
//			else
//			   data_valid <= 0;		
//		end
//end

// Commented for incr data board testing, remove for actual System test //
//assign dout = adder_reg[19 : 4];

assign dout = adder_reg[32 : 17];

endmodule		




