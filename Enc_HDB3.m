function [out] = Enc_HDB3(Binary_input)
%Enc_HDB3: High Density Bipolar with 3 zero substiutiondigital encoding
%   HBD3 based on bipolar AMI. Substitutes four consecutive zeros with 000V or B00V depending on
%   the number of nonzero pulses after the last substitution
%                      Number of Bipolar Pulses (ones) 
%                           since Last substiution
%   Polarity of
%   preceeding Pulse        Odd             Even
%       -                   000-            +00+
%       +                   000+            -00-
%
%   The output will be presented as a sequence of - and + and zeros where:
%       '+' means high pulse
%       '-' means low pulse
%       '0' no Pulse
%
%   Example:
%       Enc_HDB3(1100000000110000010)should produce +-000-+00+-+-00-0+0
%   Assuming the last pulse before the start of the program is negative �-�
%   The total number of 1s since the last substitution 
%   (before the start of the program) is odd.

if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
if ~ischar(Binary_input)            % if input is not provided as a string
    warning('Input number converted string, any leading zeros were removed');
    Binary_input=num2str(Binary_input);
end

lastSignal = '-'; %the signal of the last '1'
oddOnes = 1;
numZeros = 0.0;

for i=1:1:length(Binary_input) %loop to go through the string
   if(Binary_input(i)=='1') %if a '1' is found change it to the inverse of the previous '1' signal
      if(lastSignal=='-')
          numZeros =0;  
          oddOnes = ~oddOnes;
          Binary_input(i)='+'; 
          lastSignal='+';
          
      elseif (lastSignal=='+')
          Binary_input(i)='-';
          oddOnes = ~oddOnes;
          lastSignal='-';
      end 
   else
       if(numZeros == 3)
          if (oddOnes && lastSignal == '-')
              Binary_input(i-3:i) ='000-';
              lastSignal = '-';
          elseif (oddOnes && lastSignal == '+')
              Binary_input(i-3:i) ='000+';
              lastSignal = '+';
          elseif (~oddOnes && lastSignal == '-')
              Binary_input(i-3:i) ='+00+';
              lastSignal = '+';
          else
              Binary_input(i-3:i) ='-00-';
              lastSignal = '-';
          end
          numZeros = 0;
          oddOnes =0;
       else
           numZeros = numZeros + 1;
       end
   end
end

out=Binary_input;

