CREATE ROLE aether_user WITH LOGIN PASSWORD 'aether_password';
GRANT ALL PRIVILEGES ON DATABASE aether TO aether_user;
GRANT ALL PRIVILEGES ON DATABASE aether_shard_1 TO aether_user;
GRANT ALL PRIVILEGES ON DATABASE aether_shard_2 TO aether_user;
GRANT ALL PRIVILEGES ON DATABASE aether_shard_3 TO aether_user;
