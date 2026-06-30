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

static void InstanceDeleteRefFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    DeleteRefRisk(env, probe);
    if (probe->deleteOnFinalize) {
      delete probe;
    }
  }
}

static void InstanceCreateObjectFinalizer(napi_env env, void *data,
                                          void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value object = nullptr;
    RecordStatus(probe, napi_create_object(env, &object));
    if (probe->deleteOnFinalize) {
      delete probe;
    }
  }
}

static void InstanceCreateDeleteRefFinalizer(napi_env env, void *data,
                                             void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value object = nullptr;
    RecordStatus(probe, napi_create_object(env, &object));
    if (object != nullptr) {
      napi_ref ref = nullptr;
      RecordStatus(probe, napi_create_reference(env, object, 1, &ref));
      if (ref != nullptr) {
        RecordStatus(probe, napi_delete_reference(env, ref));
      }
    }
    if (probe->deleteOnFinalize) {
      delete probe;
    }
  }
}

static void InstanceNoopFinalizer(napi_env env, void *data, void *hint) {
  delete reinterpret_cast<CallbackRiskProbe *>(data);
}

static void CleanupDeleteRefHook(void *arg) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(arg);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    DeleteRefRisk(probe->env, probe);
    delete probe;
  }
}

static void CleanupAsyncExecute(napi_env env, void *data) {}

static void CleanupAsyncComplete(napi_env env, napi_status status, void *data) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    if (probe->work != nullptr) {
      RecordStatus(probe, napi_delete_async_work(env, probe->work));
    }
    delete probe;
  }
}

static void CleanupQueueAsyncWorkHook(void *arg) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(arg);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value name = nullptr;
    RecordStatus(probe, napi_create_string_utf8(probe->env, "cleanupAsyncWork",
                                                NAPI_AUTO_LENGTH, &name));
    RecordStatus(probe, napi_create_async_work(
                            probe->env, nullptr, name, CleanupAsyncExecute,
                            CleanupAsyncComplete, probe, &probe->work));
    if (probe->work != nullptr) {
      RecordStatus(probe, napi_queue_async_work(probe->env, probe->work));
    }
  }
}

static void AsyncCleanupNoDoneHook(napi_async_cleanup_hook_handle handle,
                                   void *arg) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(arg);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    RecordRiskStatus(7, napi_ok);
  }
  // Strict risk action: do not remove/complete this async cleanup hook.
}

static napi_value CleanupTsfnJsCallback(napi_env env, napi_callback_info info) {
  napi_value undefined = nullptr;
  napi_get_undefined(env, &undefined);
  return undefined;
}

static void CleanupTsfnCallJs(napi_env env, napi_value jsCallback,
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

static void CleanupTsfnFinalize(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    delete probe;
  }
}

static void AsyncCleanupCreateTsfnHook(napi_async_cleanup_hook_handle handle,
                                       void *arg) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(arg);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value func = nullptr;
    napi_value name = nullptr;
    RecordStatus(
        probe, napi_create_function(probe->env, "cleanupTsfn", NAPI_AUTO_LENGTH,
                                    CleanupTsfnJsCallback, nullptr, &func));
    RecordStatus(probe, napi_create_string_utf8(probe->env, "cleanupTsfn",
                                                NAPI_AUTO_LENGTH, &name));
    RecordStatus(probe, napi_create_threadsafe_function(
                            probe->env, func, nullptr, name, 0, 1, probe,
                            CleanupTsfnFinalize, probe, CleanupTsfnCallJs,
                            &probe->tsfn));
    if (probe->tsfn != nullptr) {
      RecordStatus(probe, napi_call_threadsafe_function(probe->tsfn, nullptr,
                                                        napi_tsfn_nonblocking));
      RecordStatus(probe, napi_release_threadsafe_function(probe->tsfn,
                                                           napi_tsfn_release));
    }
  }
  if (handle != nullptr) {
    napi_remove_async_cleanup_hook(handle);
  }
}

static bool CreateObjectRef(napi_env env, CallbackRiskProbe *probe) {
  napi_value object = nullptr;
  if (napi_create_object(env, &object) != napi_ok || object == nullptr) {
    return false;
  }
  probe->ref = CreateStrongRef(env, object);
  return probe->ref != nullptr;
}

static napi_value Risk001(napi_env env, napi_callback_info info) {
  ResetRiskState(1);
  bool ok = RunWithArkRuntimeInNativeThread(1, [](napi_env arkEnv) {
    auto *probe = new CallbackRiskProbe();
    probe->id = 1;
    probe->env = arkEnv;
    CreateObjectRef(arkEnv, probe);
    napi_status status = napi_set_instance_data(
        arkEnv, probe, InstanceDeleteRefFinalizer, nullptr);
    if (status != napi_ok) {
      delete probe;
      return false;
    }
    return true;
  });
  return RiskResult(env, ok && GetRiskStates()[1].called.load() > 0);
}

static napi_value Risk002(napi_env env, napi_callback_info info) {
  ResetRiskState(2);
  bool ok = RunWithArkRuntimeInNativeThread(2, [](napi_env arkEnv) {
    auto *probe = new CallbackRiskProbe();
    probe->id = 2;
    probe->env = arkEnv;
    napi_status status = napi_set_instance_data(
        arkEnv, probe, InstanceCreateObjectFinalizer, nullptr);
    if (status != napi_ok) {
      delete probe;
      return false;
    }
    return true;
  });
  return RiskResult(env, ok && GetRiskStates()[2].called.load() > 0);
}

static napi_value Risk003(napi_env env, napi_callback_info info) {
  ResetRiskState(3);
  bool oldCalled = false;
  bool ok = RunWithArkRuntimeInNativeThread(3, [&oldCalled](napi_env arkEnv) {
    auto *oldProbe = new CallbackRiskProbe();
    oldProbe->id = 3;
    oldProbe->env = arkEnv;
    oldProbe->deleteOnFinalize = false;
    napi_status status = napi_set_instance_data(
        arkEnv, oldProbe, InstanceCreateDeleteRefFinalizer, nullptr);
    if (status != napi_ok) {
      delete oldProbe;
      return false;
    }
    auto *newProbe = new CallbackRiskProbe();
    newProbe->id = 3;
    newProbe->env = arkEnv;
    status = napi_set_instance_data(arkEnv, newProbe, InstanceNoopFinalizer,
                                    nullptr);
    oldCalled = oldProbe->called.load() > 0;
    delete oldProbe;
    if (status != napi_ok) {
      delete newProbe;
      return false;
    }
    return true;
  });
  return RiskResult(env,
                    ok && oldCalled && GetRiskStates()[3].called.load() > 0);
}

static napi_value Risk003CurrentEnvControl(napi_env env,
                                           napi_callback_info info) {
  ResetRiskState(3);
  auto *oldProbe = new CallbackRiskProbe();
  oldProbe->id = 3;
  oldProbe->env = env;
  oldProbe->deleteOnFinalize = false;
  napi_status status = napi_set_instance_data(
      env, oldProbe, InstanceCreateDeleteRefFinalizer, nullptr);
  if (status != napi_ok) {
    delete oldProbe;
    return RiskResult(env, false);
  }
  auto *newProbe = new CallbackRiskProbe();
  newProbe->id = 3;
  newProbe->env = env;
  status =
      napi_set_instance_data(env, newProbe, InstanceNoopFinalizer, nullptr);
  bool oldCalled = oldProbe->called.load() > 0;
  delete oldProbe;
  if (status != napi_ok) {
    delete newProbe;
    return RiskResult(env, false);
  }
  napi_status clearStatus =
      napi_set_instance_data(env, nullptr, nullptr, nullptr);
  return RiskResult(env, status == napi_ok && clearStatus == napi_ok &&
                             oldCalled && GetRiskStates()[3].called.load() > 0);
}

static napi_value Risk003RuntimeRefControl(napi_env env,
                                           napi_callback_info info) {
  ResetRiskState(3);
  bool ok = RunWithArkRuntimeInNativeThread(3, [](napi_env arkEnv) {
    MarkRiskCalled(3);
    bool innerOk = true;
    napi_value object = nullptr;
    napi_status status = napi_create_object(arkEnv, &object);
    RecordRiskStatus(3, status);
    innerOk = status == napi_ok && object != nullptr;
    if (object != nullptr) {
      napi_ref ref = nullptr;
      status = napi_create_reference(arkEnv, object, 1, &ref);
      RecordRiskStatus(3, status);
      innerOk = innerOk && status == napi_ok && ref != nullptr;
      if (ref != nullptr) {
        status = napi_delete_reference(arkEnv, ref);
        RecordRiskStatus(3, status);
        innerOk = innerOk && status == napi_ok;
      }
    }
    return innerOk;
  });
  return RiskResult(env, ok && GetRiskStates()[3].called.load() > 0);
}

static napi_value Risk005(napi_env env, napi_callback_info info) {
  ResetRiskState(5);
  bool ok = RunWithArkRuntimeInNativeThread(5, [](napi_env arkEnv) {
    auto *probe = new CallbackRiskProbe();
    probe->id = 5;
    probe->env = arkEnv;
    CreateObjectRef(arkEnv, probe);
    napi_status status =
        napi_add_env_cleanup_hook(arkEnv, CleanupDeleteRefHook, probe);
    if (status != napi_ok) {
      delete probe;
      return false;
    }
    return true;
  });
  return RiskResult(env, ok && GetRiskStates()[5].called.load() > 0);
}

static napi_value Risk006(napi_env env, napi_callback_info info) {
  ResetRiskState(6);
  bool ok = RunWithArkRuntimeInNativeThread(6, [](napi_env arkEnv) {
    auto *probe = new CallbackRiskProbe();
    probe->id = 6;
    probe->env = arkEnv;
    napi_status status =
        napi_add_env_cleanup_hook(arkEnv, CleanupQueueAsyncWorkHook, probe);
    if (status != napi_ok) {
      delete probe;
      return false;
    }
    return true;
  });
  return RiskResult(env, ok && GetRiskStates()[6].called.load() > 0);
}

static napi_value Risk007(napi_env env, napi_callback_info info) {
  ResetRiskState(7);
  std::thread([]() {
    napi_env arkEnv = nullptr;
    if (napi_create_ark_runtime(&arkEnv) != napi_ok || arkEnv == nullptr) {
      return;
    }
    auto *probe = new CallbackRiskProbe();
    probe->id = 7;
    probe->env = arkEnv;
    napi_async_cleanup_hook_handle handle = nullptr;
    if (napi_add_async_cleanup_hook(arkEnv, AsyncCleanupNoDoneHook, probe,
                                    &handle) != napi_ok) {
      delete probe;
      napi_destroy_ark_runtime(&arkEnv);
      return;
    }
    napi_destroy_ark_runtime(&arkEnv);
  }).detach();
  for (int32_t i = 0; i < 20; i++) {
    if (GetRiskStates()[7].called.load() > 0) {
      return RiskResult(env, true);
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(50));
  }
  return RiskResult(env, GetRiskStates()[7].called.load() > 0);
}

static napi_value Risk008(napi_env env, napi_callback_info info) {
  ResetRiskState(8);
  bool ok = RunWithArkRuntimeInNativeThread(8, [](napi_env arkEnv) {
    auto *probe = new CallbackRiskProbe();
    probe->id = 8;
    probe->env = arkEnv;
    napi_async_cleanup_hook_handle handle = nullptr;
    napi_status status = napi_add_async_cleanup_hook(
        arkEnv, AsyncCleanupCreateTsfnHook, probe, &handle);
    if (status != napi_ok) {
      delete probe;
      return false;
    }
    return true;
  });
  return RiskResult(env, ok && GetRiskStates()[8].called.load() > 0);
}

napi_value RegisterLifecycleRisk(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("risk001", Risk001),
      DECLARE_NAPI_FUNCTION("risk002", Risk002),
      DECLARE_NAPI_FUNCTION("risk003", Risk003),
      DECLARE_NAPI_FUNCTION("risk003CurrentEnvControl",
                            Risk003CurrentEnvControl),
      DECLARE_NAPI_FUNCTION("risk003RuntimeRefControl",
                            Risk003RuntimeRefControl),
      DECLARE_NAPI_FUNCTION("risk005", Risk005),
      DECLARE_NAPI_FUNCTION("risk006", Risk006),
      DECLARE_NAPI_FUNCTION("risk007", Risk007),
      DECLARE_NAPI_FUNCTION("risk008", Risk008),
  };
  napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
  return exports;
}
