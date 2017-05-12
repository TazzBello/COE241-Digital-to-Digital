function [out] = Dec_NRZL(Signal_input)
%Dec_NRZL Non return to Zero-Level digital decoding
%   Takes a sequence of - and + where:
%       '-' means negative signal
%       '+' means positive signal
%
%   decode the signal using NRZL format
%   The output will be presented as a sequence of 0 and 1 where:
%       0 = high level
%       1 = low level
%
%
%   Example:
%       Dec_NRZL(-++-+---)  % returns string 10010111


if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
Signal_input=replace(Signal_input,'+','0');	% replace all +'s in the string  x with 0
out=replace(Signal_input,'-','1'); % replace all -'s in the string  x with 1
