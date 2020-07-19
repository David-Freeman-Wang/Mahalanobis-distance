function f = pdf(x,C,varargin)

    if nargin ==2
        f = 1/sqrt(det(2*pi*C)) * exp(-1/2*x'/C*x);
    end
    
    if nargin == 3
        x0 = varargin{1};
        f = 1/sqrt(det(2*pi*C)) * exp(-1/2*(x-x0)'/C*(x-x0));
    end





end