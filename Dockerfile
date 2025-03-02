FROM python:3.9-slim

# Install dbt-core and the postgres adapter
RUN pip install --no-cache-dir dbt-core dbt-postgres

# Set working directory and copy your project files
WORKDIR /app
COPY . .

# Set the DBT_PROFILES_DIR so that your profiles.yml is used
ENV DBT_PROFILES_DIR=/app

# Default command can be changed as needed
CMD ["dbt", "run"]
