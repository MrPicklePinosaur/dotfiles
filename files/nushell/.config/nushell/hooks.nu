let-env hooks = {
  pre_prompt: [{
    null  # replace with source code to run before the prompt is shown
  }]
  pre_execution: [{
    null  # replace with source code to run before the repl input is run
  }]
  env_change: {
    PWD: [{|before, after|
      null  # replace with source code to run if the PWD environment is different since the last repl input
    }]
  }
  display_output: {
    if (term size).columns >= 100 { table -e } else { table }
  }
}
