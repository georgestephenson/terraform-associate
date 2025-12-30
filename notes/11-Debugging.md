# Debugging Terraform notes

- Terraform CLI has different log levels on commands
- Can set log level with `TF_LOG` environment level which enables the detailed logging
  - TRACE - most detailed/verbose
  - DEBUG
  - INFO
  - WARN
  - ERROR - least detailed/verbose
- `TF_LOG_PATH` - log will be appended to specified file