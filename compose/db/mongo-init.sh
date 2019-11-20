#!bash

echo 'Creating application user and db'

mongo ${MONGO_INITDB_DATABASE} \
  --host localhost \
  --port ${DB_PORT} \
  -u ${MONGO_INITDB_ROOT_USERNAME} \
  -p ${MONGO_INITDB_ROOT_PASSWORD} \
  --authenticationDatabase admin \
  --eval "db.createUser({user: '${DB_USER}', pwd: '${DB_PASSWORD}', roles:[{role:'dbOwner', db: '${MONGO_INITDB_DATABASE}'}]});"
