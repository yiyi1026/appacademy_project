import { uniqueId } from '../../utils/idGenerator';
import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    console.log(props);
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    // this.setState = this.setState.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return e => this.setState({[property]: e.target.value});
  }
// this.setState({ title: "", body: "" })
  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.createTodo(todo).then(
      () => this.setState({ title: "", body: "" })
    );
  }

  render() {
    return (
      <form className="todo-form" onSubmit={this.handleSubmit}>
        <label>Title:
          <input
            className="input"
            ref="title"
            value={this.state.title}
            placeholder="buy milk"
            onChange={this.update('title')}
            required/>
        </label>
        <label>Body:
          <textarea
            className="input"
            ref="body"
            cols='20'
            value={this.state.body}
            rows='5'
            placeholder="2% or whatever is on sale!"
            onChange={this.update('body')}
            required></textarea>
        </label>
        <button className="create-button">Create Todo!</button>
      </form>
    );
  }
}

export default TodoForm;
