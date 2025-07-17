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
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <ace/xcomponent/native_xcomponent_key_event.h>
namespace {
    static const uint32_t MAX_NAME_LENGTH = 1024;
    static bool KEY_APOSTROPHE_ISTRUE = 0;
    static bool KEY_GRAVE_ISTRUE = 0;
    static bool KEY_MINUS_ISTRUE = 0;
    static bool KEY_EQUALS_ISTRUE = 0;
    static bool KEY_LEFT_BRACKET_ISTRUE = 0;
    static bool KEY_RIGHT_BRACKET_ISTRUE = 0;
    static bool KEY_BACKSLASH_ISTRUE = 0;
    static bool KEY_SEMICOLON_ISTRUE = 0;
    static bool KEY_SLASH_ISTRUE = 0;
    static bool KEY_AT_ISTRUE = 0;

}

static napi_value GetKeyCodeEvent_KEY_APOSTROPHE(napi_env env, napi_callback_info info)
{
    if(KEY_APOSTROPHE_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_APOSTROPHE_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}

static napi_value GetKeyCodeEvent_KEY_GRAVE(napi_env env, napi_callback_info info)
{
    if(KEY_GRAVE_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_GRAVE_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}
static napi_value GetKeyCodeEvent_KEY_MINUS(napi_env env, napi_callback_info info)
{
    if(KEY_MINUS_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_MINUS_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}
static napi_value GetKeyCodeEvent_KEY_EQUALS(napi_env env, napi_callback_info info)
{
    if(KEY_EQUALS_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_EQUALS_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}
static napi_value GetKeyCodeEvent_KEY_LEFT_BRACKET(napi_env env, napi_callback_info info)
{
    if(KEY_LEFT_BRACKET_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_LEFT_BRACKET_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}
static napi_value GetKeyCodeEvent_KEY_RIGHT_BRACKET(napi_env env, napi_callback_info info)
{
    if(KEY_RIGHT_BRACKET_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_RIGHT_BRACKET_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}
static napi_value GetKeyCodeEvent_KEY_BACKSLASH(napi_env env, napi_callback_info info)
{
    if(KEY_BACKSLASH_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_BACKSLASH_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}
static napi_value GetKeyCodeEvent_KEY_SEMICOLON(napi_env env, napi_callback_info info)
{
    if(KEY_SEMICOLON_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_SEMICOLON_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}
static napi_value GetKeyCodeEvent_KEY_SLASH(napi_env env, napi_callback_info info)
{
    if(KEY_SLASH_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_SLASH_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}
static napi_value GetKeyCodeEvent_KEY_AT(napi_env env, napi_callback_info info)
{
    if(KEY_AT_ISTRUE){
        napi_value retValue;
        napi_create_int32(env, KEY_AT_ISTRUE, &retValue);
        return retValue;
    }
    return 0;
}

static napi_value InitKeyMonitor(napi_env env, napi_callback_info info) {
    
    char str[MAX_NAME_LENGTH] = {0};
    size_t argc = 1;
    int32_t intValue;
    napi_value args[1]; // 存储参数数组
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &intValue);
    if (KEY_APOSTROPHE == intValue) {
        KEY_APOSTROPHE_ISTRUE = 1;
    }
    if (KEY_GRAVE == intValue) {
        KEY_GRAVE_ISTRUE = 1;
    }
    if (KEY_MINUS == intValue) {
        KEY_MINUS_ISTRUE = 1;
    }
    if (KEY_EQUALS == intValue) {
        KEY_EQUALS_ISTRUE = 1;
    }
    if (KEY_LEFT_BRACKET == intValue) {
        KEY_LEFT_BRACKET_ISTRUE = 1;
    }
    if (KEY_RIGHT_BRACKET == intValue) {
        KEY_RIGHT_BRACKET_ISTRUE = 1;
    }
    if (KEY_BACKSLASH == intValue) {
        KEY_BACKSLASH_ISTRUE = 1;
    }
    if (KEY_SEMICOLON == intValue) {
        KEY_SEMICOLON_ISTRUE = 1;
    }
    if (KEY_SLASH == intValue) {
        KEY_SLASH_ISTRUE = 1;
    }
    if (KEY_AT == intValue) {
        KEY_AT_ISTRUE = 1;
    }
    return nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetKeyCodeEvent_KEY_APOSTROPHE",
         nullptr, GetKeyCodeEvent_KEY_APOSTROPHE, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_GRAVE",
         nullptr, GetKeyCodeEvent_KEY_GRAVE, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_MINUS",
         nullptr, GetKeyCodeEvent_KEY_MINUS, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_EQUALS",
         nullptr, GetKeyCodeEvent_KEY_EQUALS, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_LEFT_BRACKET",
         nullptr, GetKeyCodeEvent_KEY_LEFT_BRACKET, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_RIGHT_BRACKET",
         nullptr, GetKeyCodeEvent_KEY_RIGHT_BRACKET, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_BACKSLASH",
         nullptr, GetKeyCodeEvent_KEY_BACKSLASH, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_SEMICOLON",
         nullptr, GetKeyCodeEvent_KEY_SEMICOLON, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_SLASH",
         nullptr, GetKeyCodeEvent_KEY_SLASH, nullptr, nullptr, nullptr, napi_default, nullptr},
                {"GetKeyCodeEvent_KEY_AT",
         nullptr, GetKeyCodeEvent_KEY_AT, nullptr, nullptr, nullptr, napi_default, nullptr},
        
        {"InitKeyMonitor",
         nullptr, InitKeyMonitor, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "keycodendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
