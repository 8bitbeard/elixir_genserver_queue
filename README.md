# Queue

## Introduction

This repository contains the code developed to fulfill the challenge #16 of the Elixir track from Rocketseats Ignite course.

The challenge objective was to build a Queue app with GenServers.

## Commands

Since this project doesn't have any dependencies, to run it you just neet to clone this repo and run the following commands:

To start the iex inside the project:
```sh
$ iex -S mix
```

To start the Queue with an initial state:
```sh
$ {:ok, pid} = Queue.start_link([1, 2, 3])
```

To add an element to the queue:
```sh
$ Queue.enqueue(pid, element)
```

To remove an element from the queue:
```sh
$ Queue.dequeue(pid)
```
