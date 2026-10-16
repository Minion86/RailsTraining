# Security remediation assessment — 2026-10-16

Status: migration required; current vulnerabilities are not fixed.

An OSV scan of the six Ruby Gemfile.lock files found vulnerable Rails, Rack, Nokogiri, Puma and other dependencies. Several findings cannot be cleared on the existing Rails/Ruby versions. The checked-in npm lockfiles report zero findings under npm, but that does not establish security of the Ruby applications or the old Webpacker/Yarn dependency trees.

## Required implementation

Migrate each training application to a supported Ruby and Rails combination; update database adapters, Devise/JWT dependencies, Rack middleware, asset tooling and lockfiles together. Run migrations and each application test suite against disposable databases. Replace Webpacker with maintained tooling and scan both Ruby and JavaScript dependencies. Do not downgrade packages or dismiss alerts to make scans green.

## Affected projects

- repos/RailsTraining/Level 1/blog/Gemfile.lock: 20 vulnerable packages in the scanned lockfile.
- repos/RailsTraining/Level 2/store/Gemfile.lock: 19 vulnerable packages in the scanned lockfile.
- repos/RailsTraining/Level 3/store-api/Gemfile.lock: 17 vulnerable packages in the scanned lockfile.
- repos/RailsTraining/Level 3/store/Gemfile.lock: 19 vulnerable packages in the scanned lockfile.
- repos/RailsTraining/Level 4/admin-api-dry/Gemfile.lock: 17 vulnerable packages in the scanned lockfile.
- repos/RailsTraining/Level 5/admin-api-dry/Gemfile.lock: 23 vulnerable packages in the scanned lockfile.

This draft adds recurring Dependabot security updates and records the unresolved migration. No Ruby dependency or application code has been changed, and no successful application build is claimed.
