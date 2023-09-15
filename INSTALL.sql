--
-- YOU HAVE TO INSTALL THE CORE PACKAGE FIRST
-- https://github.com/jkvetina/CORE23/tree/main/database
--
-- JOB .................... 1
-- MATERIALIZED VIEW ...... 1
-- PACKAGE ................ 3
-- PACKAGE BODY ........... 3
-- PROCEDURE .............. 1
-- TABLE ................. 11
-- TRIGGER ................ 5
-- VIEW .................. 10

--
-- INIT
--
@@"./patches/10_init/01_init.sql"

--
-- TABLES
--
@@"./database/tables/app_applications.sql"
@@"./database/tables/app_users.sql"
@@"./database/tables/app_roles.sql"
@@"./database/tables/app_navigation.sql"
@@"./database/tables/app_tables.sql"
@@"./database/tables/app_user_messages.sql"
@@"./database/tables/app_users_map.sql"
@@"./database/tables/app_procedures.sql"
@@"./database/tables/app_components.sql"
@@"./database/tables/app_pages.sql"
@@"./database/tables/app_roles_map.sql"

--
-- OBJECTS
--
@@"./patches/40_repeatable_objects/40_drop_objects.sql"
--
@@"./database/procedures/recompile.sql"
@@"./database/packages/core.spec.sql"
@@"./database/packages/gen_tapi.spec.sql"
@@"./database/views/app_lov_applications_v.sql"
@@"./database/views/app_lov_workspaces_v.sql"
@@"./database/packages/core.sql"
@@"./database/views/app_roles_v.sql"
@@"./database/views/app_user_profile_v.sql"
@@"./database/packages/gen_tapi.sql"
@@"./database/views/app_auth_components_v.sql"
@@"./database/views/app_auth_pages_v.sql"
@@"./database/views/app_launchpad_v.sql"
@@"./database/views/app_user_roles_v.sql"
@@"./database/views/app_users_v.sql"
@@"./database/packages/app.spec.sql"
@@"./database/views/app_navigation_v.sql"
@@"./database/packages/app.sql"

--
-- TRIGGERS
--
@@"./database/triggers/app_roles_map__.sql"
@@"./database/triggers/app_navigation__.sql"
@@"./database/triggers/app_users_map__.sql"
@@"./database/triggers/app_roles__.sql"
@@"./database/triggers/app_users__.sql"

--
-- MVIEWS
--
@@"./patches/50_mviews/50_recompile.sql"
--
@@"./database/mviews/app_navigation_map_mv.sql"

--
-- INDEXES
--
@@"./patches/55_indexes/50_recompile.sql"

--
-- DATA
--
@@"./patches/60_data/app_navigation.sql"
--
COMMIT;

--
-- JOBS
--
@@"./database/jobs/app_navigaton_map_refresh.sql"

--
-- FINALLY
--
@@"./patches/90_finally/98_checks.sql"
@@"./patches/90_finally/96_stats.sql"
@@"./patches/90_finally/93_audit_colums.sql"
@@"./patches/90_finally/94_indexes.sql"
@@"./patches/90_finally/90_recompile.sql"
@@"./patches/90_finally/92_refresh_mvw.sql"

--
-- APEX
--
@@"./database/apex/f800/f800.sql"
@@"./database/apex/f801/f801.sql"

