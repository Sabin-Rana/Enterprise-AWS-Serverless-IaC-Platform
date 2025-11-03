const { handler } = require('../../src/lambdas/get-posts');

describe('Get Posts Lambda', () => {
  test('should return mock posts successfully', async () => {
    const event = {
      httpMethod: 'GET',
      path: '/posts'
    };

    const response = await handler(event);

    expect(response.statusCode).toBe(200);
    
    const body = JSON.parse(response.body);
    expect(body.message).toBe('Posts retrieved successfully');
    expect(body.posts).toHaveLength(2);
    expect(body.posts[0].title).toContain('Welcome');
    expect(body.posts[1].title).toContain('AWS Lambda');
  });

  test('should have CORS headers', async () => {
    const event = {
      httpMethod: 'GET',
      path: '/posts'
    };

    const response = await handler(event);

    expect(response.headers['Access-Control-Allow-Origin']).toBe('*');
    expect(response.headers['Access-Control-Allow-Methods']).toContain('GET');
  });
});
