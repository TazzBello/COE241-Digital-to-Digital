function [out] = Dec_Pseudoternary(signal_input)
% BipolarAMI Bipolar  alternate mark inversion encoding
%   Takes a sequence string of encoded binary signal and produces the corresponding
%  zeros and ones using BipolarAMI format.
%       '0' means zero signal
%       '-' means negative signal
%       '+' means positive signal
%
%   The output will be presented as a sequence of 0 and 1 where:
%       1 = zero level
%       0 = low/high level(the inverse of the last '0')
%
%   Example:
%       Dec_Pseudoternary(0+-0+000)  % returns string 10010111 


if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
for i=1:1:length(signal_input) %change '0' to '1'
    if(signal_input(i)=='0')
       signal_input(i)='1';   
    end
end

for i=1:1:length(signal_input) %loop to go through the string
 if(signal_input(i)=='-' || signal_input(i)=='+') %if a '-' or '+' is found change it to '1'
    signal_input(i)='0'; 
 end
end 
out=signal_input;
