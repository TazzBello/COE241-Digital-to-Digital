function [out] = Dec_BipolarAMI(signal_input)
% BipolarAMI Bipolar  alternate mark inversion encoding
%   Takes a sequence string of encoded binary signal and produces the corresponding
%  zeros and ones using BipolarAMI format.
%       '0' means zero signal
%       '-' means negative signal
%       '+' means positive signal
%
%   The output will be presented as a sequence of 0 and 1 where:
%       0 = zero level
%       1 = low/high level(the inverse of the last '1')
%
%   Example:
%       Dec_BipolarAMI(+00-0+-+)  % returns string  10010111


if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end

for i=1:1:length(signal_input) %loop to go through the string
 if(signal_input(i)=='-' || signal_input(i)=='+') %if a '-' or '+' is found change it to '1'
    signal_input(i)='1'; 
 end
end
out=signal_input;
