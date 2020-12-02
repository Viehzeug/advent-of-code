function task1()
    lines = readlines("in.txt")
    cnt_correct = 0
    for l in lines
        m = match(r"(\d+)[-](\d+)\s([a-z]):\s([a-z]+)", l)
        min = parse(Int, m[1])
        max = parse(Int, m[2])
        letter = m[3][1]
        pw = m[4]
        letter_cnt = 0
        for pwc in pw
            if pwc == letter
               letter_cnt += 1
            end
        end
        if min <= letter_cnt <= max
           cnt_correct += 1
        end
    end
    println(cnt_correct)
end

function task2()
    lines = readlines("in.txt")
    cnt_correct = 0
    for l in lines
        m = match(r"(\d+)[-](\d+)\s([a-z]):\s([a-z]+)", l)
        idx = [parse(Int, m[1]), parse(Int, m[2])]
        letter = m[3][1]
        pw = m[4]

        matches = [pw[i] == letter for i in idx]
        if sum(matches) == 1
           cnt_correct += 1
        end      
    end
    println(cnt_correct)
end


task1()
task2()