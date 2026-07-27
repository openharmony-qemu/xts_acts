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
constexpr int mode1 = 1;
constexpr int mode2 = 2;
constexpr int mode3 = 3;
constexpr int mode4 = 4;
constexpr int mode5 = 5;
constexpr int mode6 = 6;
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

static int32_t ParseOpenArgs(napi_env env, napi_callback_info info, std::string &uri, int32_t &mode)
{
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < 2 ||
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
        case 0: flags = O_RDONLY; break;
        case 1: flags = O_RDWR; break;
        case 2: flags = O_WRONLY; break;
        case 3: flags = O_APPEND; break;
        case 4: flags = O_CREAT; break;
        case mode5: flags = O_LARGEFILE; break;
        case mode6: flags = O_TRUNC; break;
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
        ret = mkdirat(AT_FDCWD, newDirPath.c_str(), 0775);
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
    if (mode == mode1) {
        ret = access(path.c_str(), R_OK);
    } else if (mode == mode2) {
        ret = access(path.c_str(), W_OK);
    } else if (mode == mode3) {
        ret = access(path.c_str(), X_OK);
    } else if (mode == mode4) {
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