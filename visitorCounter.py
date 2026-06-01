# This code defines an AWS Lambda function that serves as a visitor counter for a resume website. It uses AWS DynamoDB to store and update the visitor count. Each time the function is invoked, it increments the visitor count in the DynamoDB table and returns the updated count in the response. The response is formatted as JSON and includes CORS headers to allow cross-origin requests.

import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('visitor-counter')

def lambda_handler(event, context):

    response = table.update_item(
        Key={'id': 'resume'},
        UpdateExpression="ADD visitorCount :inc",
        ExpressionAttributeValues={
            ':inc': 1
        },
        ReturnValues="UPDATED_NEW"
    )

    visitor_count = response['Attributes']['visitorCount']

    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        'body': json.dumps({
            'visitorCount': int(visitor_count)
        })
    }
