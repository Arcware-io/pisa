# Pisa

Pisa erzeugt aus Spec-Dateien (`.dml`-Domänenmodell, `.adl`-Architektur, Formulare, Use Cases) ein lauffähiges Projekt: Spring Boot (Java) oder Hono mit Prisma (TypeScript), mit API, Seiten und Tests. Dieses Repository enthält nur die fertigen Programme; der Quellcode liegt nicht hier.

## Installieren

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

Oder die Datei `pisa-<system>-<cpu>` von Hand aus den [Releases](https://github.com/Arcware-io/pisa/releases) laden (`pisa-darwin-arm64`, `pisa-darwin-x64`, `pisa-linux-x64`, `pisa-linux-arm64`, `pisa-windows-x64.exe`, `pisa-windows-arm64.exe`) und in den `PATH` legen.

Prüfen:

```
pisa --version
```

## Ausprobieren

```
mkdir mein-projekt && cd mein-projekt
pisa init          # legt doc/ mit den Tutorials an
pisa play          # welche Tutorials es gibt
pisa play hono-typescript
```

`pisa play` führt ein Tutorial selbst aus (Projekt anlegen, generieren, Anwendung starten). Ohne Sprachmodell schreibt es die im Tutorial gezeigten Dateien; mit `--llm` fragt es das Modell. Mit `--fast` lässt es alles Langsame weg (Tests, Start der Anwendung).

## Editor-Unterstützung

Die Releases enthalten auch die Erweiterungen für `.dml` und `.adl` (Syntaxfarben, Prüfung, Vervollständigung):

- VS Code: `dml-vscode-extension-<version>.vsix`, installieren mit `code --install-extension <datei>`.
- IntelliJ: `dml-intellij-plugin-<version>.zip`, *Settings → Plugins → Install Plugin from Disk*.

## Hinweis

Pisa ist der Prototyp einer CAS-Projektarbeit, kein Produkt.
