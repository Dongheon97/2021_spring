describe emp;

SELECT u1.table_name, column_name, constraint_type,
u1.constraint_name
FROM user_constraints u1
JOIN user_cons_columns u2
ON u1.constraint_name=u2.constraint_name
WHERE u1.table_name = UPPER('EMP');

ALTER TABLE EMP
ADD CONSTRAINT EMP_CHECK CHECK(SAL >= 800);

SELECT constraint_name, search_condition
FROM user_constraints
WHERE table_name='EMP';

ALTER TABLE EMP
ADD CONSTRAINT EMP_CHECK_ADDRESS
CHECK (ADDRESS IN('서울', '인천', '대전', '광주', '대구', '울산', '부산'));
