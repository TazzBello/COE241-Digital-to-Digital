function [out] = Dec_HDB3(Signal_input)
%Dec_HDB3: High Density Bipolar with 3 zero substiutiondigital decoding
%   Takes a sequence of signals of '+' and '-' and produces the corresponding
%   decoded binary output from the HBD3 format.
%       -000- = '10000'
%       +000+ = '10000'
%       -+00+ = '10000'
%       +-00- = '10000'
%
%   The output will be presented as a sequence of 1's and 0's where:
%       '0' means binary 0 
%       '1' means bianry 1
%
%   Example:
%       Dec_HDB3(+-000-+00+-+-00-0+0)  % returns string 1100000000110000010

if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end

Signal_input=replace(Signal_input,'+00+','0000');	% replace all 0's in the string  x with +
Signal_input=replace(Signal_input,'-00-','0000');
Signal_input=replace(Signal_input,'-000-','10000');	% replace all 0's in the string  x with +
Signal_input=replace(Signal_input,'+000+','10000');	% replace all 0's in the string  x with +
% replace all 0's in the string  x with +

for i=1:1:length(Signal_input) %loop to go through the string
    if(Signal_input(i)=='-' || Signal_input(i)=='+') %if a '-' or '+' is found change it to '1'
        Signal_input(i)='1'; 
    end
end



out = Signal_input;

