---
next:
  text: 'Change log'
  link: '/dev/changelog'
---


# Change log

## Changelog - v2.0.0 (upcoming)

### Major Changes
  - added support for postgreSQL database
  - added support for argon2 password hashing
  - added full implementation of GravitLauncher authentication
  - Remade the entire home page
  - Settings page was removed, all settings were moved to the user profile
  ...
### Admin panel
  - User management
  - Audit
  - Skin manager
  - Update user
  - Update cape 


## Changelog - v1.0.0

### Authentication
- Implemented JWT-based authentication system
- Added user registration with email verification
- Added password reset functionality
- Integrated Discord OAuth2 authentication
- Added email verification system with confirmation codes
- Implemented secure password hashing using `bcrypt`

### User Management
- Added user profile management
- Implemented username change functionality with password verification
- Added password change capability
- Added email change functionality with verification
- Implemented Discord account linking/unlinking
- Added permission levels (1-3) for user access control

### Skin & Cape System
- Implemented skin upload and management system
- Added support for HD and slim skins
- Added cape management system
- Implemented GravitLauncher compatibility
- Added skin file validation and security checks
- Implemented user-specific skin libraries

### Database
- Implemented MySQL database with proper schema
- Added tables for users, skins, capes, and permissions
- Added support for database initialization and seeding
- Implemented connection pooling for better performance

### Security
- Implemented JWT blacklisting for logout
- Added input validation and sanitization
- Implemented file upload security measures
- Added permission-based access control
- Added rate limiting for sensitive operations

### API Features
- RESTful API design
- Standardized response format
- Added comprehensive error handling
- Implemented proper HTTP status codes
- Added route protection middleware

### Infrastructure
- Implemented Docker support
- Added database migration scripts
- Added development environment setup
- Added proper error logging and monitoring
