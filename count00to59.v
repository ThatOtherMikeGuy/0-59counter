// count00to59.v
// Mike Schwindt

module count00to59(msd,lsd,cascade, up, enable,clk,reset);
    output [3:0]    msd, lsd;
    output          cascade;
    input           enable, up, clk, reset;

    wire            en1to10;

    deccount        ones(lsd,  en1to10,  enable, up, clk, reset);
    hexcount        tens(msd, cascade, en1to10, up, clk, reset);


endmodule
