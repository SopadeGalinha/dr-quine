# Outside comment

def func():
    return '# Outside comment\n\ndef func():\n    return %r\n\ndef main():\n    # Inside comment\n    s = func()\n    print(s %% (s,))\n\nif __name__ == "__main__":\n    main()'

def main():
    # Inside comment
    s = func()
    print(s % (s,))

if __name__ == "__main__":
    main()
