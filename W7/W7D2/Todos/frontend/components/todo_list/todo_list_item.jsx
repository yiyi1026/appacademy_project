import React from 'react';
import merge from 'lodash/merge';



class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    // console.log(props);
    this.handleDelete = this.handleDelete.bind(this);
    // this.toggleTodo = this.toggleTodo.bind(this);
  }

  // toggleTodo(e){
  //   e.preventDefault();
  //   const toggledTodo = merge(
  //     {},
  //     this.props.todo,
  //     {done: !this.props.todo.done}
  //   );
  //   // this.props.receiveTodo(toggledTodo);
  // }

  handleDelete(event) {
    // console.log('what');
    event.preventDefault();
    // removeTodo
    let id = this.props.todo.id;
    this.props.removeTodo(id);
  }

  render() {
    const { todo, removeTodo } = this.props; //where does this updateTodo come from
    console.log(removeTodo);
    return (
      <li className='todo-list-item'>
      <div>
          {this.props.todo.title}
          <button key={this.props.todo.id} onSubmit={this.handleDelete}>
            Delete this item
          </button>
      </div>
    </li>
    );
  }
}

export default TodoListItem;
