# Load Order notes

- Terraform loads all .tf and .tf.json files within a directory
- It expects configuration objects to be distinct across files, otherwise returns error
- Loads all files in alphabetical order. 
- Doesn't load subdirectories.