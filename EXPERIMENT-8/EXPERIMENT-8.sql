CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    class INT
);

DO $$
BEGIN

    BEGIN
	
        INSERT INTO students(name, age, class) VALUES ('Gagnesh',15,8);
        INSERT INTO students(name, age, class) VALUES ('Jaidev',16,8);
        INSERT INTO students(name, age, class) VALUES ('Rahul',19,9);
		INSERT INTO students(name, age, class) VALUES ('Jatin',19,9);
		INSERT INTO students(name, age, class) VALUES (19,9);

        RAISE NOTICE 'Transaction Successfully Done';

    EXCEPTION
        WHEN OTHERS THEN
		
            RAISE NOTICE 'Transaction Failed..! Rolling back changes.';
            RAISE;
    END;
END;
$$;


SELECT * FROM students;
