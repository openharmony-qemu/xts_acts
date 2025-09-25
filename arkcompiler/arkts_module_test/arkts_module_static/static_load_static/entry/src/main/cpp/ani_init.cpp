#include "ani/ani.h"
#include <array>
#include <iostream>

static ani_int add([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_int arg1, ani_int arg2){
    return arg1 + arg2;
}
static ani_string addString([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_string arg1){
    return arg1;
}
static ani_double addDouble([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_double arg1, ani_double arg2){
    return arg1 + arg2;
}
static ani_double addNumber([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_double arg1, ani_double arg2){
    return arg1 + arg2;
}

static ani_status bindCase(ani_vm *vm, const char *clsName) {
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return (ani_status)9;
    }

    ani_class cls {};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return (ani_status)2;
    }
    //    ani_module *result;
//    const char *module_descriptor="entry/src/main/ets/pages/add";
//    if (ANI_OK != env->FindModule(module_descriptor, result)){
//        std::cerr << "Not found '" << clsName << "'" << std::endl;
//        return (ani_status)2;
//    }
    
//    const char *testSignature = "II:I";
    std::array methods = {
        ani_native_function {"add", "II:I", reinterpret_cast<void *>(add)},
        ani_native_function {"addString", "C{std.core.String}:C{std.core.String}", reinterpret_cast<void *>(addString)},
        ani_native_function {"addDouble", "dd:d", reinterpret_cast<void *>(addDouble)},
        ani_native_function {"addNumber", "dd:d", reinterpret_cast<void *>(addNumber)},
    };

    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return (ani_status)3;
    };
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result) {
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    bindCase(vm, "Lentry/src/main/ets/pages/Add/Calc;");
    *result = ANI_VERSION_1;
    return ANI_OK;
}