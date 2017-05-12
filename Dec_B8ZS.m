function [out] = Dec_B8ZS(signal_input)
%Enc_NRZL Non return to Zero-Level digital encoding
%   Takes a sequence string of encoded binary signal and produces the corresponding
%  zeros and ones using B8ZS format that is based on BipolarAMI but also adds that
%   every eight zeros is replaced by  '000VB0VB' V: Bipolar vaulation, B: valid Bipolar signal(balance).
%     
%       '0' means zero signal
%       '-' means negative signal
%       '+' means positive signal
%
%   The output will be presented as a sequence of 0 and 1 where:
%       0 = zero level
%       1 = low/high level(the inverse of the last '1')
%
%   Example:
%       Dec_B8ZS +-000-+0+-+-000000+0  % returns string 11000000001100000010 


if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
output = replace(signal_input,'000-+0+-','00000000');

for i=1:1:length(output) %loop to go through the string
 if(output(i)=='-' || output(i)=='+') %if a '-' or '+' is found change it to '1'
    output(i)='1'; 
 end
end

out=output;

