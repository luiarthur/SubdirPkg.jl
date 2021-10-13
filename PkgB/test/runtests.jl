using Test
using Distributions
using PkgB
using Random

@testset "randchisq2" begin
  Random.seed!(0)
  x = [PkgB.randchisq2() for _ in 1:1_000_000]
  @test isapprox(mean(x), 2, rtol=0.01)
  @test isapprox(var(x), 4, rtol=0.01)
end
