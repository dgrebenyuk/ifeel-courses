def sum_lines
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse in efficitur magna. ' +
  'Nulla gravida faucibus fringilla. Curabitur eu justo ipsum. Proin aliquet pharetra velit, ac finibus diam auctor vitae.'
end

def concat_lines
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse in efficitur magna. '.concat(
    'Nulla gravida faucibus fringilla. Curabitur eu justo ipsum. Proin aliquet pharetra velit, ac finibus diam auctor vitae.'
  )
end

def implicit_concat
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse in efficitur magna. ' \
  'Nulla gravida faucibus fringilla. Curabitur eu justo ipsum. Proin aliquet pharetra velit, ac finibus diam auctor vitae.'
end

def sql_impl
  'select d.id, d.name, COUNT(e.id) as employee_count ' \
  'FROM Department d ' \
  'LEFT JOIN Employee e ON d.id = e.department_id ' \
  'GROUP BY d.id'
end

def sql_here
  <<-SQL
    select d.id, d.name, COUNT(e.id) as employee_count
    FROM Department d
    LEFT JOIN Employee e ON d.id = e.department_id
    GROUP BY d.id
  SQL
end

def sql_here_trim
  <<~SQL
    select d.id, d.name, COUNT(e.id) as employee_count
    FROM Department d
    LEFT JOIN Employee e ON d.id = e.department_id
    GROUP BY d.id
  SQL
end

def sql_here_1
  <<SQL
    select d.id, d.name, COUNT(e.id) as employee_count
    FROM Department d
    LEFT JOIN Employee e ON d.id = e.department_id
    GROUP BY d.id
SQL
end

def sql_as_param
  print_query(<<~SQL, true)
    select d.id, d.name, COUNT(e.id) as employee_count
    FROM Department d
    LEFT JOIN Employee e ON d.id = e.department_id
    GROUP BY d.id
  SQL
end

def print_query(query, flag)
  puts query if flag
end
