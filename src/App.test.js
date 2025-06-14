import { render, screen } from "@testing-library/react";
import App from "./App";

test("renders welcome text", () => {
  render(<App />);
  const header = screen.getByText(/Welcome to My Dynamic Website/i);
  expect(header).toBeInTheDocument();
});
