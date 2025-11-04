import React, { useState, useEffect } from 'react';
import { getProjects } from '../../services/api';
import './Portfolio.css';

const ProjectGrid = () => {
  const [projects, setProjects] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProjects = async () => {
      try {
        setLoading(true);
        const response = await getProjects();
        setProjects(response.projects || []);
      } catch (err) {
        setError('Failed to load projects');
        console.error('Error fetching projects:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchProjects();
  }, []);

  if (loading) {
    return (
      <div className="portfolio-container">
        <div className="loading">Loading projects...</div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="portfolio-container">
        <div className="error">{error}</div>
      </div>
    );
  }

  return (
    <div className="portfolio-container">
      <h2>My Projects</h2>
      <div className="projects-grid">
        {projects.map((project) => (
          <div key={project.projectId} className="project-card">
            <div className="project-header">
              <h3>{project.name}</h3>
              <span className={`status ${project.status.toLowerCase()}`}>
                {project.status}
              </span>
            </div>
            <p className="project-description">{project.description}</p>
            <div className="technologies">
              {project.technologies.map((tech, index) => (
                <span key={index} className="tech-tag">
                  {tech}
                </span>
              ))}
            </div>
            <div className="project-links">
              {project.githubUrl && (
                <a 
                  href={project.githubUrl} 
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="link github"
                >
                  GitHub
                </a>
              )}
              {project.liveUrl && (
                <a 
                  href={project.liveUrl} 
                  target="_blank" 
                  rel="noopener noreferrer"
                  className="link live"
                >
                  Live Demo
                </a>
              )}
            </div>
          </div>
        ))}
      </div>
      {projects.length === 0 && (
        <div className="no-projects">
          <p>No projects available yet. Check back soon!</p>
        </div>
      )}
    </div>
  );
};

export default ProjectGrid;
