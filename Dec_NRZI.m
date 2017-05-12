function [out] = Dec_NRZI(Signal_input)
%Dec_NRZI Non return to Zero-Invert digital decoding
%   Takes a sequence string of '+' levels and '-' levels and produces the corresponding
%   decoded binary output from the NRZI format.
%       same level as last level = 0
%       inverted last level = 1
%
%   The output will be presented as a sequence of 1's and 0's where:
%       '1' means binary 1
%       '0' means binary 0
%
%   Example:
%       Dec_NRZI(+++--+-+)  % returns string 10010111 

if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end

lastLevel = '-';

for i = 1:1:length(Signal_input)
  if (Signal_input(i) == lastLevel) % if the signal recieved is equal to is previous level
      lastLevel = Signal_input(i); % last signal = current signal
      Signal_input(i) = '0'; % change the signal in the string to 0
  else % if the signal recieved is not equal to is previous level
      lastLevel = Signal_input(i); % last signal = current signal
      Signal_input(i) = '1'; % change the signal in the string to 1
  end
end

out = Signal_input; 

