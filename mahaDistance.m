function d = mahaDistance(x,C,varargin)

    if nargin ==2
        d = x'/C*x;
    end
    
    if nargin == 3
        x0 = varargin{1};
        d = (x-x0)'/C*(x-x0);
    end





end