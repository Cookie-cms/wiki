require('dotenv').config();
const express = require('express');
const path = require('path');
const passport = require('passport');
const GitHubStrategy = require('passport-github2').Strategy;
const session = require('express-session');
const axios = require('axios');

const app = express();

const protectedRoutes = [
  '/license',
  '/hosting',
  '/protected'
];

app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false
}));

app.use(passport.initialize());
app.use(passport.session());

passport.use(new GitHubStrategy({
  clientID: process.env.GITHUB_CLIENT_ID,
  clientSecret: process.env.GITHUB_CLIENT_SECRET,
  callbackURL: "https://wikicms.coffeedev.dev/auth/github/callback"
  },
  async (accessToken, refreshToken, profile, done) => {
  try {
    const orgs = await axios.get('https://api.github.com/user/orgs', {
    headers: {
      'Authorization': `token ${accessToken}`
    }
    });

    const isMember = orgs.data.some(org => org.login === process.env.GITHUB_ORG);
    if (isMember) {
    return done(null, profile);
    } else {
    return done(null, false, { message: 'Not a member of the required organization' });
    }
  } catch (error) {
    return done(error);
  }
  }
));

passport.serializeUser((user, done) => done(null, user));
passport.deserializeUser((user, done) => done(null, user));

// Auth middleware
const isAuthenticated = (req, res, next) => {
  if (req.isAuthenticated()) return next();
  res.redirect('/login');
};

app.get('/login',
  passport.authenticate('github')
);

app.get('/auth/github/callback',
  passport.authenticate('github', { failureRedirect: '/login' }),
  (req, res) => res.redirect('/')
);

app.get('/logout', (req, res) => {
  req.logout(() => {
  res.redirect('/');
  });
});

// Protect specified routes
protectedRoutes.forEach(route => {
  app.get(route, isAuthenticated);
});

// Serve static files from the Vitepress build directory
const vitepressBuildDir = path.join(__dirname, '.vitepress/dist');
app.use(express.static(vitepressBuildDir));

// Default route
app.get('*', (req, res) => {
  res.sendFile(path.join(vitepressBuildDir, 'index.html'));
});

const port = 3000;
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});