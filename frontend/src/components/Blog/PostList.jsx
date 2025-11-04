import React, { useState, useEffect } from 'react';
import { getPosts } from '../../services/api';
import './Blog.css';

const PostList = () => {
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchPosts = async () => {
      try {
        setLoading(true);
        const response = await getPosts();
        setPosts(response.posts || []);
      } catch (err) {
        setError('Failed to load posts');
        console.error('Error fetching posts:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchPosts();
  }, []);

  if (loading) {
    return (
      <div className="blog-container">
        <div className="loading">Loading posts...</div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="blog-container">
        <div className="error">{error}</div>
      </div>
    );
  }

  return (
    <div className="blog-container">
      <h2>Latest Blog Posts</h2>
      <div className="posts-grid">
        {posts.map((post) => (
          <article key={post.postId} className="post-card">
            <h3>{post.title}</h3>
            <p className="post-content">{post.content}</p>
            <div className="post-meta">
              <span className="author">By {post.author}</span>
              <span className="date">
                {new Date(post.createdAt).toLocaleDateString()}
              </span>
            </div>
          </article>
        ))}
      </div>
      {posts.length === 0 && (
        <div className="no-posts">
          <p>No posts available yet. Check back soon!</p>
        </div>
      )}
    </div>
  );
};

export default PostList;
