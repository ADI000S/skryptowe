import sys
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding

# odczytujemy klucz prywatny
with open("private_key.pem", "rb") as f:
    private_key = serialization.load_pem_private_key(f.read(), password=None)

# wczytujemy dane pliku podanego w wykonaniu
filename = sys.argv[1]
with open(filename, "rb") as f:
    data = f.read()

# generujemy podpis
signature = private_key.sign(
    data,
    padding.PSS(
        mgf=padding.MGF1(hashes.SHA256()),
        salt_length=padding.PSS.MAX_LENGTH
    ),
    hashes.SHA256()
)

# zapisujemy podpis 
with open(filename + ".sig", "wb") as f:
    f.write(signature)

print(f"Podpisano plik '{filename}' podpis zapisany jako '{filename}.sig'")
