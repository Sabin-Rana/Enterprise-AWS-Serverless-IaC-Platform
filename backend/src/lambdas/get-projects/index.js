// ==============================================================================
// LAMBDA FUNCTION - GET PORTFOLIO PROJECTS
// ==============================================================================
// Enterprise Pattern: Portfolio Data API Endpoint
// ==============================================================================

const { successResponse, errorResponse } = require('../../shared/responses');

exports.handler = async (event) => {
  try {
    console.log('Get Projects Event:', JSON.stringify(event, null, 2));
    
    // Mock portfolio projects data
    const mockProjects = [
      {
        projectId: '1',
        name: 'Enterprise AWS Serverless Platform',
        description: 'Full-stack serverless application with Terraform IaC',
        technologies: ['AWS', 'Terraform', 'React', 'Node.js'],
        status: 'In Progress',
        githubUrl: 'https://github.com/yourusername/aws-serverless-platform'
      },
      {
        projectId: '2',
        name: 'Cloud Migration Strategy',
        description: 'Enterprise cloud migration from on-prem to AWS',
        technologies: ['AWS', 'Docker', 'Kubernetes', 'CI/CD'],
        status: 'Completed',
        githubUrl: 'https://github.com/yourusername/cloud-migration'
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