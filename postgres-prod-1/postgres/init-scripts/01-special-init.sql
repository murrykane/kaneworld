-- Create roles (passwords come from your .env file ideally, or set here)
CREATE USER linkwarden  WITH PASSWORD 'Skippy10!' CONNECTION LIMIT 20;
CREATE USER dockhand    WITH PASSWORD 'Skippy10!' CONNECTION LIMIT 10;
CREATE USER n8n         WITH PASSWORD 'Skippy10!' CONNECTION LIMIT 20;
CREATE USER scanopy     WITH PASSWORD 'Skippy10!' CONNECTION LIMIT 10;
CREATE USER immich      WITH PASSWORD 'Skippy10!' CONNECTION LIMIT 30;
CREATE USER paperless   WITH PASSWORD 'Skippy10!' CONNECTION LIMIT 10;
CREATE USER semaphore   WITH PASSWORD 'Skippy10!' CONNECTION LIMIT 10;
CREATE USER authentik   WITH PASSWORD 'Skippy10!' CONNECTION LIMIT 10;

-- Create databases
CREATE DATABASE linkwarden  OWNER linkwarden;
CREATE DATABASE dockhand    OWNER dockhand;
CREATE DATABASE n8n         OWNER n8n;
CREATE DATABASE scanopy     OWNER scanopy;
CREATE DATABASE immich      OWNER immich;
CREATE DATABASE paperless   OWNER paperless;
CREATE DATABASE semaphore   OWNER semaphore;
CREATE DATABASE authentik   OWNER authentik;

-- Revoke default public schema access (security hardening)
REVOKE ALL ON DATABASE linkwarden  FROM PUBLIC;
REVOKE ALL ON DATABASE dockhand    FROM PUBLIC;
REVOKE ALL ON DATABASE n8n         FROM PUBLIC;
REVOKE ALL ON DATABASE scanopy     FROM PUBLIC;
REVOKE ALL ON DATABASE immich      FROM PUBLIC;
REVOKE ALL ON DATABASE paperless   FROM PUBLIC;
REVOKE ALL ON DATABASE semaphore   FROM PUBLIC;
REVOKE ALL ON DATABASE authentik   FROM PUBLIC;