export const allTodos = ({ todos }) => (
  todos ? Object.keys(todos).map(key => todos[key]) : []
);

// export const stepsById = ({ steps }, todoId) => (
//   steps[todoId] ? Object.keys(steps[todoId]).map(key => steps[todoId][key]) : []
// );

export const allSteps = ({ steps }) => (
  steps ? Object.keys(steps).map(key => steps[key]) : []
);

export const selectTodo = ({ todos }, todoId) => todos[todoId];