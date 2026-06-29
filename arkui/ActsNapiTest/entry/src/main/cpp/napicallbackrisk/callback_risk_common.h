/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
#ifndef CALLBACK_RISK_COMMON_H
#define CALLBACK_RISK_COMMON_H

#include "napi/native_api.h"
#include "native_common.h"

#include <atomic>
#include <chrono>
#include <cstdint>
#include <cstring>
#include <thread>

constexpr int32_t RISK_PASS = 1;
constexpr int32_t RISK_FAIL = 0;
constexpr int32_t RISK_PENDING = -1000;
constexpr int32_t RISK_STATE_MAX_ID = 63;

struct CallbackRiskState {
  std::atomic<int32_t> called{0};
  std::atomic<int32_t> napiStatus{RISK_PENDING};
};

inline CallbackRiskState *GetRiskStates() {
  static CallbackRiskState states[RISK_STATE_MAX_ID + 1];
  return states;
}

inline void ResetRiskState(int32_t id) {
  if (id >= 0 && id <= RISK_STATE_MAX_ID) {
    GetRiskStates()[id].called.store(0);
    GetRiskStates()[id].napiStatus.store(RISK_PENDING);
  }
}

inline void MarkRiskCalled(int32_t id) {
  if (id >= 0 && id <= RISK_STATE_MAX_ID) {
    GetRiskStates()[id].called.fetch_add(1);
  }
}

inline void RecordRiskStatus(int32_t id, napi_status status) {
  if (id >= 0 && id <= RISK_STATE_MAX_ID) {
    GetRiskStates()[id].napiStatus.store(static_cast<int32_t>(status));
  }
}

struct CallbackRiskProbe {
  int32_t id = 0;
  napi_env env = nullptr;
  napi_ref ref = nullptr;
  napi_ref secondRef = nullptr;
  napi_async_work work = nullptr;
  napi_threadsafe_function tsfn = nullptr;
  napi_critical_scope scope = nullptr;
  std::atomic<int32_t> called{0};
  std::atomic<int32_t> napiStatus{napi_ok};
  bool deleteOnFinalize = true;
};

inline napi_value RiskResult(napi_env env, bool ok) {
  return Ret(env, ok ? RISK_PASS : RISK_FAIL);
}

inline void RecordStatus(CallbackRiskProbe *probe, napi_status status) {
  if (probe != nullptr) {
    RecordRiskStatus(probe->id, status);
    if (status != napi_ok) {
      probe->napiStatus.store(status);
    }
  }
}

inline void MarkProbeCalled(CallbackRiskProbe *probe) {
  if (probe != nullptr) {
    probe->called.fetch_add(1);
    MarkRiskCalled(probe->id);
  }
}

inline void DeleteRefRisk(napi_env env, CallbackRiskProbe *probe) {
  if (probe != nullptr && probe->ref != nullptr) {
    RecordStatus(probe, napi_delete_reference(env, probe->ref));
  }
}

inline napi_ref CreateStrongRef(napi_env env, napi_value value) {
  napi_ref ref = nullptr;
  napi_create_reference(env, value, 1, &ref);
  return ref;
}

inline napi_ref CreateWeakRef(napi_env env, napi_value value) {
  napi_ref ref = nullptr;
  napi_create_reference(env, value, 0, &ref);
  return ref;
}

template <typename Callback>
inline bool RunWithArkRuntimeInNativeThread(int32_t id, Callback callback) {
  bool ok = false;
  std::thread worker([&ok, id, callback]() {
    napi_env arkEnv = nullptr;
    napi_status status = napi_create_ark_runtime(&arkEnv);
    if (status != napi_ok || arkEnv == nullptr) {
      RecordRiskStatus(id, status);
      ok = false;
      return;
    }

    ok = callback(arkEnv);
    status = napi_destroy_ark_runtime(&arkEnv);
    RecordRiskStatus(id, status);
    ok = ok && status == napi_ok;
  });
  worker.join();
  return ok;
}

#endif // CALLBACK_RISK_COMMON_H
