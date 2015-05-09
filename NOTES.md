Development Notes
=================

```
vagrant@wakesiah-dev:/vagrant$ iex -S mix
Erlang/OTP 17 [erts-6.4] [source-2e19e2f] [64-bit] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.0.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> alias GetAJobEx.Repo
nil
iex(2)> alias GetAJobEx.Job
nil
iex(3)> Repo.all Job
[debug] SELECT j0."id", j0."number_one", j0."number_two", j0."status", j0."inserted_at", j0."updated_at" FROM "jobs" AS j0 [] (1.3ms)
[]
iex(4)> job = %Job{number_one: 1, number_two: 2}
%GetAJobEx.Job{__meta__: %Ecto.Schema.Metadata{source: "jobs", state: :built},
 id: nil, inserted_at: nil, number_one: 1, number_two: 2, status: nil,
 updated_at: nil}
iex(5)> Repo.insert job
[debug] BEGIN [] (0.4ms)
[debug] INSERT INTO "jobs" ("inserted_at", "number_one", "number_two", "status", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id" [{{2015, 5, 9}, {22, 35, 50, 0}}, 1, 2, nil, {{2015, 5, 9}, {22, 35, 50, 0}}] (1.0ms)
[debug] COMMIT [] (1.6ms)
%GetAJobEx.Job{__meta__: %Ecto.Schema.Metadata{source: "jobs", state: :loaded},
 id: 1,
 inserted_at: %Ecto.DateTime{day: 9, hour: 22, min: 35, month: 5, sec: 50,
  usec: 0, year: 2015}, number_one: 1, number_two: 2, status: nil,
 updated_at: %Ecto.DateTime{day: 9, hour: 22, min: 35, month: 5, sec: 50,
  usec: 0, year: 2015}}
iex(9)> Repo.insert job
[debug] BEGIN [] (0.3ms)
[debug] INSERT INTO "jobs" ("inserted_at", "number_one", "number_two", "status", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id" [{{2015, 5, 9}, {22, 36, 2, 0}}, 1, 2, nil, {{2015, 5, 9}, {22, 36, 2, 0}}] (1.0ms)
[debug] COMMIT [] (0.8ms)
%GetAJobEx.Job{__meta__: %Ecto.Schema.Metadata{source: "jobs", state: :loaded},
 id: 2,
 inserted_at: %Ecto.DateTime{day: 9, hour: 22, min: 36, month: 5, sec: 2,
  usec: 0, year: 2015}, number_one: 1, number_two: 2, status: nil,
 updated_at: %Ecto.DateTime{day: 9, hour: 22, min: 36, month: 5, sec: 2,
  usec: 0, year: 2015}}

vagrant@wakesiah-dev:/vagrant$ curl -s localhost:4000/api/jobs | python -m json.tool
{
    "data": [
        {
            "__meta__": {
                "source": "jobs",
                "state": "loaded"
            },
            "id": 1,
            "inserted_at": "2015-05-09T22:35:50Z",
            "number_one": 1,
            "number_two": 2,
            "status": null,
            "updated_at": "2015-05-09T22:35:50Z"
        },
        {
            "__meta__": {
                "source": "jobs",
                "state": "loaded"
            },
            "id": 2,
            "inserted_at": "2015-05-09T22:36:02Z",
            "number_one": 1,
            "number_two": 2,
            "status": null,
            "updated_at": "2015-05-09T22:36:02Z"
        }
    ]
}

```
