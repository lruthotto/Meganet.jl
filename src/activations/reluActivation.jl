export reluActivation, reluActivation!

"""
 relu activation A = relu(Y)

 Input:

   Y - array of features

 Optional Input:

   doDerivative - flag for computing derivative, set via varargin
                  Ex: reluActivation(Y,true);

 Output:

  A  - activation
  dA - derivatives
"""
function reluActivation(Y::Array{T},doDerivative::Bool=false) where {T}

    A = max.(Y,zero(T));

    if doDerivative
        dA = sign.(A);
    else
        dA = zeros(T,0)
    end

    return A,dA
end



function reluActivation!(A::Array{T},dA,doDerivative::Bool=false) where {T}
    A .= max.(A,zero(T));   
    if doDerivative
        if isempty(dA)
            dA = sign.(A);
        else
            dA .= sign.(A);
        end
    end
    return A,dA
end
