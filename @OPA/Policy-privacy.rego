package ufpc

default allow = false

# Trust check
trusted {
  input.source == "signed"
} else {
  input.user_approved == true
}

# External content gate
allow {
  trusted
  input.risk_score < 5
  input.sandbox == true
}

# Block risky
deny[msg] {
  input.risk_score >= 5
  msg := "High risk content blocked"
}

# DLP check
deny[msg] {
  input.action == "egress"
  input.contains_sensitive == true
  not input.user_approved
  msg := "Sensitive data exfil blocked"
}
