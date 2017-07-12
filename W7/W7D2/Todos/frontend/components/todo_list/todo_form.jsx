import React from 'react';
import { uniqueId } from '../../utils/idGenerator';
import merge from 'lodash/merge';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: '',
      body: '',
      done: false
    };
    this.submitForm = this.submitForm.bind(this);
  }

  update(property) {
    return (event => this.setState({[property]: event.target.value}));
  }

  submitForm(event) {
    event.preventDefault();
    const todo = merge({}, this.state, { id: uniqueId() });
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });  //reset the form
  }

  render () {
    return (
      <form onSubmit={this.submitForm}>
        <label>Title:
          <br/>
          <input
            ref='title'
            onChange={this.update('title')}
            value={this.state.title}
            placeholder="buy milk"
            required/>
        </label>
          <br/>
        <label>Body:
          <br/>
          <textarea
            onChange={this.update('body')}
            value={this.state.body}
            rows="8"
            cols="80"
            placeholder="2% or whatever is on sale!"
            required></textarea>
        </label>
        <button>Create Todo!</button>
      </form>
    );
  }
};

export default TodoForm;
