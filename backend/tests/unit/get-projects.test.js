const { handler } = require('../../src/lambdas/get-projects');

describe('Get Projects Lambda', () => {
  test('should return mock projects successfully', async () => {
    const event = {
      httpMethod: 'GET',
      path: '/projects'
    };

    const response = await handler(event);

    expect(response.statusCode).toBe(200);
    
    const body = JSON.parse(response.body);
    expect(body.message).toBe('Projects retrieved successfully');
    expect(body.projects).toHaveLength(2);
    expect(body.projects[0].name).toContain('Enterprise AWS');
    expect(body.projects[1].name).toContain('Cloud Cost');
  });

  test('should include technology stacks', async () => {
    const event = {
      httpMethod: 'GET',
      path: '/projects'
    };

    const response = await handler(event);
    const body = JSON.parse(response.body);

    expect(body.projects[0].technologies).toContain('Terraform');
    expect(body.projects[1].technologies).toContain('CloudWatch');
  });

  test('should have CORS headers', async () => {
    const event = {
      httpMethod: 'GET',
      path: '/projects'
    };

    const response = await handler(event);

    expect(response.headers['Access-Control-Allow-Origin']).toBe('*');
    expect(response.headers['Access-Control-Allow-Methods']).toContain('GET');
  });
});
