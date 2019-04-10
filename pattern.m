
function [history,xsol,fsol] = pattern(n,I)

% Set up shared variables with OUTFUN
history.x = [];
history.fval = [];

% call optimization

options = psoptimset;
options = psoptimset(options,'TolMesh', 1e-3);
options = psoptimset(options,'MaxIter', 50);
options = psoptimset(options,'MaxMeshSize', 0.05);
options = psoptimset(options,'OutputFcn',@outfun);
[xsol,fsol] = patternsearch(@(x)SMED(x),I,[],[],[],[],zeros(1,2*n),10*ones(1,2*n),options);


    function [stop,options,optchanged] = outfun(optimvalues,options,flag)
        
        % Concatenate current point and objective function
        % value with history. x must be a row vector.
        history.fval = [history.fval; optimvalues.fval];
        history.x = [history.x; optimvalues.x];
        stop = false;
        optchanged = false;
        
    end

end
