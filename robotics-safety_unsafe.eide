#! VULNERABLE robotics-safety — feeds the untrusted input straight to the tool, no extraction.
#! check -> UNSAFE: tainted data cannot reach a capability.
grant gateMotion confidence 70

let raw = fetch<web>
privileged { gateMotion(raw) }  # tainted -> tool: REJECTED
