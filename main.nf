#!/usr/bin/env nextflow 
params.timeout = 10 
params.exit = 0
params.cmd = "echo 'Hello (timeout $params.timeout)' World"
params.times = 1 

process foo {
  machineType 'bar'
  maxForks 1 
  input: val(x)
  /
  bash -c "$params.cmd"
  sleep $params.timeout
  exit $params.exit
  /
}

workflow {
  channel.of(1..params.times) | foo
}
