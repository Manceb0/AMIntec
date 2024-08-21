#include <iostream>
#include <limits>

// Ejercicio 0x261: Strings
void ejercicio0x261() {
    std::cout << "Ejercicio 0x261: Strings\n";

    char str[] = "Hacking the Art of Exploitation";
    std::cout << "String original: " << str << "\n";

    str[0] = 'h';
    std::cout << "String modificado: " << str << "\n";

    int length = 0;
    while (str[length] != '\0') {
        length++;
    }
    std::cout << "Longitud de la cadena: " << length << "\n";
}

// Ejercicio 0x262: Signed, Unsigned, Long, and Short
void ejercicio0x262() {
    std::cout << "Ejercicio 0x262: Signed, Unsigned, Long, and Short\n";

    signed int si = -10;
    unsigned int ui = 10;
    short int si_short = 30000;
    long int li = 1000000;

    std::cout << "Signed int: " << si << "\n";
    std::cout << "Unsigned int: " << ui << "\n";
    std::cout << "Short int: " << si_short << "\n";
    std::cout << "Long int: " << li << "\n";
}

// Ejercicio 0x263: Pointers
void ejercicio0x263() {
    std::cout << "Ejercicio 0x263: Pointers\n";

    int x = 10;
    int* ptr = &x;

    std::cout << "Valor de x: " << x << "\n";
    std::cout << "Direccion de x: " << &x << "\n";
    std::cout << "Valor de ptr (direccion de x): " << ptr << "\n";
    std::cout << "Valor al que apunta ptr (*ptr): " << *ptr << "\n";

    *ptr = 20;
    std::cout << "Nuevo valor de x después de usar *ptr = 20: " << x << "\n";
}

// Ejercicio 0x264: Format Strings
void ejercicio0x264() {
    std::cout << "Ejercicio 0x264: Format Strings\n";

    int num = 42;
    char str[100];

    std::cout << "Número: " << num << "\n";

    snprintf(str, sizeof(str), "El número es: %d", num);
    std::cout << str << "\n";
}

// Ejercicio 0x265: Typecasting
void ejercicio0x265() {
    std::cout << "Ejercicio 0x265: Typecasting\n";

    int a = 10;
    double b = 3.14;

    std::cout << "Valor de a: " << a << "\n";
    std::cout << "Valor de b: " << b << "\n";

    double c = (double)a;
    int d = (int)b;

    std::cout << "a convertido a double: " << c << "\n";
    std::cout << "b convertido a int: " << d << "\n";
}

// Ejercicio 0x266: Command-Line Arguments
void ejercicio0x266(int argc, char* argv[]) {
    std::cout << "Ejercicio 0x266: Command-Line Arguments\n";

    std::cout << "Número de argumentos: " << argc << "\n";
    for (int i = 0; i < argc; i++) {
        std::cout << "Argumento " << i << ": " << argv[i] << "\n";
    }
}

// Ejercicio 0x267: Variable Scoping
void ejercicio0x267() {
    std::cout << "Ejercicio 0x267: Variable Scoping\n";

    int x = 10;

    if (true) {
        int x = 20;
        std::cout << "Valor de x dentro del if: " << x << "\n";
    }

    std::cout << "Valor de x fuera del if: " << x << "\n";
}

int main(int argc, char* argv[]) {
    int opcion;

    do {
        std::cout << "Seleccione el ejercicio que desea ejecutar:\n";
        std::cout << "1. Ejercicio 0x261: Strings\n";
        std::cout << "2. Ejercicio 0x262: Signed, Unsigned, Long, and Short\n";
        std::cout << "3. Ejercicio 0x263: Pointers\n";
        std::cout << "4. Ejercicio 0x264: Format Strings\n";
        std::cout << "5. Ejercicio 0x265: Typecasting\n";
        std::cout << "6. Ejercicio 0x266: Command-Line Arguments\n";
        std::cout << "7. Ejercicio 0x267: Variable Scoping\n";
        std::cout << "8. Salir\n";
        std::cout << "Opción: ";
        std::cin >> opcion;

        if (std::cin.fail() || opcion < 1 || opcion > 8) {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            std::cout << "Opción no válida, por favor intente de nuevo.\n";
            continue;
        }

        switch (opcion) {
        case 1:
            ejercicio0x261();
            break;
        case 2:
            ejercicio0x262();
            break;
        case 3:
            ejercicio0x263();
            break;
        case 4:
            ejercicio0x264();
            break;
        case 5:
            ejercicio0x265();
            break;
        case 6:
            ejercicio0x266(argc, argv);
            break;
        case 7:
            ejercicio0x267();
            break;
        case 8:
            std::cout << "Saliendo...\n";
            break;
        }
    } while (opcion != 8);

    return 0;
}
