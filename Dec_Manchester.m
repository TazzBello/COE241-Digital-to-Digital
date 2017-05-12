function [out] = Dec_Manchester(Signal_input)
%Dec_Manchester Manchester digital decoding
%   Takes a sequence string of '-+' and '+-' and produces the corresponding
%   decoded binary output from the Manchester format.
%       +- = '0'
%       -+ = '1'
%
%   The output will be presented as a sequence of 1's and 0's where:
%       '0' means binary 0 
%       '1' means bianry 1
%
%   Example:
%       Dec_Manchester(+-+-++-+--++--+)  % returns string 10010111

if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end


i =1;
while (i<length(Signal_input))
    if (Signal_input(i)=='-')
        Signal_input(i) =  '1';
        Signal_input(i+1) ='';
        i=i+1;
    else
        Signal_input(i) =  '0';
        Signal_input(i+1) = '';
        i=i+1;
    end
end

out=Signal_input; % replace all 1's in the string  x with 1
