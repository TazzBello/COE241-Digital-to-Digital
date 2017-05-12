function [out] = Enc_B8ZS(Binary_input)
%Enc_NRZL Non return to Zero-Level digital encoding
%   Takes a sequence string of zeros and ones and produces the corresponding
%   encoded binary signal using B8ZS format that is based on BipolarAMI but also adds that
%   every eight zeros are replaced by  '000VB0VB' V: Bipolar vaulation, B: valid Bipolar signal(balance).
%
%       0 = zero level
%       1 = low/high level(the inverse of the last '1')
%
%   The output will be presented as a sequence of 0, - and + where:
%       '0' means zero signal
%       '-' means negative signal
%       '+' means positive signal
%
%   Example:
%       Enc_B8ZS 11000000001100000010   returns string +-000-+0+-+-000000+0 


if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
input = ""+Binary_input;% make sure it is a string

out=replace(input,"00000000","000-+0+-"); %zeros are replaced by  '000VB0VB'


