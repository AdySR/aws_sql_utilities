
Create table audit_file_table
(
fileid string, filegroup string, filename string, source_ts_datetime timestamp, job_start_datetime timestamp, job_end_datetime timestamp
)
PARTITIONED BY (`filegroup`, bucket(16,`fileid`))
LOCATION 's3://s3-storage-iris/config_tables/audit_file_table/'
TBLPROPERTIES (
  'table_type'='iceberg',
  'write_compression'='snappy',
  'format'='parquet',
  'optimize_rewrite_delete_file_threshold'='10'
);

-- drop table file_load_audit_iceberg

insert into audit_file_table
select 'csv_1', 'employee', 'employee.csv',cast('2023-12-23 09:34:24.968' as timestamp),cast('2023-12-23 13:34:24.968' as timestamp),cast('2023-12-23 15:34:24.968' as timestamp)



