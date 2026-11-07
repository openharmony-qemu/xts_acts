/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <atomic>
#include <cerrno>
#include <climits>
#include <cstdio>
#include <cstring>
#include <cstdint>
#include <dirent.h>
#include <dlfcn.h>
#include <fcntl.h>
#include <pthread.h>
#include <semaphore.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <securec.h>

#define RACE_WORKERS 8
#define LOOP_COUNT_100 100
#define LOOP_COUNT_1000 1000
#define SHM_VALUE_0XABC123 0xABC123U
#define SHM_VALUE_0X12345678 0x12345678U
#define PROT_RW (PROT_READ | PROT_WRITE)
#define GROUP_PATH_PREFIX "/dev/group/shm/%u"
#define MODE_0600 0600
#define MODE_0666 0666
#define MODE_0640 0640
#define MODE_0000 0000
#define MODE_0777 0777
#define MODE_07777 07777
#define UMASK_0027 0027
#define TEST_VAL_11 11
#define TEST_VAL_22 22
#define TEST_VAL_33 33
#define TMP_PREFIX_LEN 4
#define NAME_BUF_SIZE 32
#define GROUP_IPC_STEP 100
#define PATH_MAX_LEN 128

typedef int (*GroupShmOpenFn)(const char *, int, mode_t, gid_t);
typedef int (*GroupShmUnlinkFn)(const char *, gid_t);
typedef sem_t *(*GroupSemOpenFn)(const char *, int, gid_t, ...);
typedef int (*GroupSemUnlinkFn)(const char *, gid_t);

static struct {
    GroupShmOpenFn shm_open;
    GroupShmUnlinkFn shm_unlink;
    GroupSemOpenFn sem_open;
    GroupSemUnlinkFn sem_unlink;
    int loaded;
} g_fn;

static gid_t g_appGid;
static int g_dirReady = -1;
static char g_overlong[NAME_MAX + 2];

static void LoadFunctions(void)
{
    if (g_fn.loaded) {
        return;
    }
    g_fn.shm_open = reinterpret_cast<GroupShmOpenFn>(dlsym(RTLD_DEFAULT, "group_shm_open"));
    g_fn.shm_unlink = reinterpret_cast<GroupShmUnlinkFn>(dlsym(RTLD_DEFAULT, "group_shm_unlink"));
    g_fn.sem_open = reinterpret_cast<GroupSemOpenFn>(dlsym(RTLD_DEFAULT, "group_sem_open"));
    g_fn.sem_unlink = reinterpret_cast<GroupSemUnlinkFn>(dlsym(RTLD_DEFAULT, "group_sem_unlink"));
    g_fn.loaded = (g_fn.shm_open != nullptr && g_fn.shm_unlink != nullptr &&
                  g_fn.sem_open != nullptr && g_fn.sem_unlink != nullptr) ? 1 : 0;
    g_appGid = getegid();
    if (memset_s(g_overlong, sizeof(g_overlong), 'x', NAME_MAX + 1) != EOK) {
        return;
    }
    g_overlong[NAME_MAX + 1] = '\0';
}

static napi_value AvailGuard(napi_env env)
{
    LoadFunctions();
    if (!g_fn.loaded) {
        napi_value r = nullptr;
        napi_create_int32(env, 0, &r);
        return r;
    }
    return nullptr;
}

static int PrepareDir(void)
{
    if (g_dirReady != -1) {
        return g_dirReady;
    }
    char path[PATH_MAX_LEN] = {0};
    (void)snprintf_s(path, sizeof(path), sizeof(path) - 1, GROUP_PATH_PREFIX, static_cast<unsigned>(g_appGid));
    if (mkdir(path, MODE_0777) != 0 && errno != EEXIST) {
        g_dirReady = 0;
        return 0;
    }
    g_dirReady = 1;
    return 1;
}

static napi_value DirGuard(napi_env env)
{
    if (!PrepareDir()) {
        napi_value r = nullptr;
        napi_create_int32(env, 0, &r);
        return r;
    }
    return nullptr;
}

static napi_value RetVal(napi_env env, int val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static int ShmCleanup(const char *name)
{
    errno = 0;
    return g_fn.shm_unlink(name, g_appGid);
}

static int SemCleanup(const char *name)
{
    errno = 0;
    return g_fn.sem_unlink(name, g_appGid);
}

static int ShmOpenInvalid(const char *name)
{
    errno = 0;
    int fd = g_fn.shm_open(name, O_RDWR, 0, g_appGid);
    return (fd == -1 && errno == EINVAL) ? 0 : 1;
}

static int ShmUnlinkInvalid(const char *name)
{
    errno = 0;
    return (g_fn.shm_unlink(name, g_appGid) == -1 && errno == EINVAL) ? 0 : 1;
}

static int SemOpenInvalid(const char *name)
{
    errno = 0;
    return (g_fn.sem_open(name, 0, g_appGid, 0, 0) == SEM_FAILED && errno == EINVAL) ? 0 : 1;
}

static int SemUnlinkInvalid(const char *name)
{
    errno = 0;
    return (g_fn.sem_unlink(name, g_appGid) == -1 && errno == EINVAL) ? 0 : 1;
}

static int CountTmpFiles(gid_t gid)
{
    char path[PATH_MAX_LEN] = {0};
    (void)snprintf_s(path, sizeof(path), sizeof(path) - 1, GROUP_PATH_PREFIX, static_cast<unsigned>(gid));
    DIR *d = opendir(path);
    if (d == nullptr) {
        return (errno == ENOENT) ? 0 : -1;
    }
    int count = 0;
    struct dirent *entry = nullptr;
    while ((entry = readdir(d)) != nullptr) {
        if (strncmp(entry->d_name, "tmp-", TMP_PREFIX_LEN) == 0) {
            count++;
        }
    }
    (void)closedir(d);
    return count;
}

struct ShmReadArg {
    const char *name;
    gid_t gid;
    uint32_t expect;
    int ok;
};

static void *ShmReadThr(void *p)
{
    ShmReadArg *arg = static_cast<ShmReadArg *>(p);
    int fd = g_fn.shm_open(arg->name, O_RDWR, 0, arg->gid);
    if (fd < 0) {
        arg->ok = 0;
        return nullptr;
    }
    uint32_t *m = static_cast<uint32_t *>(mmap(nullptr, sizeof(uint32_t), PROT_READ, MAP_SHARED, fd, 0));
    if (m == MAP_FAILED) {
        (void)close(fd);
        arg->ok = 0;
        return nullptr;
    }
    arg->ok = (*m == arg->expect) ? 1 : 0;
    (void)munmap(m, sizeof(uint32_t));
    (void)close(fd);
    return nullptr;
}

struct ShmRaceArg {
    const char *name;
    gid_t gid;
    std::atomic_int *succ;
    std::atomic_int *eexist;
};

static void *ShmRaceThr(void *p)
{
    ShmRaceArg *arg = static_cast<ShmRaceArg *>(p);
    errno = 0;
    int fd = g_fn.shm_open(arg->name, O_CREAT | O_EXCL | O_RDWR, MODE_0600, arg->gid);
    if (fd >= 0) {
        arg->succ->fetch_add(1);
        (void)close(fd);
    } else if (errno == EEXIST) {
        arg->eexist->fetch_add(1);
    }
    return nullptr;
}

struct SemReadArg {
    const char *name;
    gid_t gid;
    int expect;
    std::atomic_int *okcnt;
};

static void *SemReadThr(void *p)
{
    SemReadArg *arg = static_cast<SemReadArg *>(p);
    sem_t *s = g_fn.sem_open(arg->name, 0, arg->gid, 0, 0);
    if (s == SEM_FAILED) {
        return nullptr;
    }
    int value = -1;
    if (sem_getvalue(s, &value) == 0 && value == arg->expect) {
        arg->okcnt->fetch_add(1);
    }
    (void)sem_close(s);
    return nullptr;
}

struct SemRaceArg {
    const char *name;
    gid_t gid;
    std::atomic_int *succ;
    std::atomic_int *eexist;
};

static void *SemRaceThr(void *p)
{
    SemRaceArg *arg = static_cast<SemRaceArg *>(p);
    errno = 0;
    sem_t *s = g_fn.sem_open(arg->name, O_CREAT | O_EXCL, arg->gid, MODE_0600, 1);
    if (s != SEM_FAILED) {
        arg->succ->fetch_add(1);
        (void)sem_close(s);
    } else if (errno == EEXIST) {
        arg->eexist->fetch_add(1);
    }
    return nullptr;
}

/* 0100-MODE_0600: group_shm_open invalid names -> EINVAL */
static napi_value GroupIpc_0100(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmOpenInvalid("/"), &r);
    return r;
}

static napi_value GroupIpc_0200(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmOpenInvalid(""), &r);
    return r;
}

static napi_value GroupIpc_0300(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmOpenInvalid("foo/bar"), &r);
    return r;
}

static napi_value GroupIpc_0400(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmOpenInvalid("foo/"), &r);
    return r;
}

static napi_value GroupIpc_0500(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmOpenInvalid("."), &r);
    return r;
}

static napi_value GroupIpc_0600(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmOpenInvalid(".."), &r);
    return r;
}

/* 0700-1200: group_shm_unlink invalid names -> EINVAL */
static napi_value GroupIpc_0700(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmUnlinkInvalid("/"), &r);
    return r;
}

static napi_value GroupIpc_0800(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmUnlinkInvalid(""), &r);
    return r;
}

static napi_value GroupIpc_0900(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmUnlinkInvalid("foo/bar"), &r);
    return r;
}

static napi_value GroupIpc_1000(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmUnlinkInvalid("foo/"), &r);
    return r;
}

static napi_value GroupIpc_1100(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmUnlinkInvalid("."), &r);
    return r;
}

static napi_value GroupIpc_1200(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ShmUnlinkInvalid(".."), &r);
    return r;
}

/* 1300-1800: group_sem_open invalid names -> EINVAL */
static napi_value GroupIpc_1300(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemOpenInvalid("/"), &r);
    return r;
}

static napi_value GroupIpc_1400(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemOpenInvalid(""), &r);
    return r;
}

static napi_value GroupIpc_1500(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemOpenInvalid("foo/bar"), &r);
    return r;
}

static napi_value GroupIpc_1600(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemOpenInvalid("foo/"), &r);
    return r;
}

static napi_value GroupIpc_1700(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemOpenInvalid("."), &r);
    return r;
}

static napi_value GroupIpc_1800(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemOpenInvalid(".."), &r);
    return r;
}

/* 1900-2400: group_sem_unlink invalid names -> EINVAL */
static napi_value GroupIpc_1900(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemUnlinkInvalid("/"), &r);
    return r;
}

static napi_value GroupIpc_2000(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemUnlinkInvalid(""), &r);
    return r;
}

static napi_value GroupIpc_2100(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemUnlinkInvalid("foo/bar"), &r);
    return r;
}

static napi_value GroupIpc_2200(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemUnlinkInvalid("foo/"), &r);
    return r;
}

static napi_value GroupIpc_2300(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemUnlinkInvalid("."), &r);
    return r;
}

static napi_value GroupIpc_2400(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value r = nullptr;
    napi_create_int32(env, SemUnlinkInvalid(".."), &r);
    return r;
}

/* 2500-2800: overlong name -> ENAMETOOLONG */
static napi_value GroupIpc_2500(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    int ok = (g_fn.shm_open(g_overlong, O_RDWR, 0, g_appGid) == -1 && errno == ENAMETOOLONG) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

static napi_value GroupIpc_2600(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    int ok = (g_fn.shm_unlink(g_overlong, g_appGid) == -1 && errno == ENAMETOOLONG) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

static napi_value GroupIpc_2700(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    int ok = (g_fn.sem_open(g_overlong, 0, g_appGid, 0, 0) == SEM_FAILED && errno == ENAMETOOLONG) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

static napi_value GroupIpc_2800(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    int ok = (g_fn.sem_unlink(g_overlong, g_appGid) == -1 && errno == ENAMETOOLONG) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 2900-3200: valid name, group dir absent -> ENOENT */
static napi_value GroupIpc_2900(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    int ok = (g_fn.shm_open("obj", O_RDWR, 0, g_appGid) == -1 && errno == ENOENT) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

static napi_value GroupIpc_3000(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    int ok = (g_fn.shm_unlink("obj", g_appGid) == -1 && errno == ENOENT) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

static napi_value GroupIpc_3100(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    int ok = (g_fn.sem_open("obj", 0, g_appGid, 0, 0) == SEM_FAILED && errno == ENOENT) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

static napi_value GroupIpc_3200(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    int ok = (g_fn.sem_unlink("obj", g_appGid) == -1 && errno == ENOENT) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 3300: group_sem_open value > SEM_VALUE_MAX -> EINVAL */
static napi_value GroupIpc_3300(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    errno = 0;
    sem_t *s = g_fn.sem_open("vmax", O_CREAT | O_EXCL, g_appGid, MODE_0600, static_cast<unsigned>(SEM_VALUE_MAX) + 1U);
    int ok = (s == SEM_FAILED && errno == EINVAL) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 3400: group_shm_open create success + O_CLOEXEC */
static napi_value GroupIpc_3400(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int fd = g_fn.shm_open("b1", O_CREAT | O_RDWR, MODE_0600, g_appGid);
    if (fd < 0) {
        return RetVal(env, 1);
    }
    int ok = (fcntl(fd, F_GETFD) & FD_CLOEXEC) ? 0 : 1;
    (void)close(fd);
    (void)ShmCleanup("b1");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 3500: group_shm_open reopen existing */
static napi_value GroupIpc_3500(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int fd1 = g_fn.shm_open("b2", O_CREAT | O_RDWR, MODE_0600, g_appGid);
    if (fd1 < 0) {
        return RetVal(env, 1);
    }
    (void)close(fd1);
    int fd2 = g_fn.shm_open("b2", O_RDWR, 0, g_appGid);
    int ok = (fd2 >= 0) ? 0 : 1;
    if (fd2 >= 0) {
        (void)close(fd2);
    }
    (void)ShmCleanup("b2");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 3600: group_shm_open O_CREAT|O_EXCL on existing -> EEXIST */
static napi_value GroupIpc_3600(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int fd = g_fn.shm_open("b3", O_CREAT | O_RDWR, MODE_0600, g_appGid);
    if (fd < 0) {
        return RetVal(env, 1);
    }
    (void)close(fd);
    errno = 0;
    int fd2 = g_fn.shm_open("b3", O_CREAT | O_EXCL | O_RDWR, MODE_0600, g_appGid);
    int ok = (fd2 == -1 && errno == EEXIST) ? 0 : 1;
    if (fd2 >= 0) {
        (void)close(fd2);
    }
    (void)ShmCleanup("b3");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 3700: group_shm_open denied group dir -> EACCES */
static napi_value GroupIpc_3700(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    char path[PATH_MAX_LEN] = {0};
    (void)snprintf_s(path, sizeof(path), sizeof(path) - 1, GROUP_PATH_PREFIX, static_cast<unsigned>(g_appGid));
    if (chmod(path, MODE_0000) != 0) {
        return RetVal(env, 1);
    }
    errno = 0;
    int fd = g_fn.shm_open("b4", O_CREAT | O_RDWR, MODE_0600, g_appGid);
    int ok = (fd == -1 && errno == EACCES) ? 0 : 1;
    if (fd >= 0) {
        (void)close(fd);
    }
    (void)chmod(path, MODE_0777);
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 3800: group_shm_unlink success, then open -> ENOENT */
static napi_value GroupIpc_3800(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int fd = g_fn.shm_open("b5", O_CREAT | O_RDWR, MODE_0600, g_appGid);
    if (fd < 0) {
        return RetVal(env, 1);
    }
    (void)close(fd);
    if (g_fn.shm_unlink("b5", g_appGid) != 0) {
        return RetVal(env, 1);
    }
    errno = 0;
    int ok = (g_fn.shm_open("b5", O_RDWR, 0, g_appGid) == -1 && errno == ENOENT) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 3900: group_shm_unlink missing object (dir exists) -> ENOENT */
static napi_value GroupIpc_3900(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    errno = 0;
    int ok = (g_fn.shm_unlink("b6", g_appGid) == -1 && errno == ENOENT) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 4000: group_sem_open create success */
static napi_value GroupIpc_4000(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    sem_t *s = g_fn.sem_open("n1", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    if (s == SEM_FAILED) {
        return RetVal(env, 1);
    }
    (void)sem_close(s);
    (void)SemCleanup("n1");
    return RetVal(env, 0);
}

/* 4100: group_sem_open value=0 success */
static napi_value GroupIpc_4100(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    sem_t *s = g_fn.sem_open("n2", O_CREAT | O_EXCL, g_appGid, MODE_0600, 0);
    if (s == SEM_FAILED) {
        return RetVal(env, 1);
    }
    (void)sem_close(s);
    (void)SemCleanup("n2");
    return RetVal(env, 0);
}

/* 4200: group_sem_open O_CREAT|O_EXCL on existing -> EEXIST */
static napi_value GroupIpc_4200(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    sem_t *s1 = g_fn.sem_open("n3", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    if (s1 == SEM_FAILED) {
        return RetVal(env, 1);
    }
    (void)sem_close(s1);
    errno = 0;
    sem_t *s2 = g_fn.sem_open("n3", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    int ok = (s2 == SEM_FAILED && errno == EEXIST) ? 0 : 1;
    if (s2 != SEM_FAILED) {
        (void)sem_close(s2);
    }
    (void)SemCleanup("n3");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 4300: group_sem_open inode dedup -> same mapping */
static napi_value GroupIpc_4300(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    sem_t *s1 = g_fn.sem_open("n4", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    if (s1 == SEM_FAILED) {
        return RetVal(env, 1);
    }
    sem_t *s2 = g_fn.sem_open("n4", 0, g_appGid, 0, 0);
    int ok = (s2 != SEM_FAILED && s2 == s1) ? 0 : 1;
    if (s2 != SEM_FAILED) {
        (void)sem_close(s2);
    }
    (void)sem_close(s1);
    (void)SemCleanup("n4");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 4400: group_sem_unlink success, then open -> ENOENT */
static napi_value GroupIpc_4400(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    sem_t *s = g_fn.sem_open("n5", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    if (s == SEM_FAILED) {
        return RetVal(env, 1);
    }
    (void)sem_close(s);
    if (g_fn.sem_unlink("n5", g_appGid) != 0) {
        return RetVal(env, 1);
    }
    errno = 0;
    int ok = (g_fn.sem_open("n5", 0, g_appGid, 0, 0) == SEM_FAILED && errno == ENOENT) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 4500: group_sem_open oflag bitmask (O_RDWR discarded) */
static napi_value GroupIpc_4500(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    sem_t *s = g_fn.sem_open("n6", O_RDWR | O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    int ok = (s != SEM_FAILED) ? 0 : 1;
    if (s != SEM_FAILED) {
        (void)sem_close(s);
    }
    (void)SemCleanup("n6");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 4600 helper: shm unlink lifetime test logic */
static int ShmUnlinkLifetimeCheck(void)
{
    int ok = 1;
    int fd = -1;
    int nfd = -1;
    uint32_t *m = static_cast<uint32_t *>(MAP_FAILED);
    uint32_t *nm = static_cast<uint32_t *>(MAP_FAILED);
    do {
        fd = g_fn.shm_open("u1", O_CREAT | O_EXCL | O_RDWR, MODE_0600, g_appGid);
        if (fd < 0 || ftruncate(fd, sizeof(uint32_t)) != 0) {
            break;
        }
        m = static_cast<uint32_t *>(mmap(nullptr, sizeof(uint32_t), PROT_RW, MAP_SHARED, fd, 0));
        if (m == MAP_FAILED) {
            break;
        }
        *m = TEST_VAL_11;
        if (g_fn.shm_unlink("u1", g_appGid) != 0) {
            break;
        }
        errno = 0;
        if (g_fn.shm_open("u1", O_RDWR, 0, g_appGid) != -1 || errno != ENOENT) {
            break;
        }
        *m = TEST_VAL_22;
        if (*m != TEST_VAL_22) {
            break;
        }
        nfd = g_fn.shm_open("u1", O_CREAT | O_EXCL | O_RDWR, MODE_0600, g_appGid);
        if (nfd < 0 || ftruncate(nfd, sizeof(uint32_t)) != 0) {
            break;
        }
        nm = static_cast<uint32_t *>(mmap(nullptr, sizeof(uint32_t), PROT_RW, MAP_SHARED, nfd, 0));
        if (nm == MAP_FAILED) {
            break;
        }
        *nm = TEST_VAL_33;
        ok = (*nm == TEST_VAL_33 && *m == TEST_VAL_22) ? 0 : 1;
    } while (0);
    if (nm != MAP_FAILED) { (void)munmap(nm, sizeof(uint32_t)); }
    if (m != MAP_FAILED) { (void)munmap(m, sizeof(uint32_t)); }
    if (nfd >= 0) { (void)close(nfd); }
    if (fd >= 0) { (void)close(fd); }
    (void)ShmCleanup("u1");
    return ok;
}

/* 4600: group_shm unlink lifetime - mapping valid after unlink; recreate isolated */
static napi_value GroupIpc_4600(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    return RetVal(env, ShmUnlinkLifetimeCheck());
}

/* 4700: group_shm truncate + readonly reopen */
/* 4700 helper: write data then readonly read back */
static int ShmWriteAndReadonlyCheck(int *fdOut, int *roOut, uint32_t **mOut, uint32_t **rmOut)
{
    *fdOut = g_fn.shm_open("t1", O_CREAT | O_EXCL | O_RDWR, MODE_0600, g_appGid);
    if (*fdOut < 0 || ftruncate(*fdOut, sizeof(uint32_t)) != 0) {
        return 1;
    }
    *mOut = static_cast<uint32_t *>(mmap(nullptr, sizeof(uint32_t), PROT_RW, MAP_SHARED, *fdOut, 0));
    if (*mOut == MAP_FAILED) {
        return 1;
    }
    **mOut = SHM_VALUE_0X12345678;
    (void)munmap(*mOut, sizeof(uint32_t));
    *mOut = static_cast<uint32_t *>(MAP_FAILED);
    (void)close(*fdOut);
    *fdOut = -1;
    *roOut = g_fn.shm_open("t1", O_RDONLY, 0, g_appGid);
    if (*roOut < 0) {
        return 1;
    }
    *rmOut = static_cast<uint32_t *>(mmap(nullptr, sizeof(uint32_t), PROT_READ, MAP_SHARED, *roOut, 0));
    if (*rmOut == MAP_FAILED) {
        return 1;
    }
    return (**rmOut == SHM_VALUE_0X12345678) ? 0 : 1;
}

/* 4700: group_shm truncate + readonly reopen */
static napi_value GroupIpc_4700(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 1;
    int fd = -1;
    int ro = -1;
    int tf = -1;
    uint32_t *m = static_cast<uint32_t *>(MAP_FAILED);
    uint32_t *rm = static_cast<uint32_t *>(MAP_FAILED);
    ok = ShmWriteAndReadonlyCheck(&fd, &ro, &m, &rm);
    if (rm != MAP_FAILED) {
        (void)munmap(rm, sizeof(uint32_t));
    }
    if (m != MAP_FAILED) {
        (void)munmap(m, sizeof(uint32_t));
    }
    tf = g_fn.shm_open("t1", O_RDWR | O_TRUNC, 0, g_appGid);
    if (tf >= 0) {
        struct stat st;
        if (fstat(tf, &st) != 0 || st.st_size != 0) {
            ok = 1;
        }
        (void)close(tf);
    } else {
        ok = 1;
    }
    if (ro >= 0) {
        (void)close(ro);
    }
    if (fd >= 0) {
        (void)close(fd);
    }
    (void)ShmCleanup("t1");
    return RetVal(env, ok);
}

/* 4800: group_sem unlink lifetime - handle valid after unlink; recreate independent */
static napi_value GroupIpc_4800(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 1;
    sem_t *s = SEM_FAILED;
    sem_t *n = SEM_FAILED;
    do {
        s = g_fn.sem_open("p1", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
        if (s == SEM_FAILED) {
            break;
        }
        if (g_fn.sem_unlink("p1", g_appGid) != 0) {
            break;
        }
        errno = 0;
        if (g_fn.sem_open("p1", 0, g_appGid, 0, 0) != SEM_FAILED || errno != ENOENT) {
            break;
        }
        if (sem_wait(s) != 0) {
            break;
        }
        n = g_fn.sem_open("p1", O_CREAT | O_EXCL, g_appGid, MODE_0600, 0);
        if (n == SEM_FAILED) {
            break;
        }
        errno = 0;
        if (sem_trywait(n) != -1 || errno != EAGAIN) {
            break;
        }
        if (sem_post(s) != 0 || sem_trywait(s) != 0) {
            break;
        }
        ok = 0;
    } while (0);
    if (n != SEM_FAILED) { (void)sem_close(n); }
    if (s != SEM_FAILED) { (void)sem_close(s); }
    (void)SemCleanup("p1");
    return RetVal(env, ok);
}

/* 4900: group_sem basic operations - getvalue/wait/trywait(EAGAIN)/post */
static napi_value GroupIpc_4900(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 1;
    sem_t *s = SEM_FAILED;
    int value = -1;
    do {
        s = g_fn.sem_open("o1", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
        if (s == SEM_FAILED) {
            break;
        }
        if (sem_getvalue(s, &value) != 0 || value != 1) {
            break;
        }
        if (sem_wait(s) != 0) {
            break;
        }
        if (sem_getvalue(s, &value) != 0 || value != 0) {
            break;
        }
        errno = 0;
        if (sem_trywait(s) != -1 || errno != EAGAIN) {
            break;
        }
        if (sem_post(s) != 0) {
            break;
        }
        if (sem_getvalue(s, &value) != 0 || value != 1) {
            break;
        }
        ok = 0;
    } while (0);
    if (s != SEM_FAILED) {
        (void)sem_close(s);
    }
    (void)SemCleanup("o1");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5000: group_sem value = SEM_VALUE_MAX success */
static napi_value GroupIpc_5000(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 1;
    sem_t *s = SEM_FAILED;
    int value = -1;
    do {
        s = g_fn.sem_open("v1", O_CREAT | O_EXCL, g_appGid, MODE_0600, static_cast<unsigned>(SEM_VALUE_MAX));
        if (s == SEM_FAILED) {
            break;
        }
        ok = (sem_getvalue(s, &value) == 0 && value == SEM_VALUE_MAX) ? 0 : 1;
    } while (0);
    if (s != SEM_FAILED) {
        (void)sem_close(s);
    }
    (void)SemCleanup("v1");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5100: group dir attributes unchanged after operations */
static napi_value GroupIpc_5100(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    char path[PATH_MAX_LEN] = {0};
    (void)snprintf_s(path, sizeof(path), sizeof(path) - 1, GROUP_PATH_PREFIX, static_cast<unsigned>(g_appGid));
    struct stat before;
    if (stat(path, &before) != 0) {
        return RetVal(env, 1);
    }
    int fd = g_fn.shm_open("d1", O_CREAT | O_EXCL | O_RDWR, MODE_0600, g_appGid);
    sem_t *s = g_fn.sem_open("d2", O_CREAT | O_EXCL, g_appGid, MODE_0600, 0);
    if (fd >= 0) {
        (void)close(fd);
    }
    if (s != SEM_FAILED) {
        (void)sem_close(s);
    }
    (void)ShmCleanup("d1");
    (void)SemCleanup("d2");
    struct stat after;
    int ok = (stat(path, &after) == 0 && before.st_dev == after.st_dev &&
              before.st_ino == after.st_ino && before.st_uid == after.st_uid &&
              before.st_gid == after.st_gid &&
              (before.st_mode & MODE_07777) == (after.st_mode & MODE_07777)) ? 0 : 1;
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5200: group_shm mode under umask - umask UMASK_0027 + mode MODE_0666 => MODE_0640 */
static napi_value GroupIpc_5200(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    mode_t old = umask(UMASK_0027);
    int fd = g_fn.shm_open("m1", O_CREAT | O_EXCL | O_RDWR, MODE_0666, g_appGid);
    (void)umask(old);
    int ok = 1;
    if (fd >= 0) {
        struct stat st;
        ok = (fstat(fd, &st) == 0 && (st.st_mode & MODE_0777) == MODE_0640) ? 0 : 1;
        (void)close(fd);
    }
    (void)ShmCleanup("m1");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5300 helper: spawn and join read threads */
static int SpawnShmReadThreads(pthread_t *th, ShmReadArg *args, const char *name, gid_t gid, uint32_t expect)
{
    for (int i = 0; i < RACE_WORKERS; i++) {
        args[i].name = name;
        args[i].gid = gid;
        args[i].expect = expect;
        args[i].ok = 0;
        th[i] = 0;
        if (pthread_create(&th[i], nullptr, ShmReadThr, &args[i]) != 0) {
            th[i] = 0;
        }
    }
    int ok = 1;
    for (int i = 0; i < RACE_WORKERS; i++) {
        if (th[i] != 0) { (void)pthread_join(th[i], nullptr); }
        if (!args[i].ok) { ok = 0; }
    }
    return ok;
}

/* 5300: multithread concurrent group_shm_open same name - read consistency */
static napi_value GroupIpc_5300(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 1;
    int fd = -1;
    uint32_t *m = static_cast<uint32_t *>(MAP_FAILED);
    fd = g_fn.shm_open("mt1", O_CREAT | O_EXCL | O_RDWR, MODE_0600, g_appGid);
    if (fd >= 0 && ftruncate(fd, sizeof(uint32_t)) == 0) {
        m = static_cast<uint32_t *>(mmap(nullptr, sizeof(uint32_t), PROT_RW, MAP_SHARED, fd, 0));
        if (m != MAP_FAILED) {
            *m = SHM_VALUE_0XABC123;
        }
    }
    pthread_t th[RACE_WORKERS];
    ShmReadArg args[RACE_WORKERS];
    ok = SpawnShmReadThreads(th, args, "mt1", g_appGid, SHM_VALUE_0XABC123);
    if (m != MAP_FAILED) { (void)munmap(m, sizeof(uint32_t)); }
    if (fd >= 0) { (void)close(fd); }
    (void)ShmCleanup("mt1");
    return RetVal(env, ok);
}

/* 5400: multithread group_shm_open O_CREAT|O_EXCL race - exactly one wins */
static napi_value GroupIpc_5400(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    (void)ShmCleanup("mt2");
    pthread_t th[RACE_WORKERS];
    std::atomic_int succ(0);
    std::atomic_int eexist(0);
    ShmRaceArg arg = { "mt2", g_appGid, &succ, &eexist };
    for (int i = 0; i < RACE_WORKERS; i++) {
        th[i] = 0;
        if (pthread_create(&th[i], nullptr, ShmRaceThr, &arg) != 0) {
            th[i] = 0;
        }
    }
    for (int i = 0; i < RACE_WORKERS; i++) {
        if (th[i] != 0) {
            (void)pthread_join(th[i], nullptr);
        }
    }
    int ok = (succ.load() == 1 && eexist.load() == RACE_WORKERS - 1) ? 0 : 1;
    (void)ShmCleanup("mt2");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5500: multithread concurrent group_sem_open same name - all see same value */
static napi_value GroupIpc_5500(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 1;
    sem_t *s = SEM_FAILED;
    pthread_t th[RACE_WORKERS];
    std::atomic_int okcnt(0);
    SemReadArg arg = { "mt3", g_appGid, 1, &okcnt };
    s = g_fn.sem_open("mt3", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    if (s != SEM_FAILED) {
        for (int i = 0; i < RACE_WORKERS; i++) {
            th[i] = 0;
            if (pthread_create(&th[i], nullptr, SemReadThr, &arg) != 0) {
                th[i] = 0;
            }
        }
        for (int i = 0; i < RACE_WORKERS; i++) {
            if (th[i] != 0) {
                (void)pthread_join(th[i], nullptr);
            }
        }
        ok = (okcnt.load() == RACE_WORKERS) ? 0 : 1;
    }
    if (s != SEM_FAILED) {
        (void)sem_close(s);
    }
    (void)SemCleanup("mt3");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5600: multithread group_sem_open O_CREAT|O_EXCL race - exactly one wins */
static napi_value GroupIpc_5600(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    (void)SemCleanup("mt4");
    pthread_t th[RACE_WORKERS];
    std::atomic_int succ(0);
    std::atomic_int eexist(0);
    SemRaceArg arg = { "mt4", g_appGid, &succ, &eexist };
    for (int i = 0; i < RACE_WORKERS; i++) {
        th[i] = 0;
        if (pthread_create(&th[i], nullptr, SemRaceThr, &arg) != 0) {
            th[i] = 0;
        }
    }
    for (int i = 0; i < RACE_WORKERS; i++) {
        if (th[i] != 0) {
            (void)pthread_join(th[i], nullptr);
        }
    }
    int ok = (succ.load() == 1 && eexist.load() == RACE_WORKERS - 1) ? 0 : 1;
    (void)SemCleanup("mt4");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5700: stability - group_shm_open/close/unlink high-frequency loop */
static napi_value GroupIpc_5700(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 0;
    for (int i = 0; i < LOOP_COUNT_1000; i++) {
        int fd = g_fn.shm_open("st1", O_CREAT | O_RDWR, MODE_0600, g_appGid);
        if (fd < 0) {
            ok = 1;
            break;
        }
        (void)close(fd);
        if (g_fn.shm_unlink("st1", g_appGid) != 0) {
            ok = 1;
            break;
        }
    }
    (void)ShmCleanup("st1");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5800: stability - group_sem_open/close/unlink high-frequency loop, no slot exhaustion */
static napi_value GroupIpc_5800(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 0;
    for (int i = 0; i < LOOP_COUNT_1000; i++) {
        sem_t *s = g_fn.sem_open("st2", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
        if (s == SEM_FAILED) {
            ok = 1;
            break;
        }
        (void)sem_close(s);
        if (g_fn.sem_unlink("st2", g_appGid) != 0) {
            ok = 1;
            break;
        }
    }
    sem_t *fin = g_fn.sem_open("st2", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    if (fin == SEM_FAILED) {
        ok = 1;
    } else {
        (void)sem_close(fin);
    }
    (void)SemCleanup("st2");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 5900: memory leak - group_shm object fully cleaned after loop */
static napi_value GroupIpc_5900(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int ok = 0;
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        int fd = g_fn.shm_open("lk1", O_CREAT | O_EXCL | O_RDWR, MODE_0600, g_appGid);
        if (fd < 0) {
            ok = 1;
            break;
        }
        (void)close(fd);
        if (g_fn.shm_unlink("lk1", g_appGid) != 0) {
            ok = 1;
            break;
        }
    }
    errno = 0;
    if (g_fn.shm_open("lk1", O_RDWR, 0, g_appGid) != -1 || errno != ENOENT) {
        ok = 1;
    }
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

/* 6000: memory leak - group_sem no tmp residue and no slot leak after loop */
static napi_value GroupIpc_6000(napi_env env, napi_callback_info info)
{
    napi_value guard = AvailGuard(env);
    if (guard != nullptr) {
        return guard;
    }
    napi_value dirGuard = DirGuard(env);
    if (dirGuard != nullptr) {
        return dirGuard;
    }
    int before = CountTmpFiles(g_appGid);
    if (before < 0) {
        return RetVal(env, 1);
    }
    int ok = 0;
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        sem_t *s = g_fn.sem_open("lk2", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
        if (s == SEM_FAILED) {
            ok = 1;
            break;
        }
        (void)sem_close(s);
        if (g_fn.sem_unlink("lk2", g_appGid) != 0) {
            ok = 1;
            break;
        }
    }
    int after = CountTmpFiles(g_appGid);
    if (after < 0 || after != before) {
        ok = 1;
    }
    sem_t *fin = g_fn.sem_open("lk2", O_CREAT | O_EXCL, g_appGid, MODE_0600, 1);
    if (fin == SEM_FAILED) {
        ok = 1;
    } else {
        (void)sem_close(fin);
    }
    (void)SemCleanup("lk2");
    napi_value r = nullptr;
    napi_create_int32(env, ok, &r);
    return r;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_callback fnList[] = {
        GroupIpc_0100, GroupIpc_0200, GroupIpc_0300, GroupIpc_0400, GroupIpc_0500, GroupIpc_0600,
        GroupIpc_0700, GroupIpc_0800, GroupIpc_0900, GroupIpc_1000, GroupIpc_1100, GroupIpc_1200,
        GroupIpc_1300, GroupIpc_1400, GroupIpc_1500, GroupIpc_1600, GroupIpc_1700, GroupIpc_1800,
        GroupIpc_1900, GroupIpc_2000, GroupIpc_2100, GroupIpc_2200, GroupIpc_2300, GroupIpc_2400,
        GroupIpc_2500, GroupIpc_2600, GroupIpc_2700, GroupIpc_2800, GroupIpc_2900, GroupIpc_3000,
        GroupIpc_3100, GroupIpc_3200, GroupIpc_3300, GroupIpc_3400, GroupIpc_3500, GroupIpc_3600,
        GroupIpc_3700, GroupIpc_3800, GroupIpc_3900, GroupIpc_4000, GroupIpc_4100, GroupIpc_4200,
        GroupIpc_4300, GroupIpc_4400, GroupIpc_4500, GroupIpc_4600, GroupIpc_4700, GroupIpc_4800,
        GroupIpc_4900, GroupIpc_5000, GroupIpc_5100, GroupIpc_5200, GroupIpc_5300, GroupIpc_5400,
        GroupIpc_5500, GroupIpc_5600, GroupIpc_5700, GroupIpc_5800, GroupIpc_5900, GroupIpc_6000,
    };
    int count = sizeof(fnList) / sizeof(fnList[0]);
    for (int i = 0; i < count; i++) {
        char name[NAME_BUF_SIZE];
        (void)snprintf_s(name, sizeof(name), sizeof(name) - 1, "GroupIpc_%04d", (i + 1) * GROUP_IPC_STEP);
        napi_property_descriptor desc = { name, nullptr, fnList[i], nullptr, nullptr, nullptr, napi_default, nullptr };
        napi_define_properties(env, exports, 1, &desc);
    }
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "groupipc",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
