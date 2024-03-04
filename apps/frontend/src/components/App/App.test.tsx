import { act, render, screen } from '@testing-library/react';
import App, { routeConfig } from './App';
import { RouterProvider, createMemoryRouter } from 'react-router-dom';
import { cleanup } from "@testing-library/react";

jest.mock('../../services/logger.service', () => ({
  __esModule: true,
  default: {
    info: jest.fn(),
    warn: jest.fn(),
    error: jest.fn()
  }
}));

afterEach(cleanup);

describe('App component ', () => {
  beforeEach(() => render(<App />));

  it('should be in the document', () => {
    expect(screen.getByTestId('container')).not.toBeEmptyDOMElement()
  });
});

describe('App routing', () => {
  const setUp = (async () => {
    const router = createMemoryRouter(routeConfig, { initialEntries: ['/'] })

    render(
      <RouterProvider router={router} />
    );

    return { router }
  });

  it('redirects from / to /home', async () => {
    let router = setUp();
    expect((await router).router.state.location.pathname).toBe("/home");
  });

  it('going to bookkeeper hides the app view, preserves header', async () => {
    let router = setUp();
    expect(screen.getByTestId('header')).not.toBeEmptyDOMElement();
    expect(screen.queryByTestId('cln-container')).toBeInTheDocument();
    expect(screen.queryByTestId('bookkeeper-container')).not.toBeInTheDocument();
    await act(async () => {
      (await router).router.navigate("/bookkeeper");
    })
    expect((await router).router.state.location.pathname).toBe("/bookkeeper");
    expect(screen.getByTestId('header')).not.toBeEmptyDOMElement();
    expect(screen.queryByTestId('cln-container')).not.toBeInTheDocument();
    expect(screen.queryByTestId('bookkeeper-container')).toBeInTheDocument();
  })
});