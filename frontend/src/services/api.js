// API Service for communicating with backend Lambdas
const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:3001';

// Generic fetch helper
async function fetchAPI(endpoint, options = {}) {
  const url = `${API_BASE_URL}${endpoint}`;
  
  try {
    const response = await fetch(url, {
      headers: {
        'Content-Type': 'application/json',
        ...options.headers,
      },
      ...options,
    });

    if (!response.ok) {
      throw new Error(`API Error: ${response.status} ${response.statusText}`);
    }

    return await response.json();
  } catch (error) {
    console.error(`API call failed for ${endpoint}:`, error);
    throw error;
  }
}

// Blog API calls
export const getPosts = async () => {
  // For local development, return mock data that matches our Lambda response
  if (!process.env.REACT_APP_API_URL) {
    console.log('Using mock data for posts');
    return {
      message: 'Posts retrieved successfully',
      posts: [
        {
          postId: '1',
          title: 'Welcome to our Serverless Blog',
          content: 'This is our first post demonstrating AWS Serverless architecture with Terraform, Lambda, and React frontend.',
          createdAt: new Date().toISOString(),
          author: 'Admin'
        },
        {
          postId: '2', 
          title: 'AWS Lambda Best Practices',
          content: 'Learn how to build efficient Lambda functions for production environments with proper error handling and monitoring.',
          createdAt: new Date().toISOString(),
          author: 'Admin'
        }
      ],
      count: 2
    };
  }
  
  return await fetchAPI('/posts');
};

// Portfolio API calls
export const getProjects = async () => {
  // For local development, return mock data that matches our Lambda response
  if (!process.env.REACT_APP_API_URL) {
    console.log('Using mock data for projects');
    return {
      message: 'Projects retrieved successfully',
      projects: [
        {
          projectId: '1',
          name: 'Enterprise AWS Serverless Platform',
          description: 'Complete serverless architecture with Terraform, Lambda, and React demonstrating cloud engineering best practices.',
          technologies: ['AWS Lambda', 'Terraform', 'React', 'DynamoDB', 'API Gateway'],
          githubUrl: 'https://github.com/your-username/enterprise-aws-platform',
          liveUrl: null,
          status: 'In Progress'
        },
        {
          projectId: '2',
          name: 'Cloud Cost Optimization Dashboard',
          description: 'Real-time AWS cost monitoring and optimization recommendations with automated reporting.',
          technologies: ['AWS Cost Explorer', 'Lambda', 'React', 'CloudWatch', 'S3'],
          githubUrl: 'https://github.com/your-username/cost-dashboard',
          liveUrl: 'https://cost-dashboard.example.com',
          status: 'Completed'
        }
      ],
      count: 2
    };
  }
  
  return await fetchAPI('/projects');
};

// Export for testing and other modules
export default {
  getPosts,
  getProjects
};
