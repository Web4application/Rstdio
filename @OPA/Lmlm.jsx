function modelSelfCheck(action) {
  const risk = simulateImpact(action);

  if (risk.privacy_violation || risk.data_leak) {
    return { allow: false, reason: "Privacy risk detected" };
  }

  return { allow: true };
}
