resource "aws_cur_report_definition" "example_cur_report_definition" {
  report_name                = "map-migrated-report"
  time_unit                  = "DAILY"
  format                     = "textORcsv"
  compression                = "ZIP"
  additional_schema_elements = ["RESOURCES"]
  s3_bucket                  = aws_s3_bucket.cost_reports.bucket
  s3_region                  = "us-east-2"
  additional_artifacts       = ["REDSHIFT"]
  report_versioning          =  "CREATE_NEW_REPORT"
}