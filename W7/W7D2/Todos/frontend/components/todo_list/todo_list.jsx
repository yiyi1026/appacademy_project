import React from 'react';

import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';


class TodoList extends React.Component {

  render(){
    const {todos, receiveTodo, removeTodo} = this.props;
    // console.log(this.props);
    const todoItems = todos.map(todo => (
      <TodoListItem
        key = {`todo-list-item${todo.id}`}
        todo = {todo}
        receiveTodo = {receiveTodo}
        removeTodo = {removeTodo}/>  //why receiveTodo here?
      )
    );

    return (
      <div>
        <ul className = 'todo-list'>
          {todoItems}
        </ul>
        <TodoForm receiveTodo={ receiveTodo } removeTodo = {removeTodo}/>
      </div>
    );
  }
}

export default TodoList;
