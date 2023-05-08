SELECT concat_ws(' ', initcap(firstname), initcap(lastname)) as shortlist
 FROM Elves WHERE firstname LIKE '%tegil%' OR lastname LIKE '%astar%';