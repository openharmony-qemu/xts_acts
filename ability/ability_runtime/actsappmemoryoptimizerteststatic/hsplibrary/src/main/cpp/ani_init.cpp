#include "ani/ani.h"
#include <array>
#include <iostream>
#define ANI_UNSUPPORTED_VERSION  (ani_status)9
#define ANI_CLASS_NOT_FOUND      (ani_status)2
#define ANI_BIND_FAILED          (ani_status)3

static ani_int add([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_int arg1, ani_int arg2)
{
    return arg1 + arg2;
}
static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return ANI_UNSUPPORTED_VERSION;
    }

    ani_class cls {};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return ANI_CLASS_NOT_FOUND;
    }

    const char *testSignature = "II:I";
    std::array methods = {
        ani_native_function {"add", testSignature, reinterpret_cast<void *>(add)},
    };

    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return ANI_BIND_FAILED;
    };
    return ANI_OK;
}


ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "hsplibrary.src.main.ets.pages.Index.Calc");
    *result = ANI_VERSION_1;
    return ANI_OK;
}