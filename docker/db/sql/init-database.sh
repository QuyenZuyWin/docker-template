#run the setup script to create the DB and the schema in the DB

readonly USERNAME="docker"
readonly PASSWORD="docker"
readonly DATABASE="docker"
cd /docker-entrypoint-initdb.d
for file in `\find . -name '*.sql'`; do
 mysql -u ${USERNAME} -p${PASSWORD} ${DATABASE} < "/docker-entrypoint-initdb.d/${file}"
done
