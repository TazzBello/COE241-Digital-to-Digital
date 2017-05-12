function [out] = Enc_Manchester(Binary_input)
%Enc_Manchester Manchester digital encoding
%   Takes a sequence string of zeros and ones and produces the corresponding
%   encoded signal using Manchester format.
%       0 = '+-'
%       1 = '-+'
%
%   The output will be presented as a sequence of - and + where:
%       '+-' means high to low 
%       '-+' means low to high
%
%   Example:
%       Enc_Manchester(10010111)  % returns string -++-+--++--+-+-+ 

if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
if ~ischar(Binary_input)            % if input is not provided as a string
    warning('Input number converted string, any leading zeros were removed');
    Binary_input=num2str(Binary_input);
end

Binary_input=replace(Binary_input,'0','+-');	% replace all 0's in the string  x with +-
out=replace(Binary_input,'1','-+'); % replace all 1's in the string  x with -+
