function narginchk(minargs, maxargs)
%NARGINCHK Validate number of input arguments. 
%   NARGINCHK(LOW,HIGH) throws an error if nargin is less than LOW or
%   greater than HIGH.
%
%   Example
%      narginchk(1, 3)

  if (nargin ~= 2)
    error('%s: Usage: narginchk(minargs, maxargs)',upper(mfilename));
  elseif (~isnumeric (minargs) || ~isscalar (minargs))
    error ('minargs must be a numeric scalar');
  elseif (~isnumeric (maxargs) || ~isscalar (maxargs))
    error ('maxargs must be a numeric scalar');
  elseif (minargs > maxargs)
    error ('minargs cannot be larger than maxargs')
  end


  args = evalin ('caller', 'nargin;');


  if (args < minargs)
    error ('not enough input arguments');
  elseif (args > maxargs)
    error ('too many input arguments');
  end

end