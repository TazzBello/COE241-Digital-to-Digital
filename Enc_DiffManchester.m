function [out] = Enc_DiffManchester(Binary_input)
%Enc_DiffManchester: Differntial Manchester digital encoding
%   Takes a sequence string of zeros and ones and produces the corresponding
%   encoded signal using Differential Manchester format.
%       0 = '+-'
%       1 = '-+'
%
%   The output will be presented as a sequence of - and + where:
%       '+-' means high to low 
%       '-+' means low to high
%
%   Example:
%       Enc_DiffManchester(1100111)should produce -+-+-++-+--++--+

if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
if ~ischar(Binary_input)            % if input is not provided as a string
    warning('Input number converted string, any leading zeros were removed');
    Binary_input=num2str(Binary_input);
end

lastLevel = '+-';
str =blanks(length(Binary_input)*2);
j =1;
for i = 1:1:length(Binary_input)
  if (Binary_input(i) == '1')
      if (lastLevel(1)=='+')
          str(j:j+1) = '-+';
          lastLevel = '-+';
          j = j+2;
      else
          str(j:j+1) = '+-';
          lastLevel = '+-';
          j = j+2;
      end
  else
       str(j:j+1) =lastLevel;
       disp(str)
       j=j+2;
  end
end

out = str;

