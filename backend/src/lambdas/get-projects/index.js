const { successResponse, errorResponse } = require('../../shared/responses');

exports.handler = async (event) => {
  try {
    console.log('Get Projects Event:', JSON.stringify(event, null, 2));
    
    const mockProjects = [
      {
        projectId: '1',
        name: 'Enterprise AWS Serverless Platform',
        description: 'Complete serverless architecture with Terraform, Lambda, and React',
        technologies: ['AWS Lambda', 'Terraform', 'React', 'DynamoDB'],
        githubUrl: 'https://github.com/your-username/enterprise-aws-platform',
        liveUrl: null,
        status: 'In Progress'
      },
      {
        projectId: '2',
        name: 'Cloud Cost Optimization Dashboard',
        description: 'Real-time AWS cost monitoring and optimization recommendations',
        technologies: ['AWS Cost Explorer', 'Lambda', 'React', 'CloudWatch'],
        githubUrl: 'https://github.com/your-username/cost-dashboard',
        liveUrl: 'https://cost-dashboard.example.com',
        status: 'Completed'
      }
    ];
    
    return successResponse({
      message: 'Projects retrieved successfully',
      projects: mockProjects,
      count: mockProjects.length
    });
  } catch (error) {
    console.error('Error retrieving projects:', error);
    return errorResponse('Failed to retrieve projects');
  }
};
