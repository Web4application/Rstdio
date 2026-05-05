import { NextResponse } from "next/server";

export async function POST(req: Request) {
  const { files } = await req.json();

  const code = Object.values(files)
    .map((f: any) => f.code)
    .join("\n\n");

  const response = await fetch("https://api.openai.com/v1/chat/completions", {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${process.env.OPENAI_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      model: "gpt-5-mini",
      messages: [
        {
          role: "system",
          content:
            "You are a senior software engineer. Explain code clearly and briefly.",
        },
        {
          role: "user",
          content: `Explain this code:\n\n${code}`,
        },
      ],
    }),
  });

  const data = await response.json();

  return NextResponse.json({
    explanation: data.choices?.[0]?.message?.content || "No response",
  });
}
