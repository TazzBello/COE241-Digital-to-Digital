function [out] = Enc_NRZI(Binary_input)
%Enc_NRZI Non return to Zero-Invert digital encoding
%   Takes a sequence string of zeros and ones and produces the corresponding
%   encoded binary signal using NRZI format.
%       0 = produce same last level
%       1 = invert last level
%
%   The output will be presented as a sequence of - and + where:
%       '-' means negative signal
%       '+' means positive signal
%
%   Example:
%       Enc_NRZI(10010111)  % returns string +++--+-+ 

if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
if ~ischar(Binary_input)            % if input is not provided as a string
    warning('Input number converted string, any leading zeros were removed');
    Binary_input=num2str(Binary_input);
end

lastLevel = '-';

for i = 1:1:length(Binary_input)
  if (Binary_input(i) == '1')
      if (lastLevel == '-')
          Binary_input(i) = '+';
          lastLevel = '+';
      else
          Binary_input(i) = '-';
          lastLevel = '-';
      end
  else
       Binary_input(i) =lastLevel;
  end
end

out = Binary_input;

