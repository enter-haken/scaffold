# Scaffold

This is a mix task for creating a elixir web application with [cowboy][1] and [angular][2].

Of course there are several ways to get a good foundation for a web project.
This is just an other attempt.

## requirements

* Elixir ~> 1.10.4
* Erlang ~> 23.0.3

If you use [asdf][3], you can install the requirements with a call to

```
asdf install
```

int the root folder of the `scaffold` project.

## install

```
$ make install
```

will install the current archive on your system.

```
$ make uninstall
```

will remove it again.

## generate a Scaffold

After the install you can generate an application with

```
$ mix scaffold.new test_application
```

The application name should be snake cased.

As a result you get a project tree like

```
.
├── client
│   ├── angular.json
│   ├── .browserslistrc
│   ├── e2e
│   │   ├── protractor.conf.js
│   │   ├── src
│   │   │   ├── app.e2e-spec.ts
│   │   │   └── app.po.ts
│   │   └── tsconfig.json
│   ├── .editorconfig
│   ├── .gitignore
│   ├── karma.conf.js
│   ├── Makefile
│   ├── package.json
│   ├── package-lock.json
│   ├── src
│   │   ├── app
│   │   │   ├── app.component.html
│   │   │   ├── app.component.scss
│   │   │   ├── app.component.spec.ts
│   │   │   ├── app.component.ts
│   │   │   ├── app.module.ts
│   │   │   └── app-routing.module.ts
│   │   ├── assets
│   │   │   └── .gitkeep
│   │   ├── environments
│   │   │   ├── environment.prod.ts
│   │   │   └── environment.ts
│   │   ├── favicon.ico
│   │   ├── index.html
│   │   ├── main.ts
│   │   ├── polyfills.ts
│   │   ├── styles.scss
│   │   └── test.ts
│   ├── tsconfig.app.json
│   ├── tsconfig.json
│   ├── tsconfig.spec.json
│   └── tslint.json
├── Dockerfile
├── .gitignore
├── lib
│   ├── application.ex
│   └── web
│       ├── plug
│       │   └── bakery.ex
│       └── router.ex
├── Makefile
├── mix.exs
├── mix.lock
├── README.md
├── test
│   └── test_helper.exs
└── .tool-versions
```

## just run it the first time?

If you just want to see what will happen, if you build this scaffold, you can use the provided dockerfile.

```
$ make docker docker_run
```

will build the entire application and start the resulting container.

You can see the result at `http://localhost:5000`.

If you are interessted, how this works, you can take a closer look.

## preperation before first start

The simplest way to install all necessary requirements is to use the [asdf version manager][3].

With a call to

```
$ asdf install
```

in the root of your newly generated project, all dependencies are gona be installed.


### client

The `client` part consists of a more or less standard angular project.
The standard page is replaced with a more simple one.

```
section class="hero is-medium is-primary is-bold">
  <div class="hero-body">
    <div class="container">
      <h1 class="title">
        {{ title }}
      </h1>
      <h2 class="subtitle">
        Primary bold subtitle
      </h2>
    </div>
  </div>
</section>

<router-outlet></router-outlet>
```

It uses [bulma.io][4] as a default styling.

You can call

```
$ make
```

in your `client root folder`, to build the `client`. 
It will install all necessary `node_modules`, if necessary.

### server

If you call

```
$ make
```

in the root folder of the project, it will be checked if

* the `client` needs a build
* elixir dependencies (`mix deps.get`) needs to be done.

After the build, you can run the application with

```
$ make run
```

You can see the result at `http://localhost:4040`.


## remarks

* Due to the fast development of `elixir`, `erlang`, `cowboy` and `angular`, this project quickly can get out of date. 
There are a lot of "moving parts", which must fit together.

* The latest versions depends on the newest available docker container, so you can run your application reasonably.

# Contact

Jan Frederik Hake, <jan_hake@gmx.de>. [@enter_haken](https://twitter.com/enter_haken) on Twitter.

[1]: https://github.com/ninenines/cowboy
[2]: https://angular.io/
[3]: https://github.com/asdf-vm/asdf
[4]: https://bulma.io
