with sa_snapshot as (
  select * from pg_stat_activity
  where datname = current_database()
  and not query like 'autovacuum:%'
  and pid != pg_backend_pid()
)
select
  (select count(*) from sa_snapshot) as total,
  (select count(*) from pg_stat_activity
    where pid != pg_backend_pid()) as instance_total,
  current_setting('max_connections')::int as max_connections,
  (select count(*) from sa_snapshot where state = 'active') as active,
  (select count(*) from sa_snapshot where state = 'idle') as idle,
  (select count(*) from sa_snapshot
    where state = 'idle in transaction') as idleintransaction,
  (select count(*) from sa_snapshot
    where wait_event_type in ('LWLockNamed', 'Lock', 'BufferPin'))
    as waiting,
  (select extract(epoch from max(now() - query_start))::int
    from sa_snapshot where wait_event_type
    in ('LWLockNamed', 'Lock', 'BufferPin'))
    as longest_waiting_seconds,
  (select extract(epoch from (now() - backend_start))::int
    from sa_snapshot order by backend_start limit 1)
    as longest_session_seconds,
  (select extract(epoch from (now() - xact_start))::int
    from sa_snapshot where xact_start is not null
    order by xact_start limit 1) as longest_tx_seconds,
  (select extract(epoch from (now() - xact_start))::int
    from pg_stat_activity where query like 'autovacuum:%'
    order by xact_start limit 1) as longest_autovacuum_seconds,
  (select extract(epoch from max(now() - query_start))::int
    from sa_snapshot where state = 'active') as longest_query_seconds,
  (select max(age(backend_xmin))::int8 from sa_snapshot)
    as max_xmin_age_tx,
  (select count(*) from pg_stat_activity
    where datname = current_database()
    and query like 'autovacuum:%') as av_workers;
