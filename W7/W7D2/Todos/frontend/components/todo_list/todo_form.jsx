import React from 'react';
import { uniqueId } from '../../utils/idGenerator';
import merge from 'lodash/merge';

class TodoForm extends React.Component {
  constructor() {
    super();
    this.state = {
      title: '',
      body: '',
      done: false
    };
    this.submitForm = this.submitForm.bind(this);
  }

  update(key) {
    return (event => this.setState({[key]: event.currentTarget.value}));
  }

  submitForm(event) {
    event.preventDefault();
    const todo = merge({}, this.state, { id: uniqueId() });
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });
  }

  render () {
    return (
      <form onSubmit={this.submitForm}>
        <label>Title:
          <br/>
          <input type="text" onChange={this.update('title')} value={this.state.title}/>
        </label>
          <br/>
        <label>Body:
          <br/>
          <textarea onChange={this.update('body')} value={this.state.body} rows="8" cols="80"></textarea>
        </label>
        <button>Submit</button>
      </form>
    );
  }
}

export default TodoForm;
