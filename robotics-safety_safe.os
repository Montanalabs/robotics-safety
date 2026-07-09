#! Robotics safety gate — untrusted a motion command can only ever become one of a fixed set of decisions over a
#! closed type, never a tool argument. An injected instruction cannot be represented in the
#! closed type, so it is rejected at the trust boundary (and re-clamped at run time by extract).
#! @requires gateMotion — the robotics safety gate sink
#! @effect io
#! @confidence 70
#! @taint bridge — extract<Decision> turns the tainted input into a trusted decision
grant gateMotion confidence 70

type MotionZone = SafeZ | SlowZ | Restricted
type Decision = GateMotion(MotionZone) | Estop

let raw = fetch<web>  # UNTRUSTED a motion command — tainted
quarantined { let d = extract<Decision>(raw) confidence 70 }  # only a fixed Decision (payloads too) crosses
privileged { gateMotion(d) }  # act on the trusted decision only
