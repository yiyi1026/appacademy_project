export const fetchTodos = () => (
  $.ajax({
    method: 'GET',
    url: '/api/todos'
  })
);  //invoke before calling then

export const createTodo = (todo) => (
  $.ajax({
    method: 'POST',
    url: '/api/todos',
    dataType: "JSON",
    data: { todo }
  })
);
