import os

def main():
    i = 5
    s = 'import os\n\ndef main():\n    i = %d\n    s = %r\n\n    if os.path.exists(f"Sully_{i}.py"):\n        i -= 1\n\n    if i < 0:\n        return\n\n    filename = f"Sully_{i}.py"\n    with open(filename, "w") as f:\n        f.write(s %% (i, s))\n\n    os.system(f"python3 {filename}")\n\nif __name__ == "__main__":\n    main()'

    if os.path.exists(f"Sully_{i}.py"):
        i -= 1

    if i < 0:
        return

    filename = f"Sully_{i}.py"
    with open(filename, "w") as f:
        f.write(s % (i, s))

    os.system(f"python3 {filename}")

if __name__ == "__main__":
    main()