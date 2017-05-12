function [out] = Enc_Pseudoternary(Binary_input)
% BipolarAMI Bipolar  alternate mark inversion encoding
%   Takes a sequence string of zeros and ones and produces the corresponding
%   encoded binary signal using Pseudoternary format.
%       0 = low/high level(the inverse of the last '0')
%       1 = zero level
%
%   The output will be presented as a sequence of 0, - and + where:
%       '0' means zero signal
%       '-' means negative signal
%       '+' means positive signal
%
%   Example:
%       Enc_Pseudoternary(10010111)  % returns string 0+-0+000


if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
if ~ischar(Binary_input)            % if input is not provided as a string
    warning('Input number converted string, any leading zeros were removed');
    Binary_input=num2str(Binary_input);
end
lastSignal = '-'; %the signal of the last '0'

for i=1:1:length(Binary_input) %loop to go through the string
 if(Binary_input(i)=='0') %if a '0' is found change it to the inverse of the previous '0' signal
     if(lastSignal=='-')
       Binary_input(i)='+'; 
       lastSignal='+';
     else
       Binary_input(i)='-';
       lastSignal='-';
     end    
 end
end 

for i=1:1:length(Binary_input) %change '1' to '0'
    if(Binary_input(i)=='1')
       Binary_input(i)='0';   
    end
end
out=Binary_input;
