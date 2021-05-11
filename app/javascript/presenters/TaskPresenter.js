import PropTypes from 'prop-types';
import PropTypesPresenter from 'utils/PropTypesPresenter';

export default new PropTypesPresenter(
  {
    id: PropTypes.number,
    name: PropTypes.string,
    description: PropTypes.string,
  },
  {
    task(task) {
      return `${this.name(task)} ${this.description(task)}`;
    },
    taskIdAndName(task) {
      return `${this.id(task)} [${this.name(task)}]`;
    },
  },
);
