export const allTodos = ({todos}) => (
  Object.keys(todos).map((todoID) => todos[todoID])
);
