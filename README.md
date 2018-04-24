# backup-mongo-azure

Image prepared to backup Mongo database to Microsoft Azure.

The backup runs once a day

## Configuration

The container can be customized with these environment variables:

Name | Default Value | Description
--- | --- | ---
AZURE_STORAGE_ACCOUNT | `blank` | Your Azure storage account name to keep the backup
AZURE_STORAGE_ACCESS_KEY | `blank` | Your Azure storage access key to access the storage account
AZURE_STORAGE_CONTAINER | `blank` | The Azure storage container to keep the backup
MONGO_HOST | --- | Address the MySQL server is accessible at
MONGO_PORT | 27017 | Port the MySQL server is accessible on
MONGO_USER | `blank` | User to connect as
MONGO_PASSWORD | `blank` | Password to use when connecting
MONGO_DB | `blank` | Database to backup



