# LiveComponentJsIssue

This repo describes the following problem:

- one live view with two live components (`component-a` and `component-b`)
- each component is connected to a `Counter` JS hook
- each component sends a `ping` message to the hook (containing the component's ID) upon `update/2`
- each `Counter` JS object is set up to handle the `ping` event from its component using `handleEvent` (and print it)
- when the live view calls `update/2` on each component, both hooks receive the `ping` event from the **second component only**

Steps to reproduce the issue:

- start the server:
  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`
- visit [`localhost:4000`](http://localhost:4000)
- click on `INC` button
- all counters (global and components) are updated
- in JS console, both hook objects print the payload as coming from `component-b`
