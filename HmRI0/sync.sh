AWS_PROFILE=davidroussov aws s3 sync . "s3://david-roussov-$(basename "$PWD")" --delete
