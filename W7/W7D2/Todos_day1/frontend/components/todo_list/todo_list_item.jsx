import React from 'react';


class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
  }


  handleDelete(event) {
    event.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  render() {

    const { todo, removeTodo } = this.props;
    console.log(this.props);
    return (

      <li>
        {this.props.todo.title}
        <button onClick={ this.handleDelete }>Delete ME</button>
      </li>
    );
  }
}

export default TodoListItem;
