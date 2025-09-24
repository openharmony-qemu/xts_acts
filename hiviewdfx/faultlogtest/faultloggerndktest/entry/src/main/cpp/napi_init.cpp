#include "napi/native_api.h"
#include <csignal>
#include <cstdlib>
#include <unistd.h>
#include <pthread.h>
#include <fcntl.h>
#include "stdlib.h"
#include "string.h"
#include <thread>
#include "malloc.h"
#include <hicollie/hicollie.h>
#include "uv.h"
#define LOG_TAG "DFX_TEST"
#define LOG_DOMAIN 1
#include "hilog/log.h"
#include <sys/wait.h>

static napi_value Add(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    pid_t pid = fork();
    if (pid < 0) {
        napi_get_boolean(env, false, &res);
    } else if (pid == 0) {
        napi_get_boolean(env, true, &res);
        raise(SIGABRT);  
    } else {
        int status;
        pid_t child_pid = waitpid(pid, &status, 0);
        if (child_pid > 0) {
            bool child_success = WIFEXITED(status) && WEXITSTATUS(status) == 0;
            napi_get_boolean(env, child_success, &res);
        } else {
            napi_get_boolean(env, false, &res);
        }
    }
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
