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

#ifndef FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_COMMON_H
#define FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_COMMON_H

/* ---------------------------------------------------------------------------
 * Basic annotations and versioning
 * ------------------------------------------------------------------------- */

/* Marks a declaration as deprecated so the compiler warns on every use. */
#define DEPRECATED __attribute__((__deprecated__))

/* NAPI API level this module is built against. */
#define NAPI_VERSION 8

/* Placeholder returned by helper macros whose failure path returns nothing. */
#define NAPI_RETVAL_NOTHING

/* ---------------------------------------------------------------------------
 * Error handling helpers
 * ------------------------------------------------------------------------- */

/*
 * Reads the last NAPI error of env and, when no exception is pending yet,
 * throws it as a JavaScript error.
 */
#define GET_AND_THROW_LAST_ERROR(env)                                                                   \
    do {                                                                                                \
        const napi_extended_error_info* errorInfo = nullptr;                                            \
        napi_get_last_error_info((env), &errorInfo);                                                    \
        bool isPending = false;                                                                         \
        napi_is_exception_pending((env), &isPending);                                                   \
        if (!isPending && errorInfo != nullptr) {                                                       \
            const char* errorMessage =                                                                  \
                errorInfo->error_message != nullptr ? errorInfo->error_message : "empty error message"; \
            napi_throw_error((env), nullptr, errorMessage);                                             \
        }                                                                                               \
    } while (0)

/*
 * Core assertion helper: throws a JavaScript error carrying the failed
 * assertion text and returns retVal when the assertion does not hold.
 */
#define NAPI_ASSERT_BASE(env, assertion, message, retVal)                                    \
    do {                                                                                     \
        if (!(assertion)) {                                                                  \
            napi_throw_error((env), nullptr, "assertion (" #assertion ") failed: " message); \
            return retVal;                                                                   \
        }                                                                                    \
    } while (0)

/* Asserts a condition; returns nullptr from the enclosing function on failure. */
#define NAPI_ASSERT(env, assertion, message) NAPI_ASSERT_BASE(env, assertion, message, nullptr)

/* Asserts a condition; returns from the enclosing void function on failure. */
#define NAPI_ASSERT_RETURN_VOID(env, assertion, message) \
    NAPI_ASSERT_BASE(env, assertion, message, NAPI_RETVAL_NOTHING)

/*
 * Core call helper: executes theCall and, when it does not return napi_ok,
 * throws the pending NAPI error and returns retVal.
 */
#define NAPI_CALL_BASE(env, theCall, retVal) \
    do {                                     \
        if ((theCall) != napi_ok) {          \
            GET_AND_THROW_LAST_ERROR((env)); \
            return retVal;                   \
        }                                    \
    } while (0)

/* Executes a NAPI call; returns nullptr from the enclosing function on failure. */
#define NAPI_CALL(env, theCall) NAPI_CALL_BASE(env, theCall, nullptr)

/* Executes a NAPI call; returns from the enclosing void function on failure. */
#define NAPI_CALL_RETURN_VOID(env, theCall) NAPI_CALL_BASE(env, theCall, NAPI_RETVAL_NOTHING)

/* ---------------------------------------------------------------------------
 * Property descriptor shorthands
 * ------------------------------------------------------------------------- */

/* Declares a plain property whose value is provided directly. */
#define DECLARE_NAPI_PROPERTY(name, val)                                       \
    {                                                                          \
        (name), nullptr, nullptr, nullptr, nullptr, val, napi_default, nullptr \
    }

/* Declares a static property whose value is provided directly. */
#define DECLARE_NAPI_STATIC_PROPERTY(name, val)                               \
    {                                                                         \
        (name), nullptr, nullptr, nullptr, nullptr, val, napi_static, nullptr \
    }

/* Declares an instance function implemented by func. */
#define DECLARE_NAPI_FUNCTION(name, func)                                         \
    {                                                                             \
        (name), nullptr, (func), nullptr, nullptr, nullptr, napi_default, nullptr \
    }

/* Declares an instance function that additionally carries user data. */
#define DECLARE_NAPI_FUNCTION_WITH_DATA(name, func, data)                         \
    {                                                                             \
        (name), nullptr, (func), nullptr, nullptr, nullptr, napi_default, data    \
    }

/* Declares a static function implemented by func. */
#define DECLARE_NAPI_STATIC_FUNCTION(name, func)                                 \
    {                                                                            \
        (name), nullptr, (func), nullptr, nullptr, nullptr, napi_static, nullptr \
    }

/* Declares a property whose value is produced by getter. */
#define DECLARE_NAPI_GETTER(name, getter)                                           \
    {                                                                               \
        (name), nullptr, nullptr, (getter), nullptr, nullptr, napi_default, nullptr \
    }

/* Declares a property whose value is stored through setter. */
#define DECLARE_NAPI_SETTER(name, setter)                                           \
    {                                                                               \
        (name), nullptr, nullptr, nullptr, (setter), nullptr, napi_default, nullptr \
    }

/* Declares a property combining getter and setter accessors. */
#define DECLARE_NAPI_GETTER_SETTER(name, getter, setter)                             \
    {                                                                                \
        (name), nullptr, nullptr, (getter), (setter), nullptr, napi_default, nullptr \
    }

#endif /* FOUNDATION_ACE_NAPI_INTERFACES_KITS_NAPI_NATIVE_COMMON_H */
