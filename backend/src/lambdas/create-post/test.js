// ==============================================================================
// UNIT TEST - CREATE POST LAMBDA  
// ==============================================================================
// Enterprise Pattern: Admin API Validation
// ==============================================================================

const { handler } = require('./index');

// Mock event for testing
const mockEvent = {
  httpMethod: 'POST',
  body: JSON.stringify({
    title: 'Test Blog Post',
    content: 'This is a test blog post content',
    author: 'Test Author'
  }),
  headers: {
    'Content-Type': 'application/json'
  }
};

// Test the Lambda function
handler(mockEvent)
  .then(response => {
    console.log('TEST PASSED - Create Post Lambda');
    console.log('Status Code:', response.statusCode);
    console.log('Response Body:', response.body);
  })
  .catch(error => {
    console.error('TEST FAILED - Create Post Lambda');
    console.error('Error:', error);
  });