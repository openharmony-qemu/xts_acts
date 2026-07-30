#include <stdio.h>
#include <dlfcn.h>
void SayHello()
{
    printf("hello world!\n");
}

void* CallDlopen(const char* name)
{
    return dlopen(name, RTLD_NOW);
}