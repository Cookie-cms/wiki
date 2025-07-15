# TemplateEngine PHP Documentation

A lightweight PHP template engine for separating HTML templates and PHP logic.

[Original source](https://github.com/Cookie-cms/engine/tree/main/TemplateEngine)<br>
[TemplateEngine code](https://github.com/Cookie-cms/engine/blob/main/TemplateEngine/TemplateEngine.php)
## Introduction

TemplateEngine is a minimalist PHP template engine that provides a clean separation between HTML templates and PHP business logic. It offers essential features like variable substitution, conditional statements, and file inclusion while maintaining simplicity and ease of use.

## Installation

Include the TemplateEngine file in your project:

```php
require_once 'TemplateEngine.php';
```

## Basic Usage

### Initialization

Create a new instance of the template engine:

```php
$templateEngine = new TemplateEngine();
```

### Variable Assignment

Variables can be assigned for use within templates:

```php
$templateEngine->assign('username', 'John Doe');
$templateEngine->assign('isLoggedIn', true);
```

For header variables that will be available across included files:

```php
$templateEngine->assignHeader('pageTitle', 'Welcome Page');
$templateEngine->assignHeader('metaDescription', 'Welcome to our site');
```

### Template Syntax

#### Variable Output
Display variables using double curly braces:
```html
<h1>Welcome, {{ username }}</h1>
<p>Status: {{ status }}</p>
```

#### Conditional Statements
Use if/else blocks for conditional rendering:
```html
{{ if isLoggedIn }}
    <nav>
        <a href="/dashboard">Dashboard</a>
        <a href="/logout">Logout</a>
    </nav>
{{ else }}
    <nav>
        <a href="/login">Login</a>
        <a href="/register">Register</a>
    </nav>
{{ endif }}
```

#### File Inclusion
Include other template files using the include directive:
```html
<!DOCTYPE html>
<html>
<head>
    {{ include 'partials/head.php' }}
</head>
<body>
    {{ include 'partials/header.php' }}
    {{ include 'partials/content.php' }}
    {{ include 'partials/footer.php' }}
</body>
</html>
```

### Rendering Templates

To render a template file and get the processed output:

```php
// Render a specific template file
$output = $templateEngine->render('templates/page.php');
echo $output;
```

## Best Practices

1. Template Organization
   - Keep templates in a dedicated directory (e.g., `templates/`)
   - Use subdirectories for different template types (e.g., `templates/partials/`, `templates/layouts/`)
   - Follow a consistent naming convention for template files

2. Security Considerations
   - Variables are automatically escaped to prevent XSS attacks
   - Use proper file permissions for template directories
   - Validate all input before passing it to templates

3. Performance Tips
   - Consider implementing template caching for production
   - Minimize the number of included files
   - Keep template logic simple and move complex operations to PHP classes

## Limitations

- No built-in caching mechanism
- Limited to basic conditional statements
- No loop constructs (by design, for simplicity)
- No template inheritance system

## Example Implementation

Here's a complete example showing how to use the template engine:

```php
// Initialize the engine
$templateEngine = new TemplateEngine();

// Assign variables
$templateEngine->assign('username', 'John Doe');
$templateEngine->assign('isLoggedIn', true);
$templateEngine->assignHeader('pageTitle', 'Dashboard');

// Create a template file (dashboard.php)
/*
<!DOCTYPE html>
<html>
<head>
    {{ include 'header.php' }}
</head>
<body>
    {{ if isLoggedIn }}
        <h1>Welcome, {{ username }}</h1>
        <div class="dashboard-content">
            {{ include 'dashboard-widgets.php' }}
        </div>
    {{ else }}
        <h1>Please log in</h1>
    {{ endif }}
</body>
</html>
*/

// Render the template
$output = $templateEngine->render('templates/dashboard.php');
echo $output;
```

## License

This project is licensed under the Apache 2 License. See the LICENSE file for details.