import React, { useState, useEffect } from 'react';
import './styles/App.css';
import PostList from './components/Blog/PostList';
import ProjectGrid from './components/Portfolio/ProjectGrid';

function App() {
  const [activeTab, setActiveTab] = useState('blog');
  const [loading, setLoading] = useState(false);

  return (
    <div className="App">
      <header className="app-header">
        <h1>Enterprise AWS Serverless Platform</h1>
        <nav className="app-nav">
          <button 
            className={activeTab === 'blog' ? 'active' : ''}
            onClick={() => setActiveTab('blog')}
          >
            Blog
          </button>
          <button 
            className={activeTab === 'portfolio' ? 'active' : ''}
            onClick={() => setActiveTab('portfolio')}
          >
            Portfolio
          </button>
        </nav>
      </header>

      <main className="app-main">
        {loading ? (
          <div className="loading">Loading...</div>
        ) : (
          <>
            {activeTab === 'blog' && <PostList />}
            {activeTab === 'portfolio' && <ProjectGrid />}
          </>
        )}
      </main>

      <footer className="app-footer">
        <p>Built with AWS Serverless Architecture & React</p>
      </footer>
    </div>
  );
}

export default App;
