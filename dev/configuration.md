# configuration

```yml
NameSite: cookiecms
securecode: "generated string for 64symbols"
ServiceApiToken: generated string for 64symbols
MaxSavedSkins: 1
domain: "http://localhost:3000"
demo: false
logLevel: ["info","warn","error"]

# Duplicating audit from site to discord 
AuditSecret: 
  enabled: true
  url: ""

database:
  host: "localhost"
  username: "cookiecms"
  pass: "cookiecms"
  db: "cookiecms"
  port: 34002

smtp:
  Host: ""
  Username: ""
  Password: ""
  SMTPSecure: true
  Port: 465


discord:
  enabled: true
  client_id: ""
  secret_id: ""
  scopes:
    - identify
    - email
  redirect_url: "http://localhost:3000/callback"
  bot: ""
  guild_id: 0
  role: 0


features:
  blogs: true
  theards: true
  shop: true

permissions:
  0:
    - page.userlist
  1:
    - profile.changeusername
    - profile.changeskin
    - profile.changemail
    - profile.changepassword
    - profile.discord
  2:
    - profile.changeskinHD
  3:
    - admin.users
    - admin.userskins
    - admin.useredit
    - admin.user
    - admin.mailsend
    - admin.capes
    - admin.audit
  4:
    - admin.settings


servers:
  name:
    name:
    ip:
    port:
```