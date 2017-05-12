function [out] = Enc_BipolarAMI(Binary_input)
% BipolarAMI Bipolar  alternate mark inversion encoding
%   Takes a sequence string of zeros and ones and produces the corresponding
%   encoded binary signal using BipolarAMI format.
%       0 = zero level
%       1 = low/high level(the inverse of the last '1')
%
%   The output will be presented as a sequence of 0, - and + where:
%       '0' means zero signal
%       '-' means negative signal
%       '+' means positive signal
%
%   Example:
%       Enc_BipolarAMI(10010111)  % returns string +00-0+-+ 


if nargin~=1		% check if the number of input arguments is not exactly 1
    error('You must provide exactly one input argument');
end
if ~ischar(Binary_input)            % if input is not provided as a string
    warning('Input number converted string, any leading zeros were removed');
    Binary_input=num2str(Binary_input);
end
lastSignal = '-'; %the signal of the last '1'
for i=1:1:length(Binary_input) %loop to go through the string
 if(Binary_input(i)=='1') %if a '1' is found change it to the inverse of the previous '1' signal
     if(lastSignal=='-')
       Binary_input(i)='+'; 
       lastSignal='+';
     else
       Binary_input(i)='-';
       lastSignal='-';
     end    
 end
end 
out=Binary_input;
