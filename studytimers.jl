module StudyTimers
using WAV
#the wav package must be installed: https://juliapackages.com/p/wav
#A simple timer for study.
#On your terminal, run: $julia StudyTimers.jl
#and then input, say, 5, to have 5 minutes of rest before the program beeps;
#or input, say, 30, to have 30 minutes of study before the program beeps.

    function TonePlayer()
        # println("\007\007\007\007\007\007")
        fs = 7e3
        t = 0.0:1/fs:prevfloat(0.3)
        f = 8e2 
        y = sin.(2pi * f * t) * 0.1 
        wavplay(y, fs) 
        wavplay(y, fs) 
        wavplay(y, fs)
        wavplay(y, fs) 
        wavplay(y, fs) 
        wavplay(y, fs)
        wavplay(y, fs) 
        wavplay(y, fs) 
        wavplay(y, fs)
    end

    function MinToSec(min) 
        sec = min * 60
        return sec
    end

    function CallBack(timer)
        TonePlayer()
    end

    input = readline()
    duration = parse(Float64, input)

    t = Timer(CallBack, MinToSec(duration))
    wait(t)

end
