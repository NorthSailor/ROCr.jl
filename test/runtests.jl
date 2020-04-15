using HSARuntime
using Test

if HSARuntime.configured
    agents = get_agents()
    if length(agents) > 0
        include("agent.jl")
        include("array.jl")
        include("memory.jl")
    else
        @warn("No devices detected; skipping on-device tests")
    end
else
    @warn("HSARuntime.jl has not been configured; skipping on-device tests.")
end

#=
queue = HSAQueue(agent)
kernel = HSAKernel(agent, executable, "&__vector_copy_kernel")
inp = zeros(HSAArray{UInt32}, 1024, 1024)
out = ones(HSAArray{UInt32}, 1024, 1024)
args = HSAKernelArgs(inp, out)
signal = HSASignal()
launch(queue, kernel, args, signal;
       workgroup_size=(256,1,1),
       grid_size=(1024*1024,1,1))
wait(signal)
=#
