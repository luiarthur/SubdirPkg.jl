using Test
using SubdirPkg

@testset "greet" begin
  @test SubdirPkg.greet() == "Hello World!"
end
