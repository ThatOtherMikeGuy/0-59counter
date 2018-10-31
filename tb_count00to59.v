// tb_count00to59.v
// Mike Schwindt
// EE 2390 Fall 2016
`timescale 1ns / 1ns
module tb_count00to59;
    wire [3:0]  tmsd, tlsd;
    wire        tcascade;
    reg         ten, tup;
    reg         tclk, treset;

    count00to59  dut(tmsd,tlsd,tcascade,tup, ten, tclk,treset);

    always
        #10 tclk = !tclk;   // Creates a clock of period 20 ns

    initial begin           // Use multiples of 20 ns in every change
        $dumpfile("tb_count00to59.vcd");
        $dumpvars(0,tb_count00to59);     // Best to make inputs known at t=0
        tclk=0; treset=0; ten=0; tup=0; #20     // All unknown outputs
        treset=1;                       #40     // Still unknown
        ten=1;                          #60     // Finally reset to 0
        treset=0; tup=1;                #240    // Count 0 thru 12
        tup=0;                          #300    // Count 12 back thru 0 to 57
        ten=0;                          #20     // Hang at 57
        ten=1; tup=1;                   #100    // Count 57 up thru 0 to 2
        ten=0;                          #20     // Hang at 2
        $finish;                                // Total simulation time 800 ns
    end
endmodule
