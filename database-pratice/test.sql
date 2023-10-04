


-- we have three table. workout, exercise and workout_exercise_relation
-- Select all exercise as comma seperated for a certain workout.id
SELECT w.name,w.id, string:agg(we.exercise_id,",") AS workoutlist
FROM workout w
INNER JOIN workout_exercise we ON w.id = we.workoutid
WHERE w.id = $workoutid$
GROUP BY(w.id,w.name)
ORDER BY we.sequence_no