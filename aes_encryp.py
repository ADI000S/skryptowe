from cryptography.fernet import Fernet

# funkcja generuje klucz AES do zabezpieczenia pliku
def generate_key():
    key = Fernet.generate_key()
    with open("aes.key", "wb") as key_file:
        key_file.write(key)
    print("Wygenerowano i zapisano klucz AES (aes.key)")

# zaladowanie klucza
def load_key():
    return open("aes.key", "rb").read()

# funkcja szyfruje plik stowrzonym kluczem
def encrypt_file(filename):
    key = load_key()
    f = Fernet(key)

    with open(filename, "rb") as file:
        data = file.read()

    encrypted_data = f.encrypt(data)

    with open(filename + ".enc", "wb") as file:
        file.write(encrypted_data)

    print(f"Zaszyfrowano {filename}")

# Wykonanie funkcji
if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Użycie: python aes_encrypt.py <plik.txt>")
        sys.exit(1)

    generate_key()
    encrypt_file(sys.argv[1])
