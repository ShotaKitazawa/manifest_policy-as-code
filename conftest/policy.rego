package main

# check readinessProbe
warn[msg] {
  input.kind = "Rollout"
  container := input.spec.template.spec.containers[_]
  not container.readinessProbe
  msg = sprintf("%v: readinessProbe is not defined", [container.name])
}

# check livenessProbe
warn[msg] {
  input.kind = "Rollout"
  container := input.spec.template.spec.containers[_]
  not container.livenessProbe
  msg = sprintf("%v: livenessProbe is not defined", [container.name])
}

# check CPU Resource Requests
deny[msg] {
  input.kind = "Rollout"
  container := input.spec.template.spec.containers[_]
  not container.resources.requests.cpu
  msg = sprintf("%v: CPU Resource requests is not defined", [container.name])
}
# check Memory Resource Requests
deny[msg] {
  input.kind = "Rollout"
  container := input.spec.template.spec.containers[_]
  not container.resources.requests.memory
  msg = sprintf("%v: Memory Resource requests is not defined", [container.name])
}
# check CPU Resource Limits
deny[msg] {
  input.kind = "Rollout"
  container := input.spec.template.spec.containers[_]
  not container.resources.limits.cpu
  msg = sprintf("%v: CPU Resource limits is not defined", [container.name])
}
# check Memory Resource Limits
deny[msg] {
  input.kind = "Rollout"
  container := input.spec.template.spec.containers[_]
  not container.resources.limits.memory
  msg = sprintf("%v: memory Resource limits is not defined", [container.name])
}
# check Memory Resource Limits >= 0
deny[msg] {
  input.kind = "Rollout"
  container := input.spec.template.spec.containers[_]
  container.resources.limits.memory
  container.resources.limits.memory < 0
  msg = sprintf("%v: Resource requests < 0", [container.name])
}
