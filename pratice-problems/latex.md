# Some of the most common command of latexmk

latexmk -c :: delete extra file
latexmk -C :: delete extract file + .pdf + like this

# In this project/pdf we have a list of following
Problem Name in toc -> link to solution page on pdf

On the solution page follow these.
(a) If the question is simple & require no diagram => link to LC300Solution.cpp File

(b) If the problem is good & have variout solution but no diagram => mention the solutoin in .tex & link the final solution.cpp file

(c) If the solution explanantion require image => add to .tex, then in lower part add the code also.
In last link to solution.cpp file.

GOAL: goal is to use LC300.cpp file as solution sheet You write them as you would have written in copy for future refereance. (and that's all)

- use asparaenum for compact enumlist