/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "CFuseTest.h"
#include <hilog/log.h>
#include <fcntl.h>
#include <string>
#include <unistd.h>
#include <cstring>
#include <cerrno>
#include <vector>
#include <sys/stat.h>
#include <sys/statfs.h>
#include <sys/statvfs.h>
#include <ftw.h>
#include <fstream>
#include <libgen.h>
#include <filemanagement/file_uri/oh_file_uri.h>
#include <dirent.h>

constexpr int NUM0 = 0;
constexpr int NUM1 = 1;
constexpr int MODE_RDONLY = 0;
constexpr int MODE_RDWR = 1;
constexpr int MODE_WRONLY = 2;
constexpr int MODE_APPEND = 3;
constexpr int MODE_CREAT = 4;
constexpr int MODE_LARGEFILE = 5;
constexpr int MODE_TRUNC = 6;
constexpr int MODE1 = 1;
constexpr int MODE2 = 2;
constexpr int MODE3 = 3;
constexpr int MODE4 = 4;
constexpr int MODE5 = 5;
constexpr int MODE6 = 6;
constexpr int DIR_MODE = 0775;
constexpr size_t TRUNCATE_SIZE = 1024;
constexpr int ARG_COUNT_2 = 2;
constexpr int ARG_COUNT_3 = 3;
constexpr int IDX_2 = 2;
constexpr int IDX_1 = 1;
constexpr int IDX_0 = 0;
constexpr int DUP2_FD = 10086;
#define LOG_DOMAIN 0x0000
#define LOG_TAG "CFuseTestCpp"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

static bool GetUtf8String(napi_env env, napi_value root, std::string &res)
{
    size_t bufferSize = NUM0;
    napi_get_value_string_utf8(env, root, nullptr, NUM0, &bufferSize);

    size_t resultSize = NUM0;
    bufferSize = bufferSize + NUM1;

    std::vector<char> buffer(bufferSize);
    napi_get_value_string_utf8(env, root, &(buffer[NUM0]), bufferSize, &resultSize);
    res.assign(buffer.begin(), buffer.end());
    return true;
}

static int32_t GetPathFromUri(const std::string &uri, std::string &path)
{
    char *result = nullptr;
    int err = OH_FileUri_GetPathFromUri(uri.c_str(), strlen(uri.c_str()), &result);
    if (err != 0) {
        LOGE("GetPathFromUri failed, err = %{public}d", err);
        return err;
    }
    path.assign(result);
    LOGI("GetPathFromUri succ, path = %{public}s", path.c_str());
    free(result);
    return 0;
}

static int CopyFdData(int sourceFd, int targetFd)
{
    char dataBuffer[4096] = {0};
    int sourceLen = 0;
    while ((sourceLen = read(sourceFd, dataBuffer, sizeof(dataBuffer))) > 0) {
        if (targetFd > 0) {
            write(targetFd, dataBuffer, sizeof(dataBuffer));
        }
    }
    return sourceLen;
}

static int32_t ParseOpenArgs(napi_env env, napi_callback_info info, std::string &uri, int32_t &mode)
{
    napi_value argValue[ARG_COUNT_2] = {0};
    size_t argCount = ARG_COUNT_2;
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < ARG_COUNT_2 ||
        argValue[0] == nullptr || argValue[1] == nullptr) {
        LOGE("OpenTest napi_get_cb_info failed");
        return -1;
    }
    GetUtf8String(env, argValue[0], uri);
    LOGI("OpenTest uri: %{public}s", uri.c_str());
    napi_get_value_int32(env, argValue[1], &mode);
    LOGI("OpenTest mode: %{public}d", mode);
    return 0;
}

static int32_t DoOpenFile(const std::string &path, int32_t mode)
{
    int flags = O_EXCL;
    switch (mode) {
        case MODE_RDONLY: flags = O_RDONLY; break;
        case MODE1: flags = O_RDWR; break;
        case MODE2: flags = O_WRONLY; break;
        case MODE3: flags = O_APPEND; break;
        case MODE4: flags = O_CREAT; break;
        case MODE5: flags = O_LARGEFILE; break;
        case MODE6: flags = O_TRUNC; break;
        default: flags = O_EXCL; break;
    }
    int fd = open(path.c_str(), flags);
    LOGE("OpenTest: open fd = %{public}d", fd);
    if (fd < 0) {
        char *msg = strerror(errno);
        LOGE("OpenTest: open failed, path = %{public}s, err = %{public}d", path.c_str(), errno);
        LOGE("OpenTest: open failed, error Msg: %{public}s", msg);
    }
    return fd;
}

napi_value OpenTest(napi_env env, napi_callback_info info)
{
    LOGI("OpenTest start");
    napi_value result;
    napi_value udfVar = nullptr;
    napi_get_undefined(env, &udfVar);

    std::string uri;
    int32_t mode = 0;
    if (ParseOpenArgs(env, info, uri, mode) != 0) {
        return udfVar;
    }

    std::string path;
    int32_t err = GetPathFromUri(uri, path);
    if (err != 0) {
        LOGE("GetPathFromUri failed");
        napi_create_int32(env, -1, &result);
        return result;
    }
    LOGI("OpenTest path: %{public}s", path.c_str());

    int fd = DoOpenFile(path, mode);
    LOGI("OpenTest open end: path = %{public}s", path.c_str());
    napi_create_int32(env, fd, &result);
    return result;
}

napi_value Test_Create_Dir(napi_env env, napi_callback_info info)
{
    LOGI("Test_Create_Dir start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);

    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_Create_Dir uri: %{public}s", uri.c_str());

    std::string path;
    err = GetPathFromUri(uri, path);
    LOGI("Test_Create_Dir path: %{public}s", path.c_str());
    std::string newPath = path.substr(0, path.rfind("Photo"));
    LOGI("Test_Create_Dir newPath: %{public}s", newPath.c_str());
    std::string newDirPath = newPath + "newDir";
    int ret = -1;
    if (mode == MODE_RDONLY) {
        ret = mkdirat(AT_FDCWD, newDirPath.c_str(), DIR_MODE);
    } else {
        ret = mkdir(newDirPath.c_str(), S_IRWXG);
    }
    LOGI("Test_Create_Dir create dir：%{public}s ret = %{public}d .", newDirPath.c_str(), ret);
    if (ret == -1) {
        char *msg = strerror(errno);
        LOGI("Test_Create_Dir path: %{public}s failed !", newDirPath.c_str());
        LOGI("Test_Create_Dir errno: %{public}d , errMsg = %{public}s !", errno, msg);
    }
    napi_value status;
    napi_create_int32(env, ret, &status);
    return status;
}

napi_value Test_Create_File(napi_env env, napi_callback_info info)
{
    LOGI("Test_Create_File start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);

    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_Create_File uri: %{public}s", uri.c_str());

    std::string path;
    err = GetPathFromUri(uri, path);
    LOGI("Test_Create_File path: %{public}s", path.c_str());
    std::string newPath = path.substr(0, path.rfind("Photo")) + "1008.jpg";
    LOGI("Test_Create_File newPath: %{public}s", newPath.c_str());
    std::ofstream ofs;
    ofs.open(newPath.c_str(), std::ios::out);
    int ret = -1;
    if (ofs.is_open()) {
        ret = 1;
    }
    if (ret == -1) {
        char *msg = strerror(errno);
        LOGI("Test_Create_File errno: %{public}d , errMsg = %{public}s !", errno, msg);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    LOGI("Test_Create_File ret is : %{public}d", ret);
    return flag;
}

napi_value Test_Open_Dir(napi_env env, napi_callback_info info)
{
    LOGI("Test_Open_Dir start");
    int err = 0;
    size_t argc = 1;
    napi_value args[2] = {nullptr, nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);

    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_Open_Dir uri: %{public}s", uri.c_str());

    std::string path;
    err = GetPathFromUri(uri, path);
    LOGI("Test_Open_Dir path: %{public}s", path.c_str());
    std::string newPath = path.substr(0, path.rfind("Photo"));
    LOGI("Test_Open_Dir newPath: %{public}s", newPath.c_str());
    int ret = open(newPath.c_str(), O_RDONLY);
    LOGI("Test_Open_Dir open dir: %{public}s ret = %{public}d .", newPath.c_str(), ret);
    if (ret == -1) {
        char *msg = strerror(errno);
        LOGI("Test_Open_Dir errno: %{public}d , errMsg = %{public}s !", errno, msg);
    }
    napi_value status;
    napi_create_int32(env, ret, &status);
    return status;
}

napi_value Test_Access(napi_env env, napi_callback_info info)
{
    LOGI("Test_Access start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_Access uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    int ret = -1;
    if (mode == MODE1) {
        ret = access(path.c_str(), R_OK);
    } else if (mode == MODE2) {
        ret = access(path.c_str(), W_OK);
    } else if (mode == MODE3) {
        ret = access(path.c_str(), X_OK);
    } else if (mode == MODE4) {
        ret = access(path.c_str(), F_OK);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    LOGI("Test_Access ret is : %{public}d", ret);
    if (ret == -1) {
        char *msg = strerror(errno);
        LOGI("Test_Access errno: %{public}d , errMsg = %{public}s", ret, msg);
    }
    return flag;
}

napi_value Test_Chmod(napi_env env, napi_callback_info info)
{
    LOGI("Test_Chmod start");
    int err = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_Chmod uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    int ret = -1;
    if (access(path.c_str(), F_OK) == 0) {
        ret = chmod(path.c_str(), S_IREAD);
        if (ret == -1) {
            char *msg = strerror(errno);
            LOGE("chmod failed ! errno = %{public}d, errMsg = %{public}s", errno, msg);
        }
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    LOGI("Test_Chmod ret is : %{public}d", ret);
    return flag;
}

napi_value Test_Chown(napi_env env, napi_callback_info info)
{
    LOGI("Test_Chown start");
    int err = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_Chown uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    int ret = -1;
    if (access(path.c_str(), F_OK) == 0) {
        ret = chown(path.c_str(), 0, 0);
        if (ret == -1) {
            char *msg = strerror(errno);
            LOGE("chown failed ! errno = %{public}d, errMsg = %{public}s", errno, msg);
        }
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    LOGI("Test_Chown ret is : %{public}d", ret);
    return flag;
}

napi_value Test_RemoveFile(napi_env env, napi_callback_info info)
{
    LOGI("Test_Remove start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_Remove uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    int ret = -1;
    if (mode == MODE_RDONLY) {
        ret = unlink(path.c_str());
    } else {
        ret = remove(path.c_str());
    }
    if (ret == -1) {
        char *msg = strerror(errno);
        LOGE("remove failed ! errno = %{public}d, errMsg = %{public}s", errno, msg);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    LOGI("remove file %{public}s , ret is : %{public}d", path.c_str(), ret);
    return flag;
}

napi_value Test_RemoveDir(napi_env env, napi_callback_info info)
{
    LOGI("Test_Remove start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_Remove uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    std::string newPath = path.substr(0, path.rfind("Photo"));
    int ret = -1;
    if (mode == MODE_RDONLY) {
        ret = remove(newPath.c_str());
    } else {
        ret = rmdir(newPath.c_str());
    }
    if (ret == -1) {
        char *msg = strerror(errno);
        LOGE("remove dir %{public}s failed ! errno = %{public}d, errMsg = %{public}s", newPath.c_str(), errno, msg);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    LOGI("remove Dir %{public}s , ret is : %{public}d", newPath.c_str(), ret);
    return flag;
}

napi_value Test_Rename(napi_env env, napi_callback_info info)
{
    LOGI("Test_Rename start");
    int err = 0;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    size_t newNameLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_string_utf8(env, args[1], nullptr, 0, &newNameLen);
    std::vector<char> buffer;
    std::vector<char> nameBuffer;
    buffer.resize(uriLen + 1);
    nameBuffer.resize(newNameLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    napi_get_value_string_utf8(env, args[1], nameBuffer.data(), nameBuffer.size(), &newNameLen);
    std::string uri(buffer.begin(), buffer.end());
    std::string newName(nameBuffer.begin(), nameBuffer.end());
    LOGI("Test_Rename uri: %{public}s", uri.c_str());
    LOGI("Test_Rename newName: %{public}s", newName.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    int ret = -1;
    std::string newPath = path.substr(0, path.rfind("/")) + "/" + newName;
    LOGE("oldPath = %{public}s", path.c_str());
    LOGE("newPath = %{public}s", newPath.c_str());
    ret = rename(path.c_str(), newPath.c_str());
    if (ret == -1) {
        char *msg = strerror(errno);
        LOGE("rename failed ! errno = %{public}d, errMsg = %{public}s", errno, msg);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    LOGI("Test_Rename ret is : %{public}d", ret);
    return flag;
}

napi_value Test_DirName(napi_env env, napi_callback_info info)
{
    LOGI("Test_DirName start");
    int err = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_DirName uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    char *dir = dirname(const_cast<char *>(path.c_str()));
    if (dir == nullptr) {
        LOGI("dirname is NULL");
    }
    LOGI("Test_DirName dirName: %{public}s", dir);
    napi_value flag;
    napi_create_string_utf8(env, dir, strlen(dir), &flag);
    return flag;
}

napi_value Test_BaseName(napi_env env, napi_callback_info info)
{
    LOGI("Test_BaseName start");
    int err = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    LOGI("Test_BaseName uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    char *dir = basename(const_cast<char *>(path.c_str()));
    if (dir == nullptr) {
        LOGI("basename is NULL");
    }
    LOGI("Test_BaseName baseName: %{public}s", dir);
    napi_value flag;
    napi_create_string_utf8(env, dir, strlen(dir), &flag);
    return flag;
}

napi_value Test_Create_Api(napi_env env, napi_callback_info info)
{
    LOGI("Test_Create_Api start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    LOGI("uri: %{public}s", uri.c_str());
    napi_get_value_int32(env, args[1], &mode);
    std::string path;
    err = GetPathFromUri(uri, path);
    std::string newPath = path.substr(0, path.rfind("Photo")) + "10086.jpg";
    LOGI("newPath: %{public}s", newPath.c_str());
    int ret = -1;
    int fd = -1;
    LOGI("create api, mode is %{public}d", mode);
    if (mode == MODE1) {
        fd = creat(newPath.c_str(), S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
    } else {
        fd = creat(path.c_str(), O_RDONLY);
    }
    LOGI("newPath create ret is %{public}d", fd);
    if (fd > 0) {
        ret = 1;
        LOGI("newPath create success,fd %{public}d", fd);
        close(fd);
    } else {
        char *msg = strerror(errno);
        LOGE("Create failed, errno = %{public}d, errMsg: %{public}s", errno, msg);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_stat(napi_env env, napi_callback_info info)
{
    LOGI("Test_stat: start");

    int err = 0;
    int mode = 1;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    if (argc >= ARG_COUNT_2) {
        napi_get_value_int32(env, args[1], &mode);
    }

    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);

    std::string uri(buffer.begin(), buffer.end());
    LOGI("uri: %{public}s, mode: %{public}d", uri.c_str(), mode);

    std::string path;
    err = GetPathFromUri(uri, path);
    if (err != 0) {
        LOGE("GetPathFromUri failed");
        napi_value ret;
        napi_create_int32(env, -1, &ret);
        return ret;
    }
    LOGI("path: %{public}s", path.c_str());

    int ret = -1;
    struct stat st;
    if (mode == MODE2) {
        if (lstat(path.c_str(), &st) == 0) {
            LOGI("lstat info: mode=%{public}o, uid=%{public}d, gid=%{public}d, size=%{public}ld", st.st_mode,
                        st.st_uid, st.st_gid, st.st_size);
            ret = 0;
        } else {
            LOGE("Test_stat: lstat failed");
        }
    } else {
        if (stat(path.c_str(), &st) == 0) {
            LOGI("stat info: mode=%{public}o, uid=%{public}d, gid=%{public}d, size=%{public}ld", st.st_mode,
                        st.st_uid, st.st_gid, st.st_size);
            ret = 0;
        } else {
            LOGE("Test_stat: stat failed");
        }
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value Test_Fstat(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_Stat start");
    int err = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    struct stat myStat;
    int ret = -1;
    int fd = open(path.c_str(), O_RDONLY);
    if (fd <= 0) {
        OH_LOG_INFO(LOG_APP, "open uri: %{public}s failed !", uri.c_str());
    } else {
        ret = fstat(fd, &myStat);
    }
    OH_LOG_INFO(LOG_APP, "get file stat, ret = %{public}d", ret);
    long size = myStat.st_size;
    OH_LOG_INFO(LOG_APP, "get file size, size = %{public}ld", size);
    if (fd > 0) {
        close(fd);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_FsSystemStat(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_FsSystemStat start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    int ret = -1;
    OH_LOG_INFO(LOG_APP, "get file stat, mode = %{public}d", mode);
    if (mode == MODE1) {
        struct statfs statFsStruct = {0};
        ret = statfs(path.c_str(), &statFsStruct);
        OH_LOG_INFO(LOG_APP, "get file stat, ret = %{public}d", ret);
        if (ret >= 0) {
            OH_LOG_INFO(LOG_APP, "fileSystem blocksNum: %{public}ld, blocksSize: %{public}ld",
                        statFsStruct.f_blocks, statFsStruct.f_bsize);
        } else {
            char *msg = strerror(errno);
            OH_LOG_INFO(LOG_APP, "errno = %{public}d, errMsg is %{public}s", errno, msg);
        }
    } else {
        struct statvfs vfs;
        ret = statvfs(path.c_str(), &vfs);

        if (ret >= 0) {
            blkcnt_t blockSize = vfs.f_bsize;
            OH_LOG_INFO(LOG_APP, "fileSystem totalSize: %{public}ld", vfs.f_blocks + blockSize);
        } else {
            char *msg = strerror(errno);
            OH_LOG_INFO(LOG_APP, "errno = %{public}d, errMsg is %{public}s", errno, msg);
        }
    }
    OH_LOG_INFO(LOG_APP, "get file stat, ret = %{public}d", ret);
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

int Fn(const char *fpath, const struct stat *st, int typeflag)
{
    int result = -1;
    if (typeflag == FTW_F) {
        result = 1;
        OH_LOG_INFO(LOG_APP, "stdio file, dev: %{public}lu", st->st_dev);
    } else if (typeflag == FTW_D) {
        result = 1;
        OH_LOG_INFO(LOG_APP, "stdio dir, dev: %{public}lu", st->st_dev);
    } else {
        OH_LOG_INFO(LOG_APP, "unknow file type, dev: %{public}lu", st->st_dev);
    }

    return result;
}

int Fn2(const char *fpath, const struct stat *st, int typeflag, struct FTW *fbuf)
{
    int result = -1;
    if (typeflag == FTW_F) {
        result = 1;
        OH_LOG_INFO(LOG_APP, "stdio file, dev: %{public}s", fpath);
    } else if (typeflag == FTW_D) {
        result = 1;
        OH_LOG_INFO(LOG_APP, "stdio dir, dev: %{public}s", fpath);
    } else {
        result = 1;
        OH_LOG_INFO(LOG_APP, "unknow file type, dev: %{public}lu", st->st_dev);
    }

    return result;
}

napi_value Test_Ftw(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_FsSystemStat start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    std::string newPath = path.substr(0, path.rfind("Photo"));
    OH_LOG_INFO(LOG_APP, "newPath: %{public}s", newPath.c_str());
    OH_LOG_INFO(LOG_APP, "get file stat, mode = %{public}d", mode);
    int ret = -1;
    if (mode == MODE1) {
        int temp = ftw(newPath.c_str(), Fn, 500);
        if (temp == 0) {
            ret = 0;
            OH_LOG_INFO(LOG_APP, "ftw success, temp = %{public}d", temp);
        } else {
            char *msg = strerror(errno);
            OH_LOG_INFO(LOG_APP, "ftw result = %{public}d, errno = %{public}d, errMsg is %{public}s",
                        temp, errno, msg);
        }
    } else {
        int temp = nftw(newPath.c_str(), Fn2, 20, 0);
        if (temp == 0) {
            ret = 0;
            OH_LOG_INFO(LOG_APP, "nftw success, temp = %{public}d", temp);
        } else {
            char *msg = strerror(errno);
            OH_LOG_INFO(LOG_APP, "nftw result = %{public}d, errno = %{public}d, errMsg is %{public}s",
                        temp, errno, msg);
        }
    }
    OH_LOG_INFO(LOG_APP, "get file stat, ret = %{public}d", ret);
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_Truncate(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_Truncate start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    OH_LOG_INFO(LOG_APP, "get file , mode = %{public}d", mode);
    int ret = -1;
    if (mode == MODE1) {
        ret = truncate(path.c_str(), TRUNCATE_SIZE);
    } else {
        int fd = open(path.c_str(), O_RDWR);
        if (fd < 0) {
            OH_LOG_INFO(LOG_APP, "open file %{public}s failed !", path.c_str());
        } else {
            ret = ftruncate(fd, TRUNCATE_SIZE);
            close(fd);
        }
    }
    char *msg = strerror(errno);
    OH_LOG_INFO(LOG_APP, "truncate file , ret = %{public}d, errno = %{public}d , errMsg = %{public}s", ret, errno, msg);
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_PathConf(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_PathConf start");
    int err = 0;
    int mode;
    bool withF;
    size_t argc = ARG_COUNT_3;
    napi_value args[ARG_COUNT_3] = {nullptr, nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    napi_get_value_bool(env, args[IDX_2], &withF);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    OH_LOG_INFO(LOG_APP, "get file stat, mode = %{public}d", mode);
    int ret = -1;
    if (mode == MODE1) {
        int fd = open(path.c_str(), O_RDONLY);
        OH_LOG_INFO(LOG_APP, "get file fd, fd = %{public}d", fd);
        if (fd > 0) {
            ret = withF == true ? fpathconf(fd, _PC_NAME_MAX) : pathconf(path.c_str(), _PC_NAME_MAX);
            close(fd);
        }
    } else {
        std::string newPath = path.substr(0, path.rfind("Photo"));
        OH_LOG_INFO(LOG_APP, "newPath = %{public}s", newPath.c_str());
        int fd = open(newPath.c_str(), O_RDONLY);
        OH_LOG_INFO(LOG_APP, "get dir fd, fd = %{public}d", fd);
        if (fd > 0) {
            ret = withF == true ? fpathconf(fd, _PC_NAME_MAX) : pathconf(newPath.c_str(), _PC_NAME_MAX);
            close(fd);
        }
    }
    OH_LOG_INFO(LOG_APP, "pathconf file , ret = %{public}d", ret);
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

static int32_t ParseDirArgs(napi_env env, napi_callback_info info, std::string &uri, int &mode)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    GetUtf8String(env, args[0], uri);
    napi_get_value_int32(env, args[1], &mode);
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    return 0;
}

static int32_t DoReadDir(const std::string &path, int mode)
{
    std::string newPath;
    if (mode == MODE1) {
        newPath = path.substr(0, path.rfind("/"));
    } else {
        newPath = path.substr(0, path.rfind("Photo"));
    }
    OH_LOG_INFO(LOG_APP, "newPath = %{public}s", newPath.c_str());
    DIR *pointer = opendir(newPath.c_str());
    OH_LOG_INFO(LOG_APP, "pointer = %{public}d", (pointer == nullptr));
    if (pointer == nullptr) {
        char *msg = strerror(errno);
        OH_LOG_ERROR(LOG_APP, "Create failed, errno = %{public}d, errMsg: %{public}s", errno, msg);
        return -1;
    }
    int ret = 1;
    struct dirent *pEnt = readdir(pointer);
    int offset = telldir(pointer);
    OH_LOG_INFO(LOG_APP, "current offset = %{public}d", offset);
    OH_LOG_INFO(LOG_APP, "PEnt is NULL, ret = %{public}d", pEnt == nullptr);
    if (pEnt != nullptr) {
        OH_LOG_INFO(LOG_APP, "d_name = %{public}s", pEnt->d_name);
    } else {
        char *msg = strerror(errno);
        OH_LOG_ERROR(LOG_APP, "Create failed, errno = %{public}d, errMsg: %{public}s", errno, msg);
    }
    seekdir(pointer, 0);
    int offsetSeek = telldir(pointer);
    OH_LOG_INFO(LOG_APP, "after seekdir offset = %{public}d", offsetSeek);
    pEnt = readdir(pointer);
    int offset2 = telldir(pointer);
    OH_LOG_INFO(LOG_APP, "read again , current offset = %{public}d", offset2);
    rewinddir(pointer);
    int offset3 = telldir(pointer);
    OH_LOG_INFO(LOG_APP, "after rewinddir, current offset = %{public}d", offset3);
    int closeFlag = closedir(pointer);
    OH_LOG_INFO(LOG_APP, "closeFlag = %{public}d", closeFlag);
    return ret;
}

napi_value Test_OpenReadDir(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_OpenReadDir start");
    std::string uri;
    int mode = 0;
    ParseDirArgs(env, info, uri, mode);
    std::string path;
    GetPathFromUri(uri, path);
    OH_LOG_INFO(LOG_APP, "get file stat, mode = %{public}d", mode);
    int ret = DoReadDir(path, mode);
    OH_LOG_INFO(LOG_APP, "openDir , ret = %{public}d", ret);
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_ReadDir_R(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_ReadDir_R start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    OH_LOG_INFO(LOG_APP, "get file stat, mode = %{public}d", mode);
    std::string newPath;
    DIR *pointer = nullptr;
    struct dirent *entry = (struct dirent *)malloc(sizeof(struct dirent));
    struct dirent **result = (struct dirent **)malloc(sizeof(struct dirent));
    int ret = -1;
    if (mode == MODE1) {
        newPath = path.substr(0, path.rfind("/"));
    } else {
        newPath = path.substr(0, path.rfind("Photo"));
    }
    OH_LOG_INFO(LOG_APP, "newPath = %{public}s", newPath.c_str());
    pointer = opendir(newPath.c_str());
    OH_LOG_INFO(LOG_APP, "pointer = %{public}d", (pointer == nullptr));
    if (pointer != nullptr) {
        ret = 1;
        int readFlag = readdir_r(pointer, entry, result);
        OH_LOG_INFO(LOG_APP, "readdir_r , readFlag = %{public}d", readFlag);
        OH_LOG_INFO(LOG_APP, "readdir_r , dir_name = %{public}s", entry == nullptr ? "nullptr" : entry->d_name);
        OH_LOG_INFO(LOG_APP, "readdir_r , d_name = %{public}s", result[0] == nullptr ? "nullptr" : result[0]->d_name);
    } else {
        char *msg = strerror(errno);
        OH_LOG_ERROR(LOG_APP, "Create failed, errno = %{public}d, errMsg: %{public}s", errno, msg);
    }
    OH_LOG_INFO(LOG_APP, "openDir , ret = %{public}d", ret);
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_Fallocate(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_Fallocate start");
    uint64_t fileSize = 10 * 1024 * 1024 * 1024ULL;
    int err = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    int ret = -1;
    int fd = open(path.c_str(), O_RDWR);
    if (fd > 0) {
        ret = fallocate(fd, 0, 0, fileSize);
        if (ret == -1) {
            char *msg = strerror(errno);
            OH_LOG_ERROR(LOG_APP, "Create failed, errno = %{public}d, errMsg: %{public}s", errno, msg);
        }
        OH_LOG_INFO(LOG_APP, "fallocate ret: %{public}d", ret);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_Fcntl(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_Fcntl start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    int ret = -1;
    int fd = open(path.c_str(), O_RDWR);
    if (fd > 0) {
        if (mode == MODE1) {
            ret = fcntl(fd, F_GETFL, 0);
            OH_LOG_INFO(LOG_APP, "fcntl --- F_GETFL ret = %{public}d", ret);
        } else {
            ret = fcntl(fd, F_SETFL, O_NONBLOCK);
            OH_LOG_INFO(LOG_APP, "fcntl --- O_NONBLOCK ret = %{public}d", ret);
        }
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_Chdir(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_Chdir start");
    int err = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);

    std::string newPath = path.substr(0, path.rfind("Photo"));
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", newPath.c_str());
    int ret = -1;
    int testFlag1 = chdir(newPath.c_str());
    OH_LOG_INFO(LOG_APP, "testFlag1: %{public}d", testFlag1);
    if (testFlag1 == 0) {
        ret = 1;
    } else {
        char *msg = strerror(errno);
        OH_LOG_ERROR(LOG_APP, "errno = %{public}d, error Msg: %{public}s", errno, msg);
    }
    OH_LOG_INFO(LOG_APP, "chdir ret: %{public}d", ret);
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_Dup_Api(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_Dup_Api start");
    int err = 0;
    int mode;
    size_t argc = ARG_COUNT_3;
    napi_value args[ARG_COUNT_3] = {nullptr, nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string uri1;
    std::string uri2;
    GetUtf8String(env, args[0], uri1);
    GetUtf8String(env, args[IDX_2], uri2);
    OH_LOG_INFO(LOG_APP, "uriSource: %{public}s", uri1.c_str());
    OH_LOG_INFO(LOG_APP, "uriTarget: %{public}s", uri2.c_str());
    napi_get_value_int32(env, args[1], &mode);
    std::string sourcePath;
    std::string targetPath;
    err = GetPathFromUri(uri1, sourcePath);
    GetPathFromUri(uri2, targetPath);

    int sourceFd = open(sourcePath.c_str(), O_RDONLY);
    int targetFd = open(targetPath.c_str(), O_RDWR);
    int nFd;
    lseek(sourceFd, 0, SEEK_SET);
    lseek(targetFd, 0, SEEK_SET);
    int ret = -1;
    if (mode == MODE1) {
        nFd = dup(targetFd);
    } else {
        nFd = dup2(targetFd, DUP2_FD);
    }
    OH_LOG_INFO(LOG_APP, "nFd create success, ret: %{public}d", nFd);
    CopyFdData(sourceFd, nFd);
    ret = nFd;
    if (sourceFd > 0) {
        close(sourceFd);
    }
    if (targetFd) {
        close(targetFd);
    }
    if (nFd) {
        close(nFd);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_Fsync(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_Fsync start");
    int err = 0;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string uri1;
    std::string uri2;
    GetUtf8String(env, args[0], uri1);
    GetUtf8String(env, args[1], uri2);
    OH_LOG_INFO(LOG_APP, "uriSource: %{public}s", uri1.c_str());
    OH_LOG_INFO(LOG_APP, "uriTarget: %{public}s", uri2.c_str());
    std::string sourcePath;
    std::string targetPath;
    err = GetPathFromUri(uri1, sourcePath);
    GetPathFromUri(uri2, targetPath);

    int sourceFd = open(sourcePath.c_str(), O_RDONLY);
    int targetFd = open(targetPath.c_str(), O_RDWR | O_TRUNC);
    OH_LOG_INFO(LOG_APP, "sourceFd create success, ret: %{public}d", sourceFd);
    OH_LOG_INFO(LOG_APP, "targetFd create success, ret: %{public}d", targetFd);
    off_t offSet = lseek(sourceFd, 0, SEEK_SET);
    OH_LOG_INFO(LOG_APP, "offSet, ret: %{public}ld", offSet);
    lseek(targetFd, 0, SEEK_SET);
    int ret = -1;
    CopyFdData(sourceFd, targetFd);
    ret = fsync(targetFd);
    OH_LOG_INFO(LOG_APP, "fsync method , ret: %{public}d", ret);
    if (sourceFd > 0) {
        close(sourceFd);
    }
    if (targetFd) {
        close(targetFd);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}

napi_value Test_scanDir(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "Test_scanDir start");
    int err = 0;
    int mode;
    size_t argc = 2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t uriLen = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &uriLen);
    napi_get_value_int32(env, args[1], &mode);
    std::vector<char> buffer;
    buffer.resize(uriLen + 1);
    napi_get_value_string_utf8(env, args[0], buffer.data(), buffer.size(), &uriLen);
    std::string uri(buffer.begin(), buffer.end());
    OH_LOG_INFO(LOG_APP, "uri: %{public}s", uri.c_str());
    std::string path;
    err = GetPathFromUri(uri, path);
    OH_LOG_INFO(LOG_APP, "get file stat, mode = %{public}d", mode);
    std::string newPath = path.substr(0, path.rfind("Photo"));
    OH_LOG_INFO(LOG_APP, "newPath = %{public}s", newPath.c_str());
    struct dirent **entryList;
    int count;
    int i;
    int ret = -1;
    count = scandir(newPath.c_str(), &entryList, 0, alphasort);
    OH_LOG_INFO(LOG_APP, "scandir = %{public}d", count);
    if (count > 0) {
        ret = 1;
        for (i = 0; i < count; i++) {
            struct dirent *entry = entryList[i];
            OH_LOG_INFO(LOG_APP, "scandir, count is %{public}d, d_name = %{public}s", i, entry->d_name);
            free(entry);
        }
    } else {
        char *msg = strerror(errno);
        OH_LOG_ERROR(LOG_APP, "scanDir failed, errno = %{public}d, errMsg: %{public}s", errno, msg);
    }
    napi_value flag;
    napi_create_int32(env, ret, &flag);
    return flag;
}