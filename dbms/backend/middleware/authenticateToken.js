const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
  // Get the Authorization header (Bearer token)
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1]; // Extract the token from the 'Bearer <token>' format

  if (!token) {
    return res.status(401).json({ error: 'Access denied. No token provided.' });  // If no token is found
  }

  // Verify the token
  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) {
      return res.status(403).json({ error: 'Invalid or expired token.' });  // If the token is invalid or expired
    }

    // Token is valid, attach the user data (decoded from JWT) to the request object
    req.user = user;
    next();  // Proceed to the next middleware/route handler
  });
};

module.exports = authenticateToken;
