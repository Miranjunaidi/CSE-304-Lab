# from one.helpers import Student


def read_choice():
    menu = {
        0: "Exit",

        1: "Creating Tree",
        2: "Loading Tree",

        3: "Inserting",
        4: "Deleting",
        5: "Updating",
    }

    for k, v in menu.items():
        print(f"Enter {k} for {v}")
    ch = int(input("Select choice: "))
    print()

    options = {
        0: ["Are you sure? "],

        1: ["Name of the BST File: "],
        2: ["Name of the BST File: "],

        3: ["Enter student " + s for s in
            ["Roll Number: ", "Name: ", "Branch: ", "Age: "]],
        4: ["Enter Roll Number: "],
        5: ["Enter Student Roll Number: "] + ["Enter new " + s for s in
                                              ["Name: ", "Branch: ", "Age: "]],
    }
    # print(key, value[0])
    params = []
    for ques in options[ch]:
        params += [input(ques)]
    print()

    return ch, params


def doWork(choice, params):
    pass


if __name__ == "__main__":
    # A REPL loop
    while True:
        # READ
        choice, params = read_choice()

        # EVAL
        if choice == 0:
            break
        result = doWork(choice, params)

        # PRINT
        print(result)
