import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, PutCommand } from "@aws-sdk/lib-dynamodb";
import bcrypt from "bcryptjs";

const client = new DynamoDBClient({});
const dynamodb = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {

  const method =
  event.requestContext?.http?.method ||
  event.requestContext?.httpMethod;
    
    // CORS preflight
    if (method === "OPTIONS") {
        return {
            statusCode: 200,
            headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Headers": "Content-Type",
            "Access-Control-Allow-Methods": "OPTIONS,GET,POST"
            },
            body: ""
        };
    }

  try {
    const body = JSON.parse(event.body || "{}");
    const { email, password } = body;

    if (!email || !password) {
      return {
        statusCode: 400,
        headers: { "Access-Control-Allow-Origin": "*" },
        body: JSON.stringify({ message: "Missing email or password" })
      };
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    await dynamodb.send(
      new PutCommand({
        TableName: "users",
        Item: { email, password: hashedPassword }
      })
    );

    return {
      statusCode: 201,
      headers: { "Access-Control-Allow-Origin": "*" },
      body: JSON.stringify({ message: "Signup successful" })
    };

  } catch (err) {
    console.error(err);

    return {
      statusCode: 500,
      headers: { "Access-Control-Allow-Origin": "*" },
      body: JSON.stringify({ message: "Internal Server Error" })
    };
  }
};
