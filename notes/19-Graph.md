# Terraform Graph notes

- Visual representation of dependencies between resources in Terraform config.
- `terraform graph` command.
- Uses DOT language, originating from Graphviz.
- Can pipe the command to the `dot` program to generate an image of the graph.

``` bash
terraform graph | dot -Tsvg > graph.svg
```