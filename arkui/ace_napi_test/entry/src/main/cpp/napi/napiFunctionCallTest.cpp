/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
#include "common/native_common.h"
#include <string>
#include <mutex>
#include <thread>
#include <chrono>

class MyObject {
public:
    static void Destructor(napi_env env, void* nativeObject, void* finalizeHint);
    static napi_value New(napi_env env, napi_callback_info info);
    explicit MyObject(double value = 0);
    ~MyObject();

private:
    double value;
    napi_env env;
    napi_ref wrapper;
};
MyObject::MyObject(double value) : value(value), env(nullptr), wrapper(nullptr) {}
MyObject::~MyObject()
{
    napi_delete_reference(env, wrapper);
}

void MyObject::Destructor(napi_env env,
                          void* nativeObject,
                          [[maybe_unused]] void* finalizeHint)
{
    delete reinterpret_cast<MyObject*>(nativeObject);
}


napi_value MyObject::New(napi_env env, napi_callback_info info)
{
    napi_value newTarget;
    napi_get_new_target(env, info, &newTarget);
    if (newTarget != nullptr) {
        size_t argc = 1;
        napi_value args[1];
        napi_value jsThis;
        napi_get_cb_info(env, info, &argc, args, &jsThis, nullptr);
        double value = 0.0;
        napi_valuetype valuetype;
        napi_typeof(env, args[0], &valuetype);
        if (valuetype != napi_undefined) {
            napi_get_value_double(env, args[0], &value);
        }
        MyObject* obj = new MyObject(value);
        obj->env_ = env;
        napi_status status = napi_wrap(env,
                                       jsThis,
                                       reinterpret_cast<void*>(obj),
                                       MyObject::Destructor,
                                       nullptr,
                                       &obj->wrapper_);
        if (status != napi_ok) {
            delete obj;
            return jsThis;
        }
        uint32_t refCount = 0;
        napi_reference_unref(env, obj->wrapper_, &refCount);
        return jsThis;
    } else {
        size_t argc = 1;
        napi_value args[1];
        napi_value jsThis = nullptr;
        napi_get_cb_info(env, info, &argc, args, &jsThis, nullptr);
        napi_value cons;
        const char* constructorName = "MyObject";
        napi_get_named_property(env, jsThis, constructorName, &cons);
        napi_value instance;
        napi_new_instance(env, cons, argc, args, &instance);
        return instance;
    }
}

static napi_value NapiDefineClass(napi_env env, napi_callback_info info)
{
    napi_property_descriptor properties[] = {};
    napi_value cons;
    napi_define_class(env, "MyObject", NAPI_AUTO_LENGTH, MyObject::New, nullptr, 0, properties, &cons);
    return cons;
}


napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value NapiCreateFunction(napi_env env, napi_callback_info info)
{
    napi_value fn = nullptr;
    napi_create_function(env, nullptr, 0, Add, nullptr, &fn);
    return fn;
}

static napi_value NativeMultiply(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double a = 0;
    double b = 0;
    napi_get_value_double(env, args[0], &a);
    napi_get_value_double(env, args[1], &b);

    napi_value result;
    napi_create_double(env, a * b, &result);
    return result;
}

static napi_value CallArkTS(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value arktsFunc = nullptr;
    napi_get_cb_info(env, info, &argc, &arktsFunc, nullptr, nullptr);

    napi_value args[2];
    double num1 = 5.0;
    double num2 = 3.0;
    napi_create_double(env, num1, &args[0]);
    napi_create_double(env, num2, &args[1]);

    napi_value global;
    napi_get_global(env, &global);
    
    napi_value result;
    size_t num3 = 2;
    napi_call_function(env, global, arktsFunc, num3, args, &result);
    
    return result;
}

static napi_value NativeAdd(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    double a = 0;
    double b = 0;
    napi_get_value_double(env, args[0], &a);
    napi_get_value_double(env, args[1], &b);

    napi_value result;
    napi_create_double(env, a + b, &result);
    return result;
}

static napi_value GetAddFunc(napi_env env, napi_callback_info info)
{
    napi_value func;
    napi_create_function(env, "add", NAPI_AUTO_LENGTH, NativeAdd, nullptr, &func);
    return func;
}

static napi_value CreateAndCallInOneFunc(napi_env env, napi_callback_info info)
{
    napi_value createdFunc;

    napi_create_function(env, "dynamicFunc", NAPI_AUTO_LENGTH, 
        [](napi_env env, napi_callback_info info) -> napi_value {
            size_t argc = 1;
            napi_value arg = nullptr;
            napi_get_cb_info(env, info, &argc, &arg, nullptr, nullptr);
            
            double val = 0;
            napi_get_value_double(env, arg, &val);
            
            napi_value result;
            napi_create_double(env, val * 2, &result);
            return result;
        }, nullptr, &createdFunc);

    napi_value callArg;
    double testNum = 10.5;
    napi_create_double(env, testNum, &callArg);

    napi_value global;
    napi_get_global(env, &global);

    napi_value callResult;
    napi_call_function(env, global, createdFunc, 1, &callArg, &callResult);

    napi_value resultObj;
    napi_create_object(env, &resultObj);

    napi_set_named_property(env, resultObj, "func", createdFunc);
    
    napi_set_named_property(env, resultObj, "result", callResult);
    
    return resultObj;
}

napi_value CallChain(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value arktsFunc = nullptr;
    napi_get_cb_info(env, info, &argc, &arktsFunc, nullptr, nullptr);
    
    napi_value global;
    napi_get_global(env, &global);
    
    napi_value result;

    napi_value initialArg;
    size_t srcNum = 5;
    napi_create_int32(env, srcNum, &initialArg);

    size_t forNum = 3;
    size_t argcNum = 1;
    napi_value currentArg = initialArg;    
    for (int i = 0; i < forNum; i++) {
        auto status = napi_call_function(env, global, arktsFunc, argcNum, &currentArg, &result);
        if (status != napi_ok) {
            return nullptr;
        }
        currentArg = result;
    }
    return result;
}

static napi_value RunScriptPath(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    if (argc < 1 || args[0] == nullptr) {
        napi_throw_error(env, nullptr, "Default export function failed");
        return nullptr;
    }

    napi_value global;
    napi_get_global(env, &global);
    napi_value result;
    napi_status status = napi_call_function(env, global, args[0], 0, nullptr, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to call the default function");
        return nullptr;
    }

    char resultStr[10];
    size_t result_len;
    status = napi_get_value_string_utf8(env, result, resultStr, sizeof(resultStr), &result_len);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to napi_get_value_string_utf8");
        return nullptr;
    }
    
    if (strcmp(resultStr, "num:2") != 0) {
        napi_throw_error(env, nullptr, "Failed to Result");
        return nullptr;
    }

    napi_value rst;
    bool bRet = true;
    napi_get_boolean(env, bRet, &rst);
    return rst;
}

static napi_ref g_testObjRef = nullptr;

static napi_value GetGlobalObject(napi_env env)
{
    napi_value globalObj = nullptr;
    napi_status status = napi_get_global(env, &globalObj);
    if (status != napi_ok || globalObj == nullptr) {
        napi_throw_error(env, nullptr, "Failed to obtain the global object");
        return nullptr;
    }
    return globalObj;
}

static napi_value CreateSafeString(napi_env env, const std::string& str)
{
    napi_value strVal = nullptr;
    napi_status status = napi_create_string_utf8(env,
                                                 str.c_str(),
                                                 str.length(),
                                                 &strVal
    );
    if (status != napi_ok || strVal == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create a string");
        return nullptr;
    }
    return strVal;
}

static napi_value CreateTestObject(napi_env env)
{
    napi_value obj = nullptr;
    napi_status status = napi_create_object(env, &obj);
    if (status != napi_ok || obj == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create test object");
        return nullptr;
    }

    napi_value valueProp = nullptr;
    status = napi_create_int32(env, 88, &valueProp);
    if (status != napi_ok || valueProp == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create initial value");
        return nullptr;
    }
    status = napi_set_named_property(env, obj, "_value", valueProp);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to set private variable");
        return nullptr;
    }

    napi_value getterFunc = nullptr;
    status = napi_create_function(
        env,
        "valueGetter",
        NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisObj = nullptr;
            size_t argc = 0;
            napi_status status = napi_get_cb_info(env,
                                                  info,
                                                  &argc,
                                                  nullptr,
                                                  &thisObj,
                                                  nullptr
            );
            NAPI_ASSERT(env, status == napi_ok, "napi_get_cb_info status is ok");
            NAPI_ASSERT(env, thisObj != nullptr, "Failed to get this with Getter");

            napi_value valueVal = nullptr;
            status = napi_get_named_property(env, thisObj, "_value", &valueVal);
            NAPI_ASSERT(env, status == napi_ok, "napi_get_named_property status is ok");
            NAPI_ASSERT(env, valueVal != nullptr, "Failed to read private variable");

            int32_t value = 0;
            status = napi_get_value_int32(env, valueVal, &value);
            NAPI_ASSERT(env, status == napi_ok, "napi_get_value_int32 status is ok");

            int32_t newVal = value + 1;
            napi_value newValProp = nullptr;
            status = napi_create_int32(env, newVal, &newValProp);
            NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 status is ok");
            NAPI_ASSERT(env, newValProp != nullptr, "Failed to create a new value");

            status = napi_set_named_property(env, thisObj, "_value", newValProp);
            NAPI_ASSERT(env, status == napi_ok, "napi_set_named_property status is ok");
        
            return valueVal;
        },
        nullptr,
        &getterFunc
    );

    NAPI_ASSERT(env, status == napi_ok, "Failed to create a Getter function1");
    NAPI_ASSERT(env, getterFunc != nullptr, "Failed to create a Getter function2");

    napi_value globalObj = GetGlobalObject(env);
    NAPI_ASSERT(env, globalObj != nullptr, "Failed to create a Getter function2");

    napi_value objectCtor = nullptr;
    status = napi_get_named_property(env, globalObj, "Object", &objectCtor);
    NAPI_ASSERT(env, status == napi_ok, "napi_get_named_property status is ok");
    NAPI_ASSERT(env, objectCtor != nullptr, "Failed to obtain the Object constructor");

    napi_value definePropFunc = nullptr;
    status = napi_get_named_property(env, objectCtor, "defineProperty", &definePropFunc);
    if (status != napi_ok || definePropFunc == nullptr) {
        napi_throw_error(env, nullptr, "Failed to get defineProperty");
        return nullptr;
    }
    
    napi_value propDescObj = nullptr;
    status = napi_create_object(env, &propDescObj);
    if (status != napi_ok || propDescObj == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create property descriptor");
        return nullptr;
    }
    status = napi_set_named_property(env, propDescObj, "get", getterFunc);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to bind the getter to the descriptor");
        return nullptr;
    }
    
    napi_value propName = CreateSafeString(env, "value");
    if (propName == nullptr) {
        return nullptr;
    }

    napi_value args[3] = {obj, propName, propDescObj};
    
    napi_value defineResult = nullptr;
    size_t argcNum = 3;
    status = napi_call_function(env,
                                objectCtor,
                                definePropFunc,
                                argcNum,
                                args,
                                &defineResult
    );
    NAPI_ASSERT(env, status == napi_ok, "Failed to call defineProperty");

    if (g_testObjRef != nullptr) {
        napi_delete_reference(env, g_testObjRef);
    }
    size_t refNum = 1;
    status = napi_create_reference(env, obj, refNum, &g_testObjRef);
    NAPI_ASSERT(env, status == napi_ok, "Failed to create object reference");

    return obj;
}

static napi_value CallGetter(napi_env env, napi_callback_info info)
{
    napi_value testObj = nullptr;
    if (g_testObjRef == nullptr) {
        testObj = CreateTestObject(env);
        if (testObj == nullptr) {
            return nullptr;
        }
    } else {
        napi_status status = napi_get_reference_value(env, g_testObjRef, &testObj);
        if (status != napi_ok || testObj == nullptr) {
            napi_throw_error(env, nullptr, "Failed to obtain object from reference");

            testObj = CreateTestObject(env);
            if (testObj == nullptr) {
                return nullptr;
            }
        }
    }
    
    napi_value getterResult = nullptr;
    napi_status status = napi_ok;
    
    napi_valuetype objType = napi_undefined;
    status = napi_typeof(env, testObj, &objType);
    if (status != napi_ok || objType != napi_object) {
        napi_throw_error(env, nullptr, "The test object is not of Object type");
        return nullptr;
    }
    size_t retryNum = 2;
    for (int retry = 0; retry < retryNum; retry++) {
        status = napi_get_named_property(env, testObj, "value", &getterResult);
        if (status == napi_ok && getterResult != nullptr) {
            break;
        }

        if (retry == 0 && status != napi_ok) {
            napi_delete_reference(env, g_testObjRef);
            g_testObjRef = nullptr;
            testObj = CreateTestObject(env);
            if (testObj == nullptr) {
                break;
            }
        }
    }

    if (status != napi_ok || getterResult == nullptr) {
        napi_throw_error(env, nullptr, "Failed to call Getter (to retrieve the value property)");
        return nullptr;
    }
    
    int32_t resultVal = 0;
    status = napi_get_value_int32(env, getterResult, &resultVal);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse the return value of the Getter");
        return nullptr;
    }
    const int32_t expectedVal = 88;
    bool isValueCorrect = (resultVal == expectedVal);
    
    napi_value modifiedValProp = nullptr;
    status = napi_get_named_property(env, testObj, "_value", &modifiedValProp);
    if (status != napi_ok || modifiedValProp == nullptr) {
        napi_throw_error(env, nullptr, "Failed to read the modified _value");
        return nullptr;
    }
    int32_t modifiedVal = 0;
    status = napi_get_value_int32(env, modifiedValProp, &modifiedVal);
    NAPI_ASSERT(env, status == napi_ok, "parse the modified _value sucess");

    size_t comNum = 89;
    NAPI_ASSERT(env, modifiedVal == comNum, "compare the modified _value sucess");

    napi_value rst;
    napi_get_boolean(env, isValueCorrect, &rst);
    return rst;
}

static napi_ref g_testObjRef1 = nullptr;

static napi_value GetGlobalObject1(napi_env env)
{
    napi_value globalObj = nullptr;
    napi_status status = napi_get_global(env, &globalObj);
    if (status != napi_ok || globalObj == nullptr) {
        napi_throw_error(env, nullptr, "Failed to obtain the global object");
        return nullptr;
    }
    return globalObj;
}

static napi_value CreateSafeString1(napi_env env, const std::string& str)
{
    napi_value strVal = nullptr;
    napi_status status = napi_create_string_utf8(env,
                                                 str.c_str(),
                                                 str.length(),
                                                 &strVal
    );
    if (status != napi_ok || strVal == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create string");
        return nullptr;
    }
    return strVal;
}

static napi_value CreateTestObject1(napi_env env)
{
    napi_value obj = nullptr;
    napi_status status = napi_create_object(env, &obj);
    if (status != napi_ok || obj == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create test object");
        return nullptr;
    }
    
    napi_value initVal = nullptr;
    status = napi_create_int32(env, 0, &initVal);
    if (status != napi_ok || initVal == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create initial value");
        return nullptr;
    }
    status = napi_set_named_property(env, obj, "_value", initVal);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to set the initial value");
        return nullptr;
    }

    napi_value setterFunc = nullptr;
    status = napi_create_function(
        env,
        "valueSetter",
        NAPI_AUTO_LENGTH,
        [](napi_env env, napi_callback_info info) -> napi_value {
            napi_value thisObj = nullptr;
            size_t argc = 1;
            napi_value args[1] = {nullptr};
            napi_status status = napi_get_cb_info(env, info, &argc, args, &thisObj, nullptr);
            if (status != napi_ok || thisObj == nullptr || argc < 1 || args[0] == nullptr) {
                napi_throw_error(env, nullptr, "Setter failed to obtain parameter/this");
                return nullptr;
            }

            int32_t newVal = 0;
            status = napi_get_value_int32(env, args[0], &newVal);
            if (status != napi_ok) {
                napi_throw_error(env, nullptr, "Failed to parse the new value of Setter");
                return nullptr;
            }

            napi_value oldValProp = nullptr;
            status = napi_get_named_property(env, thisObj, "_value", &oldValProp);
            if (status != napi_ok || oldValProp == nullptr) {
                napi_throw_error(env, nullptr, "Failed to read the old value");
                return nullptr;
            }
            int32_t oldVal = 0;
            napi_get_value_int32(env, oldValProp, &oldVal);
        
            int32_t finalVal = newVal * 2;
            napi_value finalValProp = nullptr;
            status = napi_create_int32(env, finalVal, &finalValProp);
            if (status != napi_ok || finalValProp == nullptr) {
                napi_throw_error(env, nullptr, "Failed to create the final value");
                return nullptr;
            }
            status = napi_set_named_property(env, thisObj, "_value", finalValProp);
            if (status != napi_ok) {
                napi_throw_error(env, nullptr, "Failed to set the final value");
                return nullptr;
            }
        
            napi_value undefinedVal = nullptr;
            napi_get_undefined(env, &undefinedVal);
            return undefinedVal;
        },
        nullptr, &setterFunc);
    if (status != napi_ok || setterFunc == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create a setter function");
        return nullptr;
    }
    
    napi_value globalObj = GetGlobalObject1(env);
    if (globalObj == nullptr) {
        return nullptr;
    }
    
    napi_value objectCtor = nullptr;
    status = napi_get_named_property(env, globalObj, "Object", &objectCtor);
    if (status != napi_ok || objectCtor == nullptr) {
        napi_throw_error(env, nullptr, "Failed to obtain the Object constructor");
        return nullptr;
    }

    napi_value definePropFunc = nullptr;
    status = napi_get_named_property(env, objectCtor, "defineProperty", &definePropFunc);
    if (status != napi_ok || definePropFunc == nullptr) {
        napi_throw_error(env, nullptr, "Failed to get defineProperty");
        return nullptr;
    }
    
    napi_value propDescObj = nullptr;
    status = napi_create_object(env, &propDescObj);
    if (status != napi_ok || propDescObj == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create property descriptor");
        return nullptr;
    }
    status = napi_set_named_property(env, propDescObj, "set", setterFunc);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to bind Setter to descriptor");
        return nullptr;
    }
    
    napi_value propName = CreateSafeString1(env, "value");
    if (propName == nullptr){
        return nullptr;
    }

    napi_value args[3] = {obj, propName, propDescObj};
    size_t argcNum = 3;
    napi_value defineResult = nullptr;
    status = napi_call_function(env,
                                objectCtor,
                                definePropFunc,
                                argcNum,
                                args,
                                &defineResult
    );
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to call defineProperty");
        return nullptr;
    }
    
    if (g_testObjRef1 != nullptr) {
        napi_delete_reference(env, g_testObjRef1);
    }
    status = napi_create_reference(env, obj, 1, &g_testObjRef1);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create object reference");
        return nullptr;
    }

    return obj;
}

static napi_value CallSetter(napi_env env, napi_callback_info info)
{
    napi_value testObj = nullptr;
    if (g_testObjRef1 == nullptr) {
        testObj = CreateTestObject1(env);
        if (testObj == nullptr) {
            return nullptr;
        }
    } else {
        napi_status status = napi_get_reference_value(env, g_testObjRef1, &testObj);
        if (status != napi_ok || testObj == nullptr) {
            napi_throw_error(env, nullptr, "Failed to obtain object from reference");
            testObj = CreateTestObject1(env);
            if (testObj == nullptr) {
                return nullptr;
            }
        }
    }

    napi_valuetype objType = napi_undefined;
    napi_status status = napi_typeof(env, testObj, &objType);
    if (status != napi_ok || objType != napi_object) {
        napi_throw_error(env, nullptr, "The test object is not of Object type");
        return nullptr;
    }

    napi_value setVal = nullptr;
    size_t testNum = 10;
    status = napi_create_int32(env, testNum, &setVal);
    if (status != napi_ok || setVal == nullptr) {
        napi_throw_error(env, nullptr, "Failed to create a setter method for assignment");
        return nullptr;
    }

    napi_status setStatus = napi_ok;
    size_t num = 2;
    for (int retry = 0; retry < num; retry++) {
        setStatus = napi_set_named_property(env, testObj, "value", setVal);
        if (setStatus == napi_ok) {
            break;
        }

        if (retry == 0 && setStatus != napi_ok) {
            napi_delete_reference(env, g_testObjRef1);
            g_testObjRef1 = nullptr;
            testObj = CreateTestObject1(env);
            if (testObj == nullptr) {
                break;
            }
        }
    }

    if (setStatus != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to call Setter (set value property)");
        return nullptr;
    }

    napi_value modifiedValProp = nullptr;
    status = napi_get_named_property(env, testObj, "_value", &modifiedValProp);
    if (status != napi_ok || modifiedValProp == nullptr) {
        napi_throw_error(env, nullptr, "Failed to read the modified _value");
        return nullptr;
    }
    int32_t modifiedVal = 0;
    status = napi_get_value_int32(env, modifiedValProp, &modifiedVal);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse the modified _value");
        return nullptr;
    }

    const int32_t expectedVal = 20;
    bool isValueCorrect = (modifiedVal == expectedVal);
    NAPI_ASSERT(env, isValueCorrect, "modifiedVal != expectedVal");

    napi_value rst;
    napi_get_boolean(env, isValueCorrect, &rst);
    return rst;
}

// Context structure: Stores deferred and environment (thread-safe)
struct PromiseContext {
    napi_env env = nullptr;
    napi_deferred deferred = nullptr;
    std::mutex mutex;
    bool isResolved = false;
};

// Auxiliary function: Clean up the context (release resources)
static void CleanupContext(PromiseContext* ctx)
{
    if (ctx == nullptr) {
        return;
    }
    std::lock_guard<std::mutex> lock(ctx->mutex);
    ctx->deferred = nullptr;
    ctx->isResolved = true;
    ctx->env = nullptr;
    delete ctx;
}

static napi_value CreatePromiseResolve(napi_env env, napi_callback_info info)
{
    // Create a context and save the deferred
    PromiseContext* ctx = new PromiseContext();
    ctx->env = env;

    // Create a Promise and obtain a deferred object
    napi_value promise = nullptr;
    napi_status status = napi_create_promise(env, &ctx->deferred, &promise);
    if (status != napi_ok || !ctx->deferred) {
        napi_throw_error(env, nullptr, "Native failed to create a Promise");
        CleanupContext(ctx);
        return nullptr;
    }

    std::thread asyncTaskThread([=]() {
        try {
            // Simulate asynchronous tasks: network requests, file reading and writing (with a delay of 1 second here)
            std::this_thread::sleep_for(std::chrono::seconds(1));

            std::lock_guard<std::mutex> lock(ctx->mutex);
            // Verify the validity of the context (to prevent duplicate resolves)
            if (ctx->isResolved || !ctx->deferred || !ctx->env) {
                return;
            }

            // Asynchronous work is completed, call resolve to return the result
            napi_value resolveResult = CreateSafeString(ctx->env, "native_async_task_success");
            napi_resolve_deferred(ctx->env, ctx->deferred, resolveResult);
        } catch (...) {
            // Exception handling: If an asynchronous task encounters an error, call reject
            std::lock_guard<std::mutex> lock(ctx->mutex);
            if (!ctx->isResolved && ctx->deferred && ctx->env) {
                napi_value rejectResult = CreateSafeString(ctx->env, "native_async_task_error");
                napi_reject_deferred(ctx->env, ctx->deferred, rejectResult);
            }
        }

        // Clean up context resources
        CleanupContext(ctx);
    });
    asyncTaskThread.detach();

    // return Promise to ets
    return promise;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "napiCreateFunction", nullptr, NapiCreateFunction, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeMultiply", nullptr, NativeMultiply, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "callArkTS", nullptr, CallArkTS, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getAddFunc", nullptr, GetAddFunc, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createAndCallInOneFunc", nullptr, CreateAndCallInOneFunc, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "callChain", nullptr, CallChain, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runScriptPath", nullptr, RunScriptPath, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "napiDefineClass", nullptr, NapiDefineClass, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "callGetter", nullptr, CallGetter, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "callSetter", nullptr, CallSetter, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "createPromiseResolve", nullptr, CreatePromiseResolve, nullptr, nullptr, nullptr, napi_default, nullptr },

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
    .nm_modname = "napifunctioncalltest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}