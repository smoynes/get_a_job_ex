GetAJob in Elixir
=================

An Elixir implementation of the "Get a Job" service from *Designing
Hypermedia APIs* by Steve Klabnik.

The application uses the [Phoenix Framework](https://phoenixframework.org) to
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

    ```
    $ ./scripts/build.sh
    ```

    Or, equivalently:

    ```
    $ mix local.hex --force
    $ mix local.rebar --force
    $ mix deps.get
    $ npm install
    ```

1. Create the databases:

    ```
    $ ./scripts/create_db.sh
    ```
 
    Or, equivalently:

    ```
    $ mix ecto.create
    $ mix ecto.migrate
    ```

1. Start Phoenix endpoint:

   ```console
    $ mix phoenix.server
    ```

Now you can visit `http://localhost:4000` from your browser. The port
is also forwarded to the vagrant VM.

Examples
--------

```console
$ curl -L --include \
  --data 'job[status]=in_progress' \
  --data 'job[number_one]=5' \
  --data 'job[number_two]=2' \
  http://127.0.0.1:4000/api/jobs
```

```console
$ curl --include http://127.0.0.1:4000/api/jobs/1
```

```
$ curl http://127.0.0.1:4000/api/jobs
```
