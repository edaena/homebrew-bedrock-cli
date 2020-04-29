# Homebrew Taps
This repository contains [Homebrew](https://brew.sh/) formulae for:
- [bedrock-cli](https://github.com/microsoft/bedrock-cli)
- [fabrikate](https://github.com/microsoft/fabrikate)

Tap to the formulae repository:
```
$ brew tap edaena/core
```

## Install Bedrock CLI

```
$ brew install edaena/core/bedrock-cli
```

Test the formula:
```
$ brew test edaena/core/bedrock-cli
```

Run `bedrock-cli`:
```
$ bedrock
```

## Install Fabrikate

```
$ brew install edaena/core/fabrikate
```

Test the formula:
```
$ brew test edaena/core/fabrikate
```
This verifies functionality by running the `fab find prometheus` command.


Run `fabrikate`:
```
$ fab
```
