use admin

db.createUser(
  {
    user: "admin",
    pwd: "FreshStart2018!",
    roles: ["userAdminAnyDatabase", "dbAdminAnyDatabase", "readWriteAnyDatabase"]
  }
)

use jobs

db.createUser(
 {
   user: "jobs_user",
   pwd: "jobFreshStart",
   roles: [ { role: "readWrite", db: "jobs" }]
 }
)

db.createUser(
 {
   user: "jobs_user_readonly",
   pwd: "jobPortalRead",
   roles: [ { role: "read", db: "jobs" }]
 }
)

