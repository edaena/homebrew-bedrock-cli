# Homebrew Taps
This repository contains [Homebrew](https://brew.sh/) formulae for:
- [bedrock-cli](https://github.com/microsoft/bedrock-cli)
- [fabrikate](https://github.com/microsoft/fabrikate)

Tap to the formula repository:
```
$ brew tap edaena/core
```

## Install Bedrock CLI

```
$ brew install edaena/core/bedrock-cli
```

To test:
```
$ brew test edaena/core/bedrock-cli
```
This verifies functionality by running the `bedrock project init` command.

To run:
```
$ bedrock
```

## Install Fabrikate

```
$ brew install edaena/core/fabrikate
```

To test:
```
$ brew test edaena/core/fabrikate
```
This verifies functionality by running the `fab find prometheus` command.


To run:
```
$ fab
```
