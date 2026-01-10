terraform { 
  cloud { 
    
    organization = "gste" 

    workspaces { 
      name = "cli-driven-workflow" 
    } 
  } 
}

resource "time_sleep" "wait_10_seconds" {
  create_duration = "10s"
}