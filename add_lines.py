import argparse
import pathlib


def add_lines_to_file(file):
    with file.open("r+") as f:
        content = f.readlines()

        if "set -u\n" not in content:
            insert_index = 1 if content and content[0].startswith("#!") else 0
            content.insert(insert_index, "set -u\n")

        if "set -e\n" not in content:
            insert_index = 1 if content and content[0].startswith("#!") else 0
            content.insert(insert_index, "set -e\n")

        if "set -o pipefail\n" not in content:
            insert_index = 1 if content and content[0].startswith("#!") else 0
            content.insert(insert_index, "set -o pipefail\n")

        f.seek(0)
        f.truncate()
        f.writelines(content)


def parse_arguments():
    parser = argparse.ArgumentParser(
        description="Add lines to .sh files in a directory"
    )

    parser.add_argument(
        "-d",
        "--directory",
        type=str,
        default=".",
        help="Base directory (default: current directory)",
    )

    return parser.parse_args()


def main():
    args = parse_arguments()
    sh_files = pathlib.Path(args.directory).glob("*.sh")

    for file in sh_files:
        add_lines_to_file(file)


if __name__ == "__main__":
    main()
