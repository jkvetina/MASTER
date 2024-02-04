--
-- YOU HAVE TO INSTALL THE CORE PACKAGE FIRST
-- https://github.com/jkvetina/CORE23/tree/main/database
--
-- INDEX ................. 10
-- JOB .................... 1
-- MATERIALIZED VIEW ...... 3
-- PACKAGE ................ 4
-- PACKAGE BODY ........... 4
-- PROCEDURE .............. 1
-- TABLE ................. 17
-- TRIGGER ............... 16
-- VIEW .................. 33

--
-- INIT
--
@@"./patches/10_init/01_init.sql"

--
-- TABLES
--
@@"./database/tables/app_applications.sql"
@@"./database/tables/app_tracking_src.sql"
@@"./database/tables/app_user_requests.sql"
@@"./database/tables/app_users.sql"
@@"./database/tables/app_contexts.sql"
@@"./database/tables/app_lovs.sql"
@@"./database/tables/app_roles.sql"
@@"./database/tables/app_navigation.sql"
@@"./database/tables/app_settings.sql"
@@"./database/tables/app_tables.sql"
@@"./database/tables/app_user_messages.sql"
@@"./database/tables/app_users_map.sql"
@@"./database/tables/app_procedures.sql"
@@"./database/tables/app_components.sql"
@@"./database/tables/app_contexts_map.sql"
@@"./database/tables/app_pages.sql"
@@"./database/tables/app_roles_map.sql"

--
-- OBJECTS
--
@@"./patches/40_repeatable_objects/40_drop_objects.sql"
--
@@"./database/views/app_lov_tracking_source_v.sql"
@@"./database/procedures/recompile.sql"
@@"./database/packages/app_tracking.spec.sql"
@@"./database/views/app_lov_users_all_v.sql"
@@"./database/views/app_lov_workspaces_v.sql"
@@"./database/views/app_navigation_public_v.sql"
@@"./database/views/app_p880_invalid_objects_v.sql"
@@"./database/views/app_p880_mv_overview_v.sql"
@@"./database/views/app_users_devices_v.sql"
@@"./database/packages/app_nav.spec.sql"
@@"./database/views/app_lov_page_groups_v.sql"
@@"./database/views/app_lov_role_groups_v.sql"
@@"./database/views/app_lov_roles_v.sql"
@@"./database/views/app_lov_tracking_metrics_v.sql"
@@"./database/views/app_lov_users_v.sql"
@@"./database/views/app_navigation_grid_v.sql"
@@"./database/views/app_roles_v.sql"
@@"./database/views/app_tracking_base_v.sql"
@@"./database/views/app_user_profile_v.sql"
@@"./database/views/app_user_street_credit_v.sql"
@@"./database/views/app_user_v.sql"
@@"./database/packages/app_tracking.sql"
@@"./database/views/app_auth_components_v.sql"
@@"./database/views/app_auth_pages_v.sql"
@@"./database/views/app_launchpad_v.sql"
@@"./database/views/app_lov_applications_v.sql"
@@"./database/views/app_lov_pages_v.sql"
@@"./database/views/app_user_roles_v.sql"
@@"./database/views/app_users_v.sql"
@@"./database/packages/app.spec.sql"
@@"./database/views/app_lov_tracking_pages_v.sql"
@@"./database/views/app_lov_tracking_sessions_v.sql"
@@"./database/views/app_lov_tracking_users_v.sql"
@@"./database/views/app_navigation_badges_v.sql"
@@"./database/packages/app_auth.spec.sql"
@@"./database/views/app_auth_grids_v.sql"
@@"./database/packages/app_nav.sql"
@@"./database/views/app_navigation_v.sql"
@@"./database/views/app_qa_grids_v.sql"
@@"./database/views/app_tracking_chart_v.sql"
@@"./database/packages/app.sql"
@@"./database/packages/app_auth.sql"

--
-- TRIGGERS
--
@@"./database/triggers/app_applications__.sql"
@@"./database/triggers/app_components__.sql"
@@"./database/triggers/app_contexts__.sql"
@@"./database/triggers/app_contexts_map__.sql"
@@"./database/triggers/app_lovs__.sql"
@@"./database/triggers/app_navigation__.sql"
@@"./database/triggers/app_pages__.sql"
@@"./database/triggers/app_procedures__.sql"
@@"./database/triggers/app_roles_map__.sql"
@@"./database/triggers/app_settings__.sql"
@@"./database/triggers/app_tables__.sql"
@@"./database/triggers/app_user_messages__.sql"
@@"./database/triggers/app_user_requests__.sql"
@@"./database/triggers/app_users_map__.sql"
@@"./database/triggers/app_roles__.sql"
@@"./database/triggers/app_users__.sql"

--
-- MVIEWS
--
@@"./patches/50_mviews/50_recompile.sql"
--
@@"./database/mviews/app_tracking_src_mv.sql"
@@"./database/mviews/app_navigation_map_mv.sql"
@@"./database/mviews/app_navigation_map_tree_mv.sql"

--
-- INDEXES
--
@@"./patches/55_indexes/50_recompile.sql"
--
@@"./database/indexes/app_navigation_map_mv_p1.sql"
@@"./database/indexes/app_navigation_map_tree_mv_p1.sql"
@@"./database/indexes/fk_app_components_page.sql"
@@"./database/indexes/fk_app_components_role.sql"
@@"./database/indexes/fk_app_navigation_parent.sql"
@@"./database/indexes/fk_app_pages_role.sql"
@@"./database/indexes/fk_app_procedures_role.sql"
@@"./database/indexes/fk_app_tables_role.sql"
@@"./database/indexes/fk_app_user_messages_user_id.sql"
@@"./database/indexes/fk_app_users_map_app.sql"

--
-- DATA
--
@@"./patches/60_data/app_applications.sql"
@@"./patches/60_data/app_lovs.sql"
@@"./patches/60_data/app_navigation.sql"
@@"./patches/60_data/app_contexts.sql"
@@"./patches/60_data/app_settings.sql"
--
COMMIT;

--
-- JOBS
--
@@"./database/jobs/app_mv_refresh.sql"

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

