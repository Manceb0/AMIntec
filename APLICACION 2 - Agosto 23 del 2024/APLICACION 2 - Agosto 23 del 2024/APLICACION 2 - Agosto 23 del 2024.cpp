#include <iostream>
#include <fstream>
#include <cstdlib>   // Para rand() y srand()
#include <ctime>     // Para time()
#include <sys/stat.h> // Para chmod
#include <unistd.h>  // Para getuid y getgid en sistemas Unix/Linux

// Ejercicio 0x270: Memory Segmentation
void ejercicio0x270() {
    std::cout << "Ejercicio 0x270: Memory Segmentation\n";

    int localVariable = 10; // Variable en la pila
    int* heapVariable = (int*)malloc(sizeof(int)); // Variable en el heap
    *heapVariable = 20;

    std::cout << "Valor de la variable local (pila): " << localVariable << "\n";
    std::cout << "Valor de la variable en el heap: " << *heapVariable << "\n";

    free(heapVariable); // Liberar memoria en el heap
}

// Ejercicio 0x281: File Access
void ejercicio0x281() {
    std::cout << "Ejercicio 0x281: File Access\n";

    std::ofstream outFile("output.txt");
    outFile << "Este es un ejemplo de escritura en un archivo.\n";
    outFile.close();

    std::ifstream inFile("output.txt");
    std::string line;
    while (std::getline(inFile, line)) {
        std::cout << line << "\n";
    }
    inFile.close();
}

// Ejercicio 0x282: File Permissions
void ejercicio0x282() {
    std::cout << "Ejercicio 0x282: File Permissions\n";

    const char* filename = "output.txt";

    // Cambiar permisos del archivo
    if (chmod(filename, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH) == 0) {
        std::cout << "Permisos cambiados correctamente para " << filename << "\n";
    }
    else {
        std::cerr << "Error al cambiar permisos de " << filename << "\n";
    }
}

// Ejercicio 0x283: User IDs
void ejercicio0x283() {
    std::cout << "Ejercicio 0x283: User IDs\n";

    uid_t uid = getuid();
    gid_t gid = getgid();

    std::cout << "User ID: " << uid << "\n";
    std::cout << "Group ID: " << gid << "\n";
}

// Ejercicio 0x286: Pseudo-random Numbers
void ejercicio0x286() {
    std::cout << "Ejercicio 0x286: Pseudo-random Numbers\n";

    srand(time(0)); // Semilla para números aleatorios

    for (int i = 0; i < 5; ++i) {
        std::cout << "Número pseudoaleatorio " << i + 1 << ": " << rand() << "\n";
    }
}

int main() {
    int opcion;

    do {
        std::cout << "Seleccione el ejercicio que desea ejecutar:\n";
        std::cout << "1. Ejercicio 0x270: Memory Segmentation\n";
        std::cout << "2. Ejercicio 0x281: File Access\n";
        std::cout << "3. Ejercicio 0x282: File Permissions\n";
        std::cout << "4. Ejercicio 0x283: User IDs\n";
        std::cout << "5. Ejercicio 0x286: Pseudo-random Numbers\n";
        std::cout << "6. Salir\n";
        std::cout << "Opción: ";
        std::cin >> opcion;

        switch (opcion) {
        case 1:
            ejercicio0x270();
            break;
        case 2:
            ejercicio0x281();
            break;
        case 3:
            ejercicio0x282();
            break;
        case 4:
            ejercicio0x283();
            break;
        case 5:
            ejercicio0x286();
            break;
        case 6:
            std::cout << "Saliendo...\n";
            break;
        default:
            std::cout << "Opción no válida, por favor intente de nuevo.\n";
        }
    } while (opcion != 6);

    return 0;
}
