# Author: Lawrence MH LO
# Version: 1.2 beta
# Date: 2022 / 11 / 13
# Description: A simple timer for study or other purposes.

module StudyTimers
using WAV

# **** Usage guide ***
# The WAV package must be installed: https://juliapackages.com/p/wav
# Instructions for adding WAV package: https://docs.julialang.org/en/v1/stdlib/Pkg/
# On your terminal, run: $julia StudyTimers.jl
# and then input, say, 5, to have 5 minutes of rest before the program beeps;
# or input, say, 30, to have 30 minutes of study before the program beeps.

function TonePlayer()
    # obsolete: println("\007\007\007\007\007\007")
    # the WAV package must be installed: https://juliapackages.com/p/wav
    fs = 6e3                    # sampling frequency / number of samples per second in a beep
    t = 0.0:1/fs:prevfloat(1.0) # time range (with steps) of a beep; 1/fs: the interval between the samples.
    f = 8e2                     # frequency in Hz (X cycles in 1 second)
    a = 0.7                     # amplitude 
    y = sin.(2pi * f * t) * a 
    for i = 1:6
        wavplay(y, fs) 
    end
end

# Declaring more functions 
MinToSec(min) = min * 60
CallBack(timer) = TonePlayer()

#interface 
println("Enter the duration in minutes before the program beeps")
println("(as one non-negative decimal):")
input = readline()
duration = parse(Float64, input)

#Run timer
t = Timer(CallBack, MinToSec(duration))
wait(t)

end
