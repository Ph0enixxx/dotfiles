function func_src_path {
  echo $functions_source[$1]
}

function func_src_code {
  bat $functions_source[$1]
}

function comp_func {
  echo $_comps[$1]
}

function comp_func_src_path {
  local func=$_comps[$1]
  # echo $func
  echo $functions_source[$func]
}
