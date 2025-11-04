// ==============================================================================
// DYNAMODB CLIENT - DATABASE OPERATIONS
// ==============================================================================
// Enterprise Pattern: Centralized Database Operations
// ==============================================================================

const AWS = require('aws-sdk');

// Initialize DynamoDB client
const dynamoDB = new AWS.DynamoDB.DocumentClient();

// Scan table with optional parameters
const scanTable = async (tableName, limit = 10) => {
    const params = {
        TableName: tableName,
        Limit: limit
    };
    
    try {
        const result = await dynamoDB.scan(params).promise();
        return result.Items;
    } catch (error) {
        console.error(`Error scanning table ${tableName}:`, error);
        throw error;
    }
};

// Get item by primary key
const getItem = async (tableName, key) => {
    const params = {
        TableName: tableName,
        Key: key
    };
    
    try {
        const result = await dynamoDB.get(params).promise();
        return result.Item;
    } catch (error) {
        console.error(`Error getting item from ${tableName}:`, error);
        throw error;
    }
};

// Put item into table
const putItem = async (tableName, item) => {
    const params = {
        TableName: tableName,
        Item: item
    };
    
    try {
        await dynamoDB.put(params).promise();
        return item;
    } catch (error) {
        console.error(`Error putting item into ${tableName}:`, error);
        throw error;
    }
};

module.exports = {
    dynamoDB,
    scanTable,
    getItem,
    putItem
};