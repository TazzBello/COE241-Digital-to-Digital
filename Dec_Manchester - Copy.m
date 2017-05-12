function [out] = Dec_Manchester(signal_input)
%Dec_Manchester -++-+-+--++--+ should produce ‘1000101’  



x = 6;
i = 1;
while(i < x)
    disp("i = "+i);
    disp(length(signal_input) + " length");
    disp(length(signal_input)-2 + " end");
   disp(signal_input(i+1));
    signal_input(i+1)='';
    x=x-1;
    disp(" wzswzw "+x);
    i = i+1;
end
out=signal_input;
