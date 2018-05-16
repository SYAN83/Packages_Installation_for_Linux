use admin

db.createUser(
  {
    user: "admin",
    pwd: "******",
    roles: ["userAdminAnyDatabase", "dbAdminAnyDatabase", "readWriteAnyDatabase"]
  }
)

db.createUser(
 {
   user: "jobs_user",
   pwd: "******",
   roles: [ { role: "readWrite", db: "jobs" }]
 }
)

db.createUser(
 {
   user: "jobs_user_readonly",
   pwd: "******",
   roles: [ { role: "read", db: "jobs" }]
 }
)
