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

#ifndef CFUSE_TEST_H
#define CFUSE_TEST_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value OpenTest(napi_env env, napi_callback_info info);
napi_value Test_Create_Dir(napi_env env, napi_callback_info info);
napi_value Test_Create_File(napi_env env, napi_callback_info info);
napi_value Test_Open_Dir(napi_env env, napi_callback_info info);
napi_value Test_Access(napi_env env, napi_callback_info info);
napi_value Test_Chmod(napi_env env, napi_callback_info info);
napi_value Test_Chown(napi_env env, napi_callback_info info);
napi_value Test_RemoveFile(napi_env env, napi_callback_info info);
napi_value Test_RemoveDir(napi_env env, napi_callback_info info);
napi_value Test_Rename(napi_env env, napi_callback_info info);
napi_value Test_DirName(napi_env env, napi_callback_info info);
napi_value Test_BaseName(napi_env env, napi_callback_info info);
napi_value Test_Create_Api(napi_env env, napi_callback_info info);
napi_value Test_stat(napi_env env, napi_callback_info info);
napi_value Test_Fstat(napi_env env, napi_callback_info info);
napi_value Test_FsSystemStat(napi_env env, napi_callback_info info);
napi_value Test_Ftw(napi_env env, napi_callback_info info);
napi_value Test_Truncate(napi_env env, napi_callback_info info);
napi_value Test_PathConf(napi_env env, napi_callback_info info);
napi_value Test_OpenReadDir(napi_env env, napi_callback_info info);
napi_value Test_ReadDir_R(napi_env env, napi_callback_info info);
napi_value Test_Fallocate(napi_env env, napi_callback_info info);
napi_value Test_Fcntl(napi_env env, napi_callback_info info);
napi_value Test_Chdir(napi_env env, napi_callback_info info);
napi_value Test_Dup_Api(napi_env env, napi_callback_info info);
napi_value Test_Fsync(napi_env env, napi_callback_info info);
napi_value Test_scanDir(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
