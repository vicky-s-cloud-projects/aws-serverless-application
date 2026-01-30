import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, PutCommand } from "@aws-sdk/lib-dynamodb";
import { randomUUID } from "crypto";

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
        "Access-Control-Allow-Headers": "Content-Type,Authorization",
        "Access-Control-Allow-Methods": "OPTIONS,GET,POST"
      },
      body: ""
    };
  }

  try {
    const body = JSON.parse(event.body || "{}");

    const { title, description, date, price } = body;

    if (!title) {
      return {
        statusCode: 400,
        headers: { "Access-Control-Allow-Origin": "*" },
        body: JSON.stringify({ message: "Title required" })
      };
    }

    const eventItem = {
        eventId: randomUUID(),
        title,
        description: description || "",
        date: date || "",
        price: price || 0,
        createdAt: new Date().toISOString()
    };

    await dynamodb.send(
      new PutCommand({
        TableName: "events",
        Item: eventItem
      })
    );

    return {
      statusCode: 201,
      headers: { "Access-Control-Allow-Origin": "*" },
      body: JSON.stringify(eventItem)
    };

  } catch (err) {
    console.error("Create event error:", err);

    return {
      statusCode: 500,
      headers: { "Access-Control-Allow-Origin": "*" },
      body: JSON.stringify({ message: "Internal Server Error" })
    };
  }
};
