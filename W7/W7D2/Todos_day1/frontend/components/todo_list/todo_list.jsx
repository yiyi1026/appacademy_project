import React from 'react';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';


class TodoList extends React.Component {
  render(){
    const {todos, receiveTodo, removeTodo} = this.props;
    const todoItem = todos.map(todo => (
      <TodoListItem
        key = {`todo-list-item${todo.id}`}
        todo = {todo}
        receiveTodo = {receiveTodo}
        removeTodo = {removeTodo} />
      )
    );

    return (
      <div>
        <ul className = 'todo-list'>
          {todoItem}
        </ul>
        <TodoForm receiveTodo={ receiveTodo }/>
      </div>
    );
  }
}

export default TodoList;
