# A Docker build container for cargo-web projects

[View on Docker Hub](https://hub.docker.com/r/nessex/cargo-web-docker/)

This container has all the dependencies required for building basic projects with [cargo-web](https://github.com/koute/cargo-web). Specifically, this produces an emscripten webassembly artifact. For example, to create a runnable copy of the [Yew](https://github.com/DenisKolodin/yew) TodoMVC example, you can run the following:

```
git clone https://github.com/DenisKolodin/yew.git
cd yew
docker run -v $(pwd)/out:/out:rw -v $(pwd):/project:ro -e PROJECTDIR=examples/todomvc nessex/cargo-web-docker:latest
```

This will create a folder called `out` inside the `yew` directory, which has a production build of Yew's TodoMVC compiled to WebAssembly. It can then be served up by a webserver of some kind, e.g.

```
# Using Python2 to host a simple webserver on http://localhost:8800
cd out
python2 -m SimpleHTTPServer 8800
```


## Configuration
This container outputs artifacts to `/out` within the container and expects project files to live in `/project`. These two folders should be docker volume mounts.

Environment Variables:
 - PROJECTDIR: Relative to the project files, where should `cargo web build` be run. By default, this is the directory mounted to /project.


## Status

I don't intend for this repo to stick around, if it proves useful I'll tidy it up and make a Pull Request for the official cargo-web repo. This is not ready for a production CI pipeline, dependencies aren't version tagged and hashes aren't checked. Use at your own risk.
