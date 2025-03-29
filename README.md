# Repository Content Extractor

A bash script that extracts the structure and content of a repository into a single text file. This is particularly useful for providing context to LLM (Large Language Model) agents about your codebase.

## Features

- Generates a complete view of your repository structure using the `tree` command
- Extracts the content of files with specified extensions:
  - `.txt`
  - `.json`
  - `.toml`
  - `.yaml`
  - `.py`
  - `.groovy`
  - `Dockerfile`
  - `serve`
- Creates a well-formatted output with clear separators between files
- Ignores itself and the output file to avoid recursion

## Requirements

- Bash shell
- `tree` command installed

## Installation

1. Download the `extract_repo.sh` script
2. Make it executable:

```bash
chmod +x extract_repo.sh
```

## Usage

1. Navigate to the root directory of your repository
2. Run the script:

```bash
./extract_repo.sh
```

3. The script will create a file named `repo_content.txt` in the current directory

## Output Format

The output file contains:

1. A tree-view representation of your repository structure
2. The full content of each file with the specified extensions
3. Each file is preceded by its path and separated by delimiters for easy reading

Example output structure:

```
Repo Structure:
[tree output here]

===========================================

Repo Content:

File: ./path/to/file.py
===========================================
[content of file.py]


===========================================

File: ./path/to/another/file.json
===========================================
[content of file.json]


===========================================
```

## Use Cases

- Providing context to LLM agents about your codebase
- Generating documentation
- Creating a snapshot of your repository for archival purposes
- Simplifying code reviews by having all relevant files in one document

## Customization

You can modify the script to include additional file extensions or change the output format as needed.