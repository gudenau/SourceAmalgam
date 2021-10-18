/* \u002A\u002F
public class Test{
    public static void main(String[] args){
        System.out.println("This is from Java code!");
    }
}
// */ // \u000A\u002F\u002A
/**\
/

#ifdef __cplusplus

#include <iostream>

int main(int argc, char** argv){
    (void)argc;
    (void)argv;
    std::cout << "This is from C++ code!\n";
    return 0;
}

#else

#include <stdio.h>

int main(int argc, char** argv){
    (void)argc;
    (void)argv;
    printf("This is from C code!\n");
    return 0;
}

#endif

// \u000A */
// \u000A \u002F\u002A
// \
object Test{ // \
    def main(args: Array[String]) = { // \
        println("This is from Scala code!") // \
    } // \
}
// \u000A \u002A\u002F
