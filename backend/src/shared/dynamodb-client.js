const AWS = require('aws-sdk');

// Use local DynamoDB for development, AWS for production
const isLocal = process.env.IS_LOCAL || process.env.AWS_SAM_LOCAL;
const dynamoDb = isLocal 
  ? new AWS.DynamoDB.DocumentClient({
      endpoint: 'http://localhost:8000',
      region: 'localhost'
    })
  : new AWS.DynamoDB.DocumentClient();

const scanTable = async (tableName) => {
  const params = {
    TableName: tableName
  };

  try {
    const result = await dynamoDb.scan(params).promise();
    return result.Items;
  } catch (error) {
    console.error(`Error scanning table ${tableName}:`, error);
    throw error;
  }
};

const getItem = async (tableName, key) => {
  const params = {
    TableName: tableName,
    Key: key
  };

  try {
    const result = await dynamoDb.get(params).promise();
    return result.Item;
  } catch (error) {
    console.error(`Error getting item from ${tableName}:`, error);
    throw error;
  }
};

module.exports = { scanTable, getItem };
