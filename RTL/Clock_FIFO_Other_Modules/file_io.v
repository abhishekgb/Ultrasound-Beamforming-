module file_io (din);

input [15:0] din;

integer f1;

   initial begin
      // Open file output.dat for writing
      f1 = $fopen("E:\Test_Reports\output.rtf", "w");

      // Check if file was properly opened and if not, produce error and exit      
      if (f1 == 0) begin
        $display("Error: File, output.rtf could not be opened.\n Exiting Simulation.");
         $finish;
      end
      
      // Write monitor data to a file
      $fmonitor (f1, "Time: %t\t USB_Data_out = %d", $realtime, din);

      // Wait for 1 ms and end monitoring
      #100000000;
      
      // Close file to end monitoring
      $fclose(f1);
   end
	
	endmodule
	
	
