# An issue with JS hooks and live components

### Problem Description

- one live view (`Counter`) with two live components (`CounterComponent`)
  - component IDs: `component-a` and `component-b`
- each component is connected to a `Counter` JS hook
- each component sends a `ping` message to the hook upon `update/2`
- the message contains the component's ID
- each `Counter` JS object is set up to handle the `ping` event from its component using `handleEvent` (and print it)
- when the live view calls `update/2` on each component, both hooks receive the `ping` event from the **second component only**

### Steps to reproduce the issue

- start the server:
  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`
- visit [`localhost:4000`](http://localhost:4000)
- click on `INC` button
- all counters (global and components) are updated
- in JS console, both hook objects print the payload as coming from `component-b`

### Resolution

This issue has been discussed in this [forum
topic](https://elixirforum.com/t/js-hooks-do-not-receive-the-expected-events-from-their-corresponding-live-components/37562).

It is [indeed a bug in live
view](https://elixirforum.com/t/js-hooks-do-not-receive-the-expected-events-from-their-corresponding-live-components/37562/5?u=kkentzo)
that has now been fixed.

The best workaround is to send the message from the component to the
live view and then down to the hook (see [this
commit](https://github.com/kkentzo/live-component-push-event-issue/compare/workaround-send-message-through-liveview)).
