import helpers

import numpy as np
import random
from pandas.util.testing import rands_array


def create_file(filename: str, num_records: int, ext: str, seed=42):
    # Set Random Seed for NumPy and Python
    np.random.seed(seed)
    random.seed(seed)

    # Write Markdown Header according to file type
    header = helpers.MARKDOWN_TABLE_HEADER
    if ext == "csv":
        # Write CSV Header
        header = helpers.CSV_HEADER
    with open(filename, "w+", buffering=8192) as file:
        file.write(header)

        # Generate random data, each is a list with num_records entries

        # random.sample() returns random numbers without replacement.
        roll_nos = random.sample(range(1000, int(1e7)), num_records)
        ages = np.random.randint(16, 21, size=num_records)

        # rands_array() returns rand-string-array containg num_records of names
        # each having 9 chracter first name and 5 char. lastname, separated
        # by space.
        names = rands_array(9, num_records) + " " + rands_array(5, num_records)
        branches = np.random.choice(["ECE", "CSE", "EEE", "Mech", "Civil"],
                                    size=num_records)

        # Write data to file, according to extension
        if ext == "csv":
            for r, n, b, a in zip(roll_nos, names, branches, ages):
                file.write(f"{r}, {n}, {b}, {a}\n")
            return
        for r, n, b, a in zip(roll_nos, names, branches, ages):
            file.write(f"| {r:7} | {n} | {b:^6} | {a:^4} |\n")


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-f", "--filename", type=str, default="data.md")
    parser.add_argument("-n", "--num_records", type=int, default=int(1e6))
    parser.add_argument("-t", "--type", type=str, default="md")
    parser.add_argument("-s", "--seed", type=int, required=True)
    args = parser.parse_args()
    create_file(args.filename, args.num_records, args.type, args.seed)
