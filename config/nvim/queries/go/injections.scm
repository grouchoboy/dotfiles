;; extends

;; Auto-inject SQL into standard database function calls
(call_expression
  function: (selector_expression
    field: (field_identifier) @_field (#match? @_field "^(Query|QueryRow|Exec)$"))
  arguments: (argument_list
    (raw_string_literal) @injection.content
    (#set! injection.language "sql")))

;; Auto-inject SQL into variables named with "query" or "sql"
(short_var_declaration
  left: (expression_list
    (identifier) @_var_name (#match? @_var_name "(?i)(query|sql)"))
  right: (expression_list
    (raw_string_literal) @injection.content
    (#set! injection.language "sql")))
