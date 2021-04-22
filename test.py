def fibonacci(n):
  if n < 0:
    raise ValueError

  if n == 0:
    return 0
  if n <= 2:
    return 1

  return fibonacci(n - 1) + fibonacci(n - 2)