# Opium Demo

[![Actions Status](https://github.com/tmattio/opium-demo/workflows/CI/badge.svg)](https://github.com/tmattio/opium-demo/actions)

Demo of a fullstack application with Opium.

It is **heavily** inspired by [Phoenix](https://hexdocs.pm/phoenix/overview.html)'s project structure and [phx_gen_auth](https://github.com/aaronrenner/phx_gen_auth) generator.

The project structure, tests, and even comments, are taken directly from the links above, so no credit taken. All I did was providing an OCaml implementation using Opium.

The goal is to open a discussion on the following:

- What is the best project structure for an Opium application?
- Is there any opportunity to abstract complexity in a fullstack application in order to increase developer productivity?

## API

The server serves the following endpoints.

### `GET /`

Returns the string `Hello World`.

```bash
$ curl http://35.224.1.215/
Hello World
```

## Contributing

Take a look at our [Contributing Guide](CONTRIBUTING.md).
