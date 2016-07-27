function errorIf(cond, msgID, varargin)
%MATLAB Code Generation Private Function

%   Copyright 2011-2014 The MathWorks, Inc.

%MATLAB execution
if cond
    assert(false, message(msgID, varargin{:}));
end
