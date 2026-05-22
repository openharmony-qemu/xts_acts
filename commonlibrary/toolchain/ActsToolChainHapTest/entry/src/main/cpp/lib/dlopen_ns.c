#include <dlfcn.h>
#include <stdio.h>
#include <string.h>
#include "test.h"

#define SO_HAS_DEPENDENCES "libdlopen_so_dep_dlopen_ns_dso.so"
const char* DLL_NAME = "libdlopen_ns_dso.so";
const char* DLL_NAME2 = "libdlopen_dso.so";
const char* ERR_PATH_NS = "/src/common";
const char* NDK_SO = "libdlopen_ns_dso_ndk.so";
const char* SYSTEM_SO = "libdlopen_ns_dso_sys.so";
typedef void*(*CALL_DLOPEN_PTR)(const char *);

// Test whether it is ok for main to dlopen ndk so.
void MainDlopenNdkSo()
{
    void *handle = dlopen(NDK_SO, RTLD_NOW);
    if (!handle) {
        t_error("main dlopen ndk so %s failed: %s\n", NDK_SO, dlerror());
    }
    if (dlclose(handle)) {
        t_error("dlclose %s failed : %s \n", NDK_SO, dlerror());
    }
}

// Test whether it is ok for system so to dlopen ndk so.
void SystemSoDlopenNdkSo()
{
    void *handle = dlopen(SYSTEM_SO, RTLD_NOW);
    if (!handle) {
        t_error("dlopen %s failed : %s \n", SYSTEM_SO, dlerror());
    }
    CALL_DLOPEN_PTR callDlopen = dlsym(handle, "call_dlopen");
    if (!callDlopen) {
        t_error("dlsym %s failed : %s \n", "call_dlopen", dlerror());
    }
    void *res = callDlopen(NDK_SO);
    if (!res) {
        t_error("default ns so(%s) can't dlopen ndk so(%s)", SYSTEM_SO, NDK_SO);
    }
}

// Test whether it is ok for ndk so to dlopen system so.
void NdkSoDlopenDefaultNsSo()
{
    Dl_namespace dlns;
    dlns_init(&dlns, "ndk");
    void *handle = dlopen_ns(&dlns, NDK_SO, RTLD_NOW);
    if (!handle) {
        t_error("dlopen_ns(ns=%s, so=%s) failed : %s \n", "ndk", NDK_SO, dlerror());
    }
    CALL_DLOPEN_PTR callDlopen = dlsym(handle, "call_dlopen");
    if (!callDlopen) {
        t_error("dlsym %s failed : %s \n", "call_dlopen", dlerror());
    }
    void *res = callDlopen(SYSTEM_SO);
    if (!res) {
        t_error("ndk so(%s) can't dlopen system so(%s)", NDK_SO, SYSTEM_SO);
    }
}

// Test whether dlopen same so twice by same ns to get same handle.
void DlopenSameSoTwiceBySameNs(char * dllPathNs)
{
    Dl_namespace dlns1;
    dlns_init(&dlns1, "ns_for_dlopen_same_so_twice_by_same_ns");
    dlns_create(&dlns1, dllPathNs);

    void* handle1 = dlopen_ns(&dlns1, DLL_NAME, RTLD_NOW);
    if (!handle1) {
        t_error("dlopen_ns(ns=%s, name=%s) failed : %s \n", dlns1.name, DLL_NAME, dlerror());
    }

    void* handle2 = dlopen_ns(&dlns1, DLL_NAME, RTLD_NOW);
    if (!handle2) {
        t_error("dlopen_ns(ns=%s, name=%s) failed : %s \n", dlns1.name, DLL_NAME, dlerror());
    }

    if (handle1 != handle2) {
        t_error("dlopen same so(%s) by same ns but handle is different %s \n", DLL_NAME);
    }

    if (dlclose(handle1)) {
        t_error("dlclose %s failed : %s \n", DLL_NAME, dlerror());
    }

    if (dlclose(handle2)) {
        t_error("dlclose %s failed : %s \n", DLL_NAME, dlerror());
    }
}

// Test whether dlopen same so by different ns to get different handle.
void DlopenSameSoByDifferentNs(char * dllPathNs)
{
    Dl_namespace dlns1;
    dlns_init(&dlns1, "ns_for_dlopen_same_so_by_different_ns_1");
    dlns_create(&dlns1, dllPathNs);

    Dl_namespace dlns2;
    dlns_init(&dlns2, "ns_for_dlopen_same_so_by_different_ns_2");
    dlns_create(&dlns2, dllPathNs);

    void* handle1 = dlopen_ns(&dlns1, DLL_NAME, RTLD_NOW);
    if (!handle1) {
        t_error("dlopen_ns(ns=%s, name=%s) failed : %s \n", dlns1.name, DLL_NAME, dlerror());
    }

    void* handle2 = dlopen_ns(&dlns2, DLL_NAME, RTLD_NOW);
    if (!handle2) {
        t_error("dlopen_ns(ns=%s, name=%s) failed : %s \n", dlns2.name, DLL_NAME, dlerror());
    }

    if (handle1 == handle2) {
        t_error("dlopen same so(%s) by same ns but handle is different %s \n", DLL_NAME);
    }

    if (dlclose(handle1)) {
        t_error("dlclose %s failed : %s \n", DLL_NAME, dlerror());
    }

    if (dlclose(handle2)) {
        t_error("dlclose %s failed : %s \n", DLL_NAME, dlerror());
    }
}

// Test whether dlopen same so by inherit ns to get same handle.
void DlopenSameSoByDifferentInheritNs(char * dllPathNs)
{
    Dl_namespace dlns1;
    dlns_init(&dlns1, "ns_for_dlopen_same_so_by_different_inherit_ns_1");
    dlns_create(&dlns1, dllPathNs);

    Dl_namespace dlns2;
    dlns_init(&dlns2, "ns_for_dlopen_same_so_by_different_inherit_ns_2");
    dlns_create2(&dlns2, ERR_PATH_NS, 0);
    dlns_inherit(&dlns2, &dlns1, DLL_NAME);

    void* handle1 = dlopen_ns(&dlns1, DLL_NAME, RTLD_NOW);
    if (!handle1) {
        t_error("dlopen_ns(ns=%s, name=%s) failed : %s \n", dlns1.name, DLL_NAME, dlerror());
    }

    void* handle2 = dlopen_ns(&dlns2, DLL_NAME, RTLD_NOW);
    if (!handle2) {
        t_error("dlopen_ns(ns=%s, name=%s) failed : %s \n", dlns2.name, DLL_NAME, dlerror());
    }

    if (handle1 != handle2) {
        t_error("dlopen same so(%s) by inherit ns but handle is different %s \n", DLL_NAME);
    }

    if (dlclose(handle1)) {
        t_error("dlclose %s failed : %s \n", DLL_NAME, dlerror());
    }

    if (dlclose(handle2)) {
        t_error("dlclose %s failed : %s \n", DLL_NAME, dlerror());
    }
}

void DlopenSeperated(char * dllPathNs)
{
    Dl_namespace dlns_default;
    dlns_get(NULL, &dlns_default);
    Dl_namespace dlns1;
    dlns_init(&dlns1, "ns_for_no_seperated");
    dlns_create2(&dlns1, ERR_PATH_NS, 0);
    dlns_inherit(&dlns1, &dlns_default, "libc++.so");
    void* handle = NULL;
    // current ns can't load this so.
    handle = dlopen_ns(&dlns1, DLL_NAME, RTLD_NOW);
    if (handle) {
        t_error("dlopen_ns(ns=%s, name=%s) failed : %s \n", dlns1.name, DLL_NAME, dlerror());
    }

    // current ns can load the so by absolute path.
    char absolutePath1[512];
    snprintf(absolutePath1, sizeof(absolutePath1), "%s/%s", dllPathNs, DLL_NAME);
    handle = dlopen_ns(&dlns1, absolutePath1, RTLD_NOW);
    if (!handle) {
        t_error("%s can load %s by absolute path but failed : %s \n", dlns1.name, absolutePath1, dlerror());
    }

    if (dlclose(handle)) {
        t_error("dlclose %s failed : %s \n", absolutePath1, dlerror());
    }

    // current ns can't load the so by absolute path if it has inaccessible dependent so.
    char absolutePath2[512];
    snprintf(absolutePath2, sizeof(absolutePath2), "%s/%s", dllPathNs,
             SO_HAS_DEPENDENCES);
    handle = dlopen_ns(&dlns1, absolutePath2, RTLD_NOW);
    if (handle) {
        t_error("%s can't load %s by absolute path because but it has inaccessible " \
                "dependent so but succeed : %s \n", dlns1.name, absolutePath2, dlerror());
    }
}

void DlopenInherit(char* dllPathNs)
{
    Dl_namespace dlns_default;
    dlns_get(NULL, &dlns_default);
    Dl_namespace inherit_A;
    Dl_namespace inherit_B;
    dlns_init(&inherit_A, "inherir_error_lib_A");
    dlns_init(&inherit_B, "inherir_error_lib_B");
    dlns_create2(&inherit_A, NULL, 0);
    dlns_create2(&inherit_B, dllPathNs, 0);
    dlns_inherit(&inherit_B, &dlns_default, "libc++.so");

    // inherit_A can't load the so because search path is NULL.
    void* handle1 = dlopen_ns(&inherit_A, DLL_NAME, RTLD_LAZY);
    if (handle1) {
        t_error("dlopen_ns_by_ini_no_inherit handle %s should not open successfully \n", DLL_NAME);
        dlclose(handle1);
    }

    // inherit_A can load the so by inherit_B.
    dlns_inherit(&inherit_A, &inherit_B, DLL_NAME);
    void* handle2 = dlopen_ns(&inherit_A, DLL_NAME, RTLD_LAZY);
    if (!handle2) {
        t_error("dlopen_ns_by_dlns_inherir handle get error %s open failed : %s \n", DLL_NAME, dlerror());
    }

    if (dlclose(handle2)) {
        t_error("dlclose_by_dlns_inherir handle %s close failed : %s\n", DLL_NAME, dlerror());
    }

    // inherit_A can't load the so by inherit ns if the so isn't in shared libs.
    dlns_inherit(&inherit_A, &inherit_B, DLL_NAME2);
    void* handle3 = dlopen_ns(&inherit_A, DLL_NAME, RTLD_LAZY);
    if (handle3) {
        t_error("dlopen_ns_by_ini_no_inherit handle2 %s should not open successfully \n", DLL_NAME);
        dlclose(handle3);
    }
}

void DlopenInheritCheckCanPass(char* dllPathNs)
{
    Dl_namespace dlns_default;
    dlns_get(NULL, &dlns_default);
    Dl_namespace transitivity_A;
    Dl_namespace transitivity_B;
    Dl_namespace transitivity_C;
    dlns_init(&transitivity_A, "transitivity_A");
    dlns_init(&transitivity_B, "transitivity_B");
    dlns_init(&transitivity_C, "transitivity_C");
    dlns_create2(&transitivity_A, NULL, 0);
    dlns_create2(&transitivity_B, NULL, 0);
    dlns_create2(&transitivity_C, dllPathNs, 0);
    dlns_inherit(&transitivity_A, &transitivity_B, NULL);
    dlns_inherit(&transitivity_B, &transitivity_C, DLL_NAME);
    dlns_inherit(&transitivity_C, &dlns_default, "libc++.so");

    void* handleB = dlopen_ns(&transitivity_B, DLL_NAME, RTLD_LAZY);
    if (!handleB) {
        t_error("dlopen_ns_by_inherit_transitivity handleB get error %s open failed : %s \n", DLL_NAME, dlerror());
    }

    void* handleC = dlopen_ns(&transitivity_C, DLL_NAME, RTLD_LAZY);
    if (!handleC) {
        t_error("dlopen_ns_by_inherit_transitivity handleC get error %s open failed : %s \n", DLL_NAME, dlerror());
    }

    if (dlclose(handleC)) {
        t_error("dlclose_by_inherit_transitivity handleC %s close failed : %s\n", DLL_NAME, dlerror());
    }
    if (dlclose(handleB)) {
        t_error("dlclose_by_inherit_transitivity handleB %s close failed : %s\n", DLL_NAME, dlerror());
    }

    // transitivity_A can't load so because inherit can't pass.
    void* handleA = dlopen_ns(&transitivity_A, DLL_NAME, RTLD_LAZY);
    if (handleA) {
        t_error("dlopen_ns_by_inherit_transitivity handleA %s should not open successfully \n", DLL_NAME);
        dlclose(handleA);
    }
}

void DlopenTestDlnsCreate2()
{
    Dl_namespace dlns;
    dlns_init(&dlns, "ns_for_create2");
    // ns_for_create2 doesn't exist, it will use default ns to search so.
    void* handle = dlopen_ns(&dlns, DLL_NAME, RTLD_LAZY);
    if (!handle) {
        t_error("dlopen_ns %s use a non-existent ns failed: %s\n", DLL_NAME, dlerror());
    }

    if (dlclose(handle)) {
        t_error("dlclose %s failed : %s \n", DLL_NAME, dlerror());
    }

    // 0: ns_for_create2 doesn't inherit default ns.
    dlns_create2(&dlns, ERR_PATH_NS, 0);
    void* handle2 = dlopen_ns(&dlns, DLL_NAME, RTLD_LAZY);
    if (handle2) {
        t_error("%s namespace can't see %s but dlopen succee.\n", "ns_for_create2", DLL_NAME);
    }
}

int main(int argc, char *argv[])
{
    char buf[512];
    char path[512];
    char* i;
    //带so的路径
    if (!t_pathrel(buf, sizeof buf, argv[0], "libdlopen_ns_dso.so")) {
        t_error("failed to obtain relative path to libdlopen_ns_dso.so\n");
        return 1;
    }
    //包含so的路径
    if (!t_pathrel(path, sizeof path, argv[0], "")) {
        t_error("failed to obtain relative path to path\n");
        return 1;
    }
    path[strlen(path) - 1] = '\0';
    MainDlopenNdkSo();
    SystemSoDlopenNdkSo();
    NdkSoDlopenDefaultNsSo();
    DlopenSameSoTwiceBySameNs(path);
    DlopenSameSoByDifferentNs(path);
    DlopenSameSoByDifferentInheritNs(path);
    DlopenSeperated(path);
    DlopenTestDlnsCreate2();
    DlopenInherit(path);
    DlopenInheritCheckCanPass(path);

    return t_status;
}