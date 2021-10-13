using Test
using Distributions
using PkgA
using Random

@testset "randchisq1" begin
  Random.seed!(0)
  x = [PkgA.randchisq1() for _ in 1:1_000_000]
  @test isapprox(mean(x), 1, rtol=0.01)
  @test isapprox(var(x), 2, rtol=0.01)
end
