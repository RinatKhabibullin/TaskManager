import React from 'react';

import { blue } from '@material-ui/core/colors/blue';
import { ThemeProvider, createMuiTheme } from '@material-ui/core/styles';

const theme = createMuiTheme({
  palette: {
    type: 'dark',
  },
});

const MUITheme = (props) => <ThemeProvider theme={theme}>{props.children}</ThemeProvider>;

export default MUITheme;
