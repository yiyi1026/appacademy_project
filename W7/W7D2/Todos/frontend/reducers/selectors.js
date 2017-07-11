export const allTodos = (state) => (
  Object.keys(state.todos).map((todoID) => state.todos[todoID])
);
