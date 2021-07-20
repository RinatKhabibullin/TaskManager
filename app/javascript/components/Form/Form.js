import React from 'react';
import PropTypes from 'prop-types';
import { has, isNil } from 'ramda';

import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';

import UserSelect from 'components/UserSelect';
import ImageUpload from 'components/ImageUpload';

import TaskPresenter from 'presenters/TaskPresenter';

import useStyles from './useStyles';

const MODES = {
  ADD: 'add',
  EDIT: 'edit',
};

const Form = ({ errors, onChange, task, onAttachImage, onRemoveImage, mode }) => {
  const handleChangeTextField = ({ target: { name, value } }) => onChange({ ...task, [name]: value });

  const handleChangeSelect = (fieldName) => (user) => onChange({ ...task, [fieldName]: user });

  const styles = useStyles();

  return (
    <form className={styles.root}>
      <TextField
        error={has('name', errors)}
        helperText={errors.name}
        onChange={handleChangeTextField}
        name="name"
        value={TaskPresenter.name(task)}
        label="Name"
        required
        margin="dense"
      />
      <TextField
        error={has('description', errors)}
        helperText={errors.description}
        onChange={handleChangeTextField}
        value={TaskPresenter.description(task)}
        name="description"
        label="Description"
        required
        multiline
        margin="dense"
      />
      {mode === MODES.EDIT && (
        <UserSelect
          label="Author"
          value={TaskPresenter.author(task)}
          onChange={handleChangeSelect('author')}
          isRequired
          isDisabled
          error={has('author', errors)}
          helperText={errors.author}
        />
      )}
      <UserSelect
        label="Assignee"
        value={TaskPresenter.assignee(task)}
        onChange={handleChangeSelect('assignee')}
        isRequired
        error={has('assignee', errors)}
        helperText={errors.assignee}
      />
      {mode === MODES.EDIT &&
        (isNil(TaskPresenter.imageUrl(task)) ? (
          <div className={styles.imageUploadContainer}>
            <ImageUpload onUpload={onAttachImage} />
          </div>
        ) : (
          <div className={styles.previewContainer}>
            <img className={styles.preview} src={TaskPresenter.imageUrl(task)} alt="Attachment" />
            <Button variant="contained" size="small" color="primary" onClick={onRemoveImage}>
              Remove image
            </Button>
          </div>
        ))}
    </form>
  );
};

Form.propTypes = {
  onChange: PropTypes.func.isRequired,
  task: PropTypes.shape().isRequired,
  errors: PropTypes.shape({
    name: PropTypes.arrayOf(PropTypes.string),
    description: PropTypes.arrayOf(PropTypes.string),
    author: PropTypes.arrayOf(PropTypes.string),
    assignee: PropTypes.arrayOf(PropTypes.string),
  }),
  mode: PropTypes.string.isRequired,
  onAttachImage: PropTypes.func,
  onRemoveImage: PropTypes.func,
};

Form.defaultProps = {
  errors: {},
  onAttachImage: () => {},
  onRemoveImage: () => {},
};

export default Form;
