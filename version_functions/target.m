function y = target(varargin)
%CODER.TARGET Determine the current code-generation target
%
%   CODER.TARGET('TARGET') determines if the specified TARGET is the
%   current code generation target. The following TARGET values may be
%   specified:
%       MATLAB      True if running in MATLAB (not generating code).
%       MEX         True if generating a MEX function.
%       Sfun        True if simulating a Simulink model.
%       Rtw         True if generating a LIB, DLL or EXE target.
%       HDL         True if generating an HDL target.
%       Custom      True if generating a custom target.
%
%   Example:
%       if coder.target('MATLAB')
%           % running in MATLAB
%       else
%           % running in generated code
%       end
%
%   See also coder.ceval.

%   Copyright 2006-2013 The MathWorks, Inc.

if nargin == 0
    % Backward compatibility
    y = '';
else
    target = varargin{1};
    y = isempty(target) || (ischar(target) && strcmpi(target, 'MATLAB'));
end
