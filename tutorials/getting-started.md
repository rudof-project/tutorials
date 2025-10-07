# Getting Started with Rudof

This tutorial will guide you through the installation and initial setup of Rudof.

## Installation

### Using Cargo

If you have Rust and Cargo installed, you can install Rudof directly:

```bash
cargo install rudof
```

### Building from Source

Alternatively, you can build Rudof from source:

```bash
git clone https://github.com/rudof-project/rudof
cd rudof
cargo build --release
```

The compiled binary will be available at `target/release/rudof`.

## Verifying Installation

After installation, verify that Rudof is working correctly:

```bash
rudof --version
```

You should see the version information displayed.

## First Steps

### Getting Help

To see all available commands and options:

```bash
rudof --help
```

### Basic Command Structure

Rudof commands typically follow this pattern:

```bash
rudof [COMMAND] [OPTIONS] [FILES]
```

## Next Steps

Now that you have Rudof installed, proceed to the [Basic Usage](basic-usage.md) tutorial to learn how to use it.
