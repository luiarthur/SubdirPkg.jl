module PkgB

using Distributions

randchisq2() = sum(randn(2) .^ 2)

end # module
