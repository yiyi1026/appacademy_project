export const RECEIVE_TODO = "RECEIVE_TODO";
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodo = todo =>({
  type: RECEIVE_TODO,
  todo: todo
});

export const receiveTodos = todos =>({
  type: RECEIVE_TODOS,
  todos
});

export const removeTodo = todo =>({
  type: REMOVE_TODO,
  todo
});
