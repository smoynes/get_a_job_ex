GetAJob in Elixir
=================

An Elixir implementation of the "Get a Job" service from *Designing
Hypermedia APIs* by Steve Klabnik.

The application uses the [Phoenix](https://phoenixframework.org) to
implement the API.

This is a work in progress and not complete.

Development
-----------

Requirements:

- postgresql: server and client
- Erlang/OTP 17
- Elixir 1.0.4

I've built a vagrant environment that has everything you need:

```
$ vagrant up
$ vagrant ssh
```

The source code is available in the VM at `/vagrant`.

To run the application in development mode.

1. Install dependencies:

`shell
$ mix do local.hex --force , local.rebar --force, deps.get
`

2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `http://localhost:4000` from your browser.

Examples
--------

