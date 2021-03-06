CREATE EXTENSION hstore;
CREATE EXTENSION ltree;
CREATE EXTENSION citext;

DO $$
DECLARE
  stmts CURSOR FOR
    SELECT tablename FROM pg_tables
    WHERE schemaname = 'public';
BEGIN
  FOR stmt IN stmts LOOP
    EXECUTE 'DROP TABLE ' || quote_ident(stmt.tablename) || ';';
  END LOOP;
END;
$$
