with open('in.txt', 'r') as f:
    lines = f.readlines()
    numbers = [int(l) for l in lines]
    n = len(numbers)
    for i in range(n):
        for j in range(i+1, n):
            if numbers[i] + numbers[j] == 2020:
                print(numbers[i], numbers[j], numbers[i] * numbers[j])

    for i in range(n):
        for j in range(i+1, n):
            for k in range(j+1, n):
                if numbers[i] + numbers[j] + numbers[k] == 2020:
                    print(numbers[i], numbers[j], numbers[k], numbers[i] * numbers[j] * numbers[k])                
