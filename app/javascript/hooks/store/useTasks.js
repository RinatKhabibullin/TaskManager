import { useSelector } from 'react-redux';
import { useTasksActions } from 'slices/TasksSlice';
import { STATES } from 'presenters/TaskPresenter';

const useTasks = () => {
  const board = useSelector((state) => state.TasksSlice.board);
  const { loadColumn, loadColumnMore } = useTasksActions();

  const queryParamsCreate = (stateEq, page = 1, perPage = 10) => ({
    q: { stateEq },
    page,
    perPage,
  });

  const loadBoard = () => Promise.all(STATES.map(({ key }) => loadColumn(queryParamsCreate(key))));

  return {
    board,
    loadBoard,
    loadColumn,
    loadColumnMore,
    queryParamsCreate,
  };
};

export default useTasks;
