// ==============================================================================
// LAMBDA FUNCTION - CREATE BLOG POST
// ==============================================================================
// Enterprise Pattern: Admin Blog Post Creation
// ==============================================================================

const { successResponse, errorResponse } = require('../../shared/responses');
const { putItem } = require('../../shared/dynamodb-client');

exports.handler = async (event) => {
  try {
    console.log('Create Post Event:', JSON.stringify(event, null, 2));
    
    // For now, return mock success response
    // Later will integrate with DynamoDB putItem
    const mockResponse = {
      message: 'Blog post created successfully',
      postId: 'mock-' + Date.now(),
      timestamp: new Date().toISOString()
    };
    
    return successResponse(mockResponse, 201);
  } catch (error) {
    console.error('Error creating post:', error);
    return errorResponse('Failed to create blog post');
  }
};