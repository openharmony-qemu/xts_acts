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
#include "callback_risk_common.h"

static void ExecuteCreateObject(napi_env env, void *data) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value object = nullptr;
    RecordStatus(probe, napi_create_object(env, &object));
  }
}

static void ExecuteSleep(napi_env env, void *data) {
  std::this_thread::sleep_for(std::chrono::seconds(3));
}
static void CompleteDeleteWorkAndRef(napi_env env, napi_status status,
                                     void *data) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    if (probe->work != nullptr) {
      RecordStatus(probe, napi_delete_async_work(env, probe->work));
    }
    DeleteRefRisk(env, probe);
    delete probe;
  }
}

static void CompleteCreateObject(napi_env env, napi_status status, void *data) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value object = nullptr;
    RecordStatus(probe, napi_create_object(env, &object));
    if (probe->work != nullptr) {
      napi_delete_async_work(env, probe->work);
    }
    delete probe;
  }
}

static bool QueueAsyncWork(napi_env env, napi_async_execute_callback execute,
                           napi_async_complete_callback complete,
                           CallbackRiskProbe *probe) {
  napi_value name = nullptr;
  napi_create_string_utf8(env, "callbackRiskAsyncWork", NAPI_AUTO_LENGTH,
                          &name);
  napi_status status = napi_create_async_work(env, nullptr, name, execute,
                                              complete, probe, &probe->work);
  if (status != napi_ok || probe->work == nullptr) {
    delete probe;
    return false;
  }
  status = napi_queue_async_work(env, probe->work);
  if (status != napi_ok) {
    napi_delete_async_work(env, probe->work);
    delete probe;
    return false;
  }
  return true;
}

static napi_value TsfnTarget(napi_env env, napi_callback_info info) {
  napi_value undefined = nullptr;
  napi_get_undefined(env, &undefined);
  return undefined;
}

static void CallJsCallFunction(napi_env env, napi_value jsCallback,
                               void *context, void *data) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(context);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
  }
  if (env != nullptr && jsCallback != nullptr) {
    napi_value undefined = nullptr;
    RecordStatus(probe, napi_get_undefined(env, &undefined));
    RecordStatus(probe, napi_call_function(env, undefined, jsCallback, 0,
                                           nullptr, nullptr));
  }
}

static void CallJsGetUndefined(napi_env env, napi_value jsCallback,
                               void *context, void *data) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(context);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value undefined = nullptr;
    RecordStatus(probe, napi_get_undefined(env, &undefined));
  }
}

static void FinalizeCreateTsfn(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value func = nullptr;
    napi_value name = nullptr;
    if (probe->ref != nullptr) {
      RecordStatus(probe, napi_get_reference_value(env, probe->ref, &func));
    }
    RecordStatus(probe, napi_create_string_utf8(env, "tsfnInFinalize",
                                                NAPI_AUTO_LENGTH, &name));
    napi_threadsafe_function newTsfn = nullptr;
    if (func != nullptr) {
      RecordStatus(probe, napi_create_threadsafe_function(
                              env, func, nullptr, name, 0, 1, nullptr, nullptr,
                              nullptr, CallJsCallFunction, &newTsfn));
    }
    if (newTsfn != nullptr) {
      napi_release_threadsafe_function(newTsfn, napi_tsfn_release);
    }
    if (probe->ref != nullptr) {
      napi_delete_reference(env, probe->ref);
    }
    delete probe;
  }
}

static void FinalizeDeleteRef(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    DeleteRefRisk(env, probe);
    delete probe;
  }
}

static bool CreateTsfn(napi_env env, napi_threadsafe_function_call_js callJs,
                       napi_finalize finalizeCb, CallbackRiskProbe *probe,
                       napi_threadsafe_function *tsfn) {
  napi_value func = nullptr;
  napi_value name = nullptr;
  napi_create_function(env, "tsfnTarget", NAPI_AUTO_LENGTH, TsfnTarget, nullptr,
                       &func);
  napi_create_string_utf8(env, "callbackRiskTsfn", NAPI_AUTO_LENGTH, &name);
  if (finalizeCb == FinalizeCreateTsfn) {
    probe->ref = CreateStrongRef(env, func);
  } else if (finalizeCb == FinalizeDeleteRef) {
    probe->ref = CreateStrongRef(env, func);
  }
  napi_status status = napi_create_threadsafe_function(
      env, func, nullptr, name, 0, 1, probe, finalizeCb, probe, callJs, tsfn);
  return status == napi_ok && *tsfn != nullptr;
}

static napi_value Risk024(napi_env env, napi_callback_info info) {
  ResetRiskState(24);
  auto *probe = new CallbackRiskProbe();
  probe->id = 24;
  probe->env = env;
  return RiskResult(env, QueueAsyncWork(env, ExecuteCreateObject,
                                        CompleteDeleteWorkAndRef, probe));
}

static napi_value Risk025(napi_env env, napi_callback_info info) {
  napi_value object = nullptr;
  napi_create_object(env, &object);
  ResetRiskState(25);
  auto *probe = new CallbackRiskProbe();
  probe->id = 25;
  probe->env = env;
  probe->ref = CreateStrongRef(env, object);
  return RiskResult(
      env, QueueAsyncWork(env, ExecuteSleep, CompleteDeleteWorkAndRef, probe));
}

static napi_value Risk026(napi_env env, napi_callback_info info) {
  ResetRiskState(26);
  auto *probe = new CallbackRiskProbe();
  probe->id = 26;
  probe->env = env;
  return RiskResult(
      env, QueueAsyncWork(env, ExecuteSleep, CompleteCreateObject, probe));
}

static napi_value Risk026PendingDestroyRuntime(napi_env env,
                                               napi_callback_info info) {
  ResetRiskState(26);
  bool ok = RunWithArkRuntimeInNativeThread(26, [](napi_env arkEnv) {
    auto *probe = new CallbackRiskProbe();
    probe->id = 26;
    probe->env = arkEnv;
    bool queued =
        QueueAsyncWork(arkEnv, ExecuteSleep, CompleteCreateObject, probe);
    if (!queued) {
      return false;
    }
    MarkRiskCalled(26);
    return true;
  });
  return RiskResult(env, ok);
}

static napi_value Risk027(napi_env env, napi_callback_info info) {
  ResetRiskState(27);
  auto *probe = new CallbackRiskProbe();
  probe->id = 27;
  napi_threadsafe_function tsfn = nullptr;
  bool ok = CreateTsfn(env, CallJsCallFunction, nullptr, probe, &tsfn);
  if (ok) {
    ok = napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_blocking) ==
         napi_ok;
    ok = napi_release_threadsafe_function(tsfn, napi_tsfn_release) == napi_ok &&
         ok;
  } else {
    delete probe;
  }
  return RiskResult(env, ok);
}

static napi_value Risk028(napi_env env, napi_callback_info info) {
  ResetRiskState(28);
  auto *probe = new CallbackRiskProbe();
  probe->id = 28;
  napi_threadsafe_function tsfn = nullptr;
  bool ok = CreateTsfn(env, CallJsGetUndefined, nullptr, probe, &tsfn);
  if (ok) {
    napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_nonblocking);
    ok = napi_release_threadsafe_function(tsfn, napi_tsfn_abort) == napi_ok;
  } else {
    delete probe;
  }
  return RiskResult(env, ok);
}

static napi_value Risk029(napi_env env, napi_callback_info info) {
  ResetRiskState(29);
  auto *probe = new CallbackRiskProbe();
  probe->id = 29;
  napi_threadsafe_function tsfn = nullptr;
  bool ok =
      CreateTsfn(env, CallJsCallFunction, FinalizeCreateTsfn, probe, &tsfn);
  if (ok) {
    ok = napi_release_threadsafe_function(tsfn, napi_tsfn_release) == napi_ok;
  } else {
    delete probe;
  }
  return RiskResult(env, ok);
}

static napi_value Risk030(napi_env env, napi_callback_info info) {
  ResetRiskState(30);
  bool ok = RunWithArkRuntimeInNativeThread(30, [](napi_env arkEnv) {
    auto *probe = new CallbackRiskProbe();
    probe->id = 30;
    probe->env = arkEnv;
    napi_threadsafe_function tsfn = nullptr;
    bool innerOk =
        CreateTsfn(arkEnv, CallJsCallFunction, FinalizeDeleteRef, probe, &tsfn);
    if (innerOk) {
      napi_status status = napi_unref_threadsafe_function(arkEnv, tsfn);
      RecordRiskStatus(30, status);
      innerOk = status == napi_ok;
      // Do not release. Strictly match active TSFN during env teardown.
    } else {
      delete probe;
    }
    return innerOk;
  });
  return RiskResult(env, ok);
}

napi_value RegisterAsyncRisk(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("risk024", Risk024),
      DECLARE_NAPI_FUNCTION("risk025", Risk025),
      DECLARE_NAPI_FUNCTION("risk026", Risk026),
      DECLARE_NAPI_FUNCTION("risk026PendingDestroyRuntime",
                            Risk026PendingDestroyRuntime),
      DECLARE_NAPI_FUNCTION("risk027", Risk027),
      DECLARE_NAPI_FUNCTION("risk028", Risk028),
      DECLARE_NAPI_FUNCTION("risk029", Risk029),
      DECLARE_NAPI_FUNCTION("risk030", Risk030),
  };
  napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
  return exports;
}
