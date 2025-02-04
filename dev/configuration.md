# configuration

```yml
NameSite: cookiecms
securecode: "generated string for 64symbols"
ServiceApiToken: "generated string for 64symbols"
MaxSavedSkins: 1
debugToken: 64c82dcb-c29d-4ff8-b6e6-b796a2672a1 # removed in new version

# testing
AuditSecret: 
  enabled: false
  url: ""
  spamming: "thread_id"
  audit: "thread_id" # main information change password change mail etc


database:
  host: "localhost"
  username: "cookiecms"
  pass: "cookiecms"
  db: "cookiecms"
  port: 34002

# not implemented
smtp:
  host: "mail_host"
  SMTPAuth: true
  Username: "mail"
  Password: "pass"
  SMTPSecure: ""
  Port: 587

discord:
  enabled: true
  client_id: "client_id"
  secret_id: "secret_id"
  scopes:
    - identify
    - email
  redirect_url: "http://localhost:3000/callback"
  bot: ""
  guild_id: 0
  role: 0

# not implemented
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
    - admin.userslist
    - admin.useredit
    - admin.mailsend


# not implemented
servers:
  name:
    name:
    ip:
    port:

```