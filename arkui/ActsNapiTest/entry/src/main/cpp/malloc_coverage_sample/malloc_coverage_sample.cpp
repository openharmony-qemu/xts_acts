/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "common/native_common.h"
#include "malloc.h"
#include "napi/native_api.h"
#include <cstdlib>

static constexpr size_t REQUEST_SIZE = 64;

static napi_status SetIntProperty(napi_env env, napi_value object,
                                  const char *name, int32_t number) {
  napi_value value = nullptr;
  napi_status createStatus = napi_create_int32(env, number, &value);
  if (createStatus != napi_ok) {
    return createStatus;
  }
  return napi_set_named_property(env, object, name, value);
}

static napi_status SetBoolProperty(napi_env env, napi_value object,
                                   const char *name, bool boolValue) {
  napi_value value = nullptr;
  napi_status createStatus = napi_get_boolean(env, boolValue, &value);
  if (createStatus != napi_ok) {
    return createStatus;
  }
  return napi_set_named_property(env, object, name, value);
}

static napi_value CreateResultObject(napi_env env) {
  napi_value result = nullptr;
  napi_status status = napi_create_object(env, &result);
  if (status != napi_ok) {
    return nullptr;
  }
  return result;
}

static napi_value TestMallocCoverage(napi_env env, napi_callback_info info) {
  void *ptr = malloc(REQUEST_SIZE);
  size_t usableSize = 0;
  int allocatedCheck = -1;
  int stackCheck = -1;
  bool allocationSucceeded = ptr != nullptr;
  bool usableSizeAtLeastRequested = false;

  if (ptr != nullptr) {
    usableSize = malloc_usable_size(ptr);
    usableSizeAtLeastRequested = usableSize >= REQUEST_SIZE;
    allocatedCheck = malloc_check_from_ptr(ptr);
  }

  int stackValue = 0;
  stackCheck = malloc_check_from_ptr(&stackValue);
  int malloptResult = mallopt(M_FLUSH_THREAD_CACHE, 0);

  free(ptr);

  napi_value result = CreateResultObject(env);
  if (result == nullptr) {
    return Ret(env, 0);
  }
  SetBoolProperty(env, result, "allocationSucceeded", allocationSucceeded);
  SetIntProperty(env, result, "usableSize", static_cast<int32_t>(usableSize));
  SetBoolProperty(env, result, "usableSizeAtLeastRequested",
                  usableSizeAtLeastRequested);
  SetIntProperty(env, result, "malloptResult", malloptResult);
  SetIntProperty(env, result, "allocatedCheck", allocatedCheck);
  SetIntProperty(env, result, "stackCheck", stackCheck);
  return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("testMallocCoverage", TestMallocCoverage),
  };
  NAPI_CALL(env, napi_define_properties(env, exports,
                                        sizeof(desc) / sizeof(desc[0]), desc));
  return exports;
}
EXTERN_C_END

static napi_module mallocCoverageSampleModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libmalloccoveragesamplendktest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void
RegisterMallocCoverageSampleModule(void) {
  napi_module_register(&mallocCoverageSampleModule);
}
