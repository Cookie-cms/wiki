## User permissions lvl

User permissions are divided into multiple levels, each with specific capabilities:

|                 | 1 lvl | 2 lvl | 3 lvl | 4 lvl |
|-----------------|-------|-------|-------|-------|
| change username | +     | +     | +     | +     |
| Change skin     | +     | +     | +     | +     |
| Change skin HD  | -     | +     | +     | +     |
| Change mail     | +     | +     | +     | +     |
| Change Password | +     | +     | +     | +     |
| Use Discord     | +     | +     | +     | +     |
|                 |       |       |       |       |
| **Admin**       |       |       |       |       |
| Users list      | -     | -     | +     | +     |
| User            | -     | -     | +     | +     |
| Mail Spam       | -     | -     | +     | +     |
| Settings        | -     | -     | -     | +     |

Available permissions:
- page.userlist
- profile.changeusername
- profile.changeskin
- profile.changemail
- profile.changepassword
- profile.discord
- profile.changeskinHD
- admin.users
- admin.userskins
- admin.useredit
- admin.user
- admin.mailsend
- admin.capes
- admin.audit
- admin.settings

Discord roles <Badge type="warning" text="WIP" />
- discord.`idrole`

## Permission Inheritance

CookieCMS uses a hierarchical permission system with inheritance. **Higher levels inherit all permissions from lower levels.**

For example:
- Level 2 users have all Level 1 permissions PLUS their specific permissions
- Level 3 (admin) users have all Level 1 + Level 2 permissions PLUS admin permissions
- Level 5 (owner) has ALL permissions in the system

This inheritance structure allows for convenient permission management while maintaining a clear hierarchy.

## Configuration Example

```yml
permissions:
  '0':
    - page.userlist
  '1':
    - profile.changeusername
    - profile.changeskin
    - profile.changemail
    - profile.changepassword
    - profile.discord
  '2':
    - profile.changeskinHD
  '3':
    - admin.users
    - admin.userskins
    - admin.useredit
    - admin.user
    - admin.mailsend
    - admin.capes
    - admin.audit
    - discord.1346586587693187093
  '4':
    - admin.settings
  '5':
    - admin.owner