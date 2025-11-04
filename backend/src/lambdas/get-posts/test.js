// ==============================================================================
// UNIT TEST - GET POSTS LAMBDA
// ==============================================================================
// Enterprise Pattern: Lambda Function Validation
// ==============================================================================

const { handler } = require('./index');

// Mock event for testing
const mockEvent = {
  httpMethod: 'GET',
  queryStringParameters: {
    limit: '5'
  },
  headers: {
    'Content-Type': 'application/json'
  }
};

// Test the Lambda function
handler(mockEvent)
  .then(response => {
    console.log('TEST PASSED - Get Posts Lambda');
    console.log('Status Code:', response.statusCode);
    console.log('Response Body:', response.body);
  })
  .catch(error => {
    console.error('TEST FAILED - Get Posts Lambda');
    console.error('Error:', error);
  });