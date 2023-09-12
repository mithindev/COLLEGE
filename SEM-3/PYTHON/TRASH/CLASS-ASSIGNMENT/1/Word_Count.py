def wordCount(word, target):
    count = 0
    for letter in word:
        if letter == target:
            count += 1

    return  count
        
print(wordCount('malayalam', 'm'))
