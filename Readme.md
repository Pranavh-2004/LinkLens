# LinkLens

**LinkLens** is a command-line tool for checking the validity of links in a file. It allows you to verify links sequentially or asynchronously, making it fast and efficient for processing large sets of URLs.

## Features

- **Sequential Link Checking**: Check each link one by one.
- **Asynchronous Link Checking**: Check multiple links concurrently for faster performance.
- **Error Handling**: Handles various HTTP errors and connection issues, providing detailed feedback on why a link may be invalid.

## Installation

To install LinkLens, you'll need [Nim](https://nim-lang.org/) and [Nimble](https://nim-lang.org/docs/nimble.html) (Nim's package manager). Follow these steps:

1. **Install Nim**:
   If you don't have Nim installed, you can install it by following the instructions on the [official Nim website](https://nim-lang.org/).

2. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/LinkLens.git
   cd LinkLens
   ```

3. **Install dependencies:**
   LinkLens uses the nimble package manager to handle dependencies. Run the following command to install the required libraries:

   ```bash
   nimble install
   ```

4. **Build the application:**
   Once installed, build the application by running:

   ```bash
   nimble build
   ```

## Usage

To use LinkLens, simply run the following command:

```bash
nimble run -- <links_file>
```

### Example

Create a links.txt file with the following content:

```
https://www.example.com
https://www.nonexistentwebsite.com
```

Then, run the following command:

```bash
nimble run -- examples/links.txt
```

## Contributing

If you want to contribute to the project, feel free to open a pull request or submit issues.

### Steps to Contribute:

1. Fork the repository.
2. Create a feature branch.
3. Make changes and commit them.
4. Open a pull request with a clear description of what was changed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
