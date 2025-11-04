// ==============================================================================
// LAMBDA FUNCTION - GET BLOG POSTS
// ==============================================================================
// Enterprise Pattern: API Gateway Lambda Proxy Integration
// ==============================================================================

const { successResponse, errorResponse } = require('../../shared/responses');

exports.handler = async (event) => {
  try {
    console.log('Get Posts Event:', JSON.stringify(event, null, 2));
    
    // For now, return mock data - we'll connect to DynamoDB later
    const mockPosts = [
      {
        postId: '1',
        title: 'Welcome to our Serverless Blog',
        content: 'This is our first post demonstrating AWS Serverless architecture.',
        createdAt: new Date().toISOString(),
        author: 'Admin'
      },
      {
        postId: '2', 
        title: 'AWS Lambda Best Practices',
        content: 'Learn how to build efficient Lambda functions for production.',
        createdAt: new Date().toISOString(),
        author: 'Admin'
      }
    ];
    
    return successResponse({
      message: 'Posts retrieved successfully',
      posts: mockPosts,
      count: mockPosts.length
    });
  } catch (error) {
    console.error('Error retrieving posts:', error);
    return errorResponse('Failed to retrieve posts');
  }
};