// ==============================================================================
// STANDARDIZED API RESPONSES
// ==============================================================================
// Enterprise Pattern: Consistent API Response Format
// ==============================================================================

const successResponse = (data, statusCode = 200) => {
    return {
        statusCode: statusCode,
        headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
            'Access-Control-Allow-Headers': 'Content-Type, Authorization',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            success: true,
            data: data,
            timestamp: new Date().toISOString()
        })
    };
};

const errorResponse = (message, statusCode = 500, details = null) => {
    return {
        statusCode: statusCode,
        headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
            'Access-Control-Allow-Headers': 'Content-Type, Authorization', 
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            success: false,
            error: {
                message: message,
                details: details,
                timestamp: new Date().toISOString()
            }
        })
    };
};

module.exports = {
    successResponse,
    errorResponse
};