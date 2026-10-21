# Pisa

Pisa turns spec files (a `.dml` domain model, an `.adl` architecture, forms, use cases) into a running project: Spring Boot (Java) or Hono with Prisma (TypeScript), with API, pages and tests.

## Install

macOS, Linux:

```
curl -fsSL https://raw.githubusercontent.com/Arcware-io/pisa/main/install.sh | sh
```

Windows (PowerShell):

```
irm https://raw.githubusercontent.com/Arcware-io/pisa/main/install.ps1 -OutFile install.ps1; .\install.ps1
```

Homebrew (macOS, Linux):

```
brew tap Arcware-io/pisa https://github.com/Arcware-io/pisa
brew install pisa
```

Or download the file `pisa-<system>-<cpu>` by hand from the [releases](https://github.com/Arcware-io/pisa/releases) (`pisa-darwin-arm64`, `pisa-darwin-x64`, `pisa-linux-x64`, `pisa-linux-arm64`, `pisa-windows-x64.exe`, `pisa-windows-arm64.exe`) and put it on your `PATH`.

Check:

```
pisa --version
```

## Try it

```
mkdir my-project && cd my-project
pisa init          # creates doc/ with the tutorials
pisa play          # lists the tutorials
pisa play hono-typescript
```

`pisa play` runs a tutorial by itself (creates the project, generates it, starts the application). Without a language model it writes the files the tutorial shows; with `--llm` it asks the model. With `--fast` it skips everything slow (tests, starting the application).

## Editor support

The releases also contain the extensions for `.dml` and `.adl` (syntax colors, checks, completion):

- VS Code: `dml-vscode-extension-<version>.vsix`, install with `code --install-extension <file>`.
- IntelliJ: `dml-intellij-plugin-<version>.zip`, *Settings → Plugins → Install Plugin from Disk*.

## Note

Pisa is the prototype of a CAS thesis project, not a product.
