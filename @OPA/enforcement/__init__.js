async function enforceUFPC(input) {
  const res = await fetch("http://opa:8181/v1/data/ufpc/allow", {
    method: "POST",
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify({ input })
  });

  const result = await res.json();
  return result.result === true;
}

// Example: handling external file
app.post("/upload", async (req, res) => {
  const input = {
    source: req.headers["x-source"],
    user_approved: req.headers["x-user-ok"] === "true",
    risk_score: scanRisk(req.body),
    sandbox: true
  };

  const ok = await enforceUFPC(input);

  if (!ok) return res.status(403).send("Blocked by privacy guard");

  // send to sandbox instead of direct execution
  sandboxRun(req.body);

  res.send("Accepted safely");
});
