import seaborn as sns
import pandas as pd

sns.set_theme(style="whitegrid")

results = [
    {'Evaluation': 'GraphX', 'Dataset': 'DBLP', 'Execution Time (s)': 300.474},
    {'Evaluation': 'GraphX', 'Dataset': 'WebStanford', 'Execution Time (s)': 298.333},
    {'Evaluation': 'GraphX', 'Dataset': 'Youtube', 'Execution Time (s)': 681.994},
    {'Evaluation': 'GraphX', 'Dataset': 'LiveJournal', 'Execution Time (s)': 9364.768},
    {'Evaluation': 'KnightKing', 'Dataset': 'DBLP', 'Execution Time (s)': 54.367},
    {'Evaluation': 'KnightKing', 'Dataset': 'WebStanford', 'Execution Time (s)': 54.896},
    {'Evaluation': 'KnightKing', 'Dataset': 'Youtube', 'Execution Time (s)': 58.831},
    {'Evaluation': 'KnightKing', 'Dataset': 'LiveJournal', 'Execution Time (s)':  61.337},
    {'Evaluation': 'FORA-MPI', 'Dataset': 'DBLP', 'Execution Time (s)': 6.745},
    {'Evaluation': 'FORA-MPI', 'Dataset': 'WebStanford', 'Execution Time (s)': 85.894},
    {'Evaluation': 'FORA-MPI', 'Dataset': 'Youtube', 'Execution Time (s)': 33730},
    {'Evaluation': 'FORA-MPI', 'Dataset': 'LiveJournal', 'Execution Time (s)': 33730},
    {'Evaluation': 'FORA-MPI-OPT', 'Dataset': 'DBLP', 'Execution Time (s)': 3.241},
    {'Evaluation': 'FORA-MPI-OPT', 'Dataset': 'WebStanford', 'Execution Time (s)': 23.318},
    {'Evaluation': 'FORA-MPI-OPT', 'Dataset': 'Youtube', 'Execution Time (s)': 4043},
    {'Evaluation': 'FORA-MPI-OPT', 'Dataset': 'LiveJournal', 'Execution Time (s)': 4043},
]

df = pd.DataFrame(results)

#df1 = df[(df['Dataset']=='DBLP')|(df['Dataset']=='WebStanford')]
#chart1 = sns.barplot(x="Evaluation", y="Execution Time (s)", hue='Dataset', data=df1)
#chart1.figure.savefig("output1.png")

df2 = df[(df['Dataset']=='Youtube')|(df['Dataset']=='LiveJournal')]
chart2 = sns.barplot(x="Evaluation", y="Execution Time (s)", hue='Dataset', data=df2)
chart2.figure.savefig("output2.png")
