arch = Sys.ARCH

function build(precision::Int, isWindows::Bool)::Nothing
    #run(`git clone git@github.com:QuEST-Kit/QuEST.git && mkdir build && cd build`)
    isWindows ? run(`cmake -DPRECISION=$precision .. -G "MinGW Makefiles"`) :
                run(`cmake -DPRECISION=$precision ..`)
    run(`make`)
    #println("After make")
end

if Symbol("x86_64") == arch && Sys.isunix()
    cd("/home/hopery/Documents/job/testing/QuEST/build")
    build(2, false)
elseif Symbol("x86_64") == arch && Sys.iswindows()
    build(2, true)
elseif Symbol("x86_32") == arch && Sys.isunix()
    build(1, false)
elseif Symbol("x86_32") == arch && Sys.iswindows()
    build(1, true)
else
    error("Architecture/OS not supported")
end

