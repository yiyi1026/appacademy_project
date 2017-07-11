import {connect} from 'react-redux';
import {allTodos} from '../../reducers/selectors.js';
import {receiveTodo, receiveTodos, removeTodo} from '../../actions/todo_actions.js';

import TodoList from "./todo_list";

const mapStateToProps = (state)=>({
  todos: allTodos(state),
  state
});

const mapDispatchToProps = dispatch=>({
  receiveTodos: () => dispatch(receiveTodos()),
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
