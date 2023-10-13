#!/bin/bash

IFS=',' read -ra DB_NAMES <<< "$DB_NAMES"

for DB_NAME in "${DB_NAMES[@]}"; do
    echo "Creando base de datos: $DB_NAME"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE DATABASE "$DB_NAME";
EOSQL
done

for DB_NAME in "${DB_NAMES[@]}"; do
    echo "Configurando base de datos: $DB_NAME"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$DB_NAME" <<-EOSQL
        CREATE TABLE public.user (
            "user_id" uuid NOT NULL,
            "name" varchar NOT NULL,
            email varchar NOT NULL,
            "password" varchar NOT NULL,
            "role" varchar NOT NULL,
            branch_id uuid NULL,
            CONSTRAINT "user_pkey" PRIMARY KEY ("user_id"),
	        CONSTRAINT "user_email_key" UNIQUE (email)
        );

        INSERT INTO public.user (
            user_id,
            name,
            email,
            password,
            role,
            branch_id
        )
        SELECT
            '35a64a10-8288-4d8c-bc20-1aad606eff15',
            'SuperAdmin',
            'superadmin@superadmin.com',
            'superadmin',
            'superAdmin',
            null
        WHERE NOT EXISTS (
            SELECT 1
            FROM public.user
        );
EOSQL
done
