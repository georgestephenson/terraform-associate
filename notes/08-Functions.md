# Terraform Functions notes

- Terraform has a wide variety of system-defined functions available.
- Terraform does not support user-defined functions.

Function examples:

- max() returns greatest number
- file() reads contents of file and returns contents as string
- lookup() takes a map var and a key value and returns the value found from the key in the map. Can also have a default value as a 3rd argument 
- length() returns length of list, map or string
- element() takes a list and an index and returns the element's value

Terraform Console is an interactive environment specifically for testing functions

## File function

- Can reduce code size of .tf file, for example AWS policies in JSON format. Instead of writing it inline in the .tf file with jsonencode(), you can reference a .json file.