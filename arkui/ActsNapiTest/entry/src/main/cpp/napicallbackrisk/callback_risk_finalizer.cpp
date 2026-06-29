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

static void WrapDeleteOtherRefFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    DeleteRefRisk(env, probe);
    delete probe;
  }
  delete reinterpret_cast<int32_t *>(data);
}

static void WrapDeleteSameRefFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    // Strictly match NAPI-CB-RISK-010: delete the same reference again.
    DeleteRefRisk(env, probe);
    delete probe;
  }
  delete reinterpret_cast<int32_t *>(data);
}

static void CreateObjectFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value object = nullptr;
    RecordStatus(probe, napi_create_object(env, &object));
    delete probe;
  }
  delete reinterpret_cast<int32_t *>(data);
}

static void ExternalGetValueFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value value = nullptr;
    if (probe->ref != nullptr) {
      RecordStatus(probe, napi_get_reference_value(env, probe->ref, &value));
      if (value != nullptr) {
        void *out = nullptr;
        RecordStatus(probe, napi_get_value_external(env, value, &out));
      }
    }
    delete probe;
  }
  delete reinterpret_cast<int32_t *>(data);
}

static void ArrayBufferInfoFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value value = nullptr;
    if (probe->ref != nullptr) {
      void *buffer = nullptr;
      size_t length = 0;
      RecordStatus(probe, napi_get_reference_value(env, probe->ref, &value));
      if (value != nullptr) {
        RecordStatus(probe,
                     napi_get_arraybuffer_info(env, value, &buffer, &length));
      }
    }
    delete probe;
  }
  delete[] reinterpret_cast<uint8_t *>(data);
}

static void BufferInfoFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value value = nullptr;
    if (probe->ref != nullptr) {
      void *buffer = nullptr;
      size_t length = 0;
      RecordStatus(probe, napi_get_reference_value(env, probe->ref, &value));
      if (value != nullptr) {
        RecordStatus(probe, napi_get_buffer_info(env, value, &buffer, &length));
      }
    }
    delete probe;
  }
  delete[] reinterpret_cast<uint8_t *>(data);
}

static void ExternalStringCreateValueFinalizer(void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value object = nullptr;
    RecordStatus(probe, napi_create_object(probe->env, &object));
    delete probe;
  }
  delete[] reinterpret_cast<char16_t *>(data);
}

static void AddFinalizerAgain(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value object = nullptr;
    napi_create_object(env, &object);
    auto *nextData = new int32_t(2101);
    RecordStatus(probe,
                 napi_add_finalizer(env, object, nextData,
                                    CreateObjectFinalizer, nullptr, nullptr));
    delete probe;
  }
  delete reinterpret_cast<int32_t *>(data);
}

static void SendableUnwrapFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value value = nullptr;
    if (probe->ref != nullptr) {
      void *nativeObject = nullptr;
      RecordStatus(probe, napi_get_reference_value(env, probe->ref, &value));
      if (value != nullptr) {
        RecordStatus(probe, napi_unwrap_sendable(env, value, &nativeObject));
      }
    }
    delete probe;
  }
  delete reinterpret_cast<int32_t *>(data);
}

static void SendableCreateArrayFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value array = nullptr;
    RecordStatus(probe, napi_create_sendable_array(env, &array));
    delete probe;
  }
  delete reinterpret_cast<int32_t *>(data);
}

struct RemoveWrapSpecData {
  bool finalized = false;
};

static void RemoveWrapSpecFinalizer(napi_env env, void *data, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  auto *specData = reinterpret_cast<RemoveWrapSpecData *>(data);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    RecordStatus(probe, napi_ok);
  }
  if (specData != nullptr) {
    specData->finalized = true;
  }
}

static void RemoveWrapSendableSpecFinalizer(napi_env env, void *data,
                                            void *hint) {
  MarkRiskCalled(47);
  RecordRiskStatus(47, napi_generic_failure);
}

struct RemoveWrapSendableDiagData {
  int32_t id = 0;
  bool finalized = false;
};

static RemoveWrapSendableDiagData *g_keepAliveSendableData = nullptr;
static napi_ref g_keepAliveSendableRef = nullptr;

static void RemoveWrapSendableDiagFinalizer(napi_env env, void *data,
                                            void *hint) {
  auto *diagData = reinterpret_cast<RemoveWrapSendableDiagData *>(data);
  int32_t id = diagData != nullptr ? diagData->id : 49;
  MarkRiskCalled(id);
  RecordRiskStatus(id, data == nullptr ? napi_invalid_arg : napi_ok);
  if (diagData != nullptr) {
    diagData->finalized = true;
    if (diagData == g_keepAliveSendableData) {
      g_keepAliveSendableData = nullptr;
    }
    delete diagData;
  }
}

static napi_value Risk009(napi_env env, napi_callback_info info) {
  napi_value object = nullptr;
  napi_value other = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  NAPI_CALL(env, napi_create_object(env, &other));
  ResetRiskState(9);
  auto *probe = new CallbackRiskProbe();
  probe->id = 9;
  probe->ref = CreateStrongRef(env, other);
  auto *data = new int32_t(9);
  napi_status status =
      napi_wrap(env, object, data, WrapDeleteOtherRefFinalizer, probe, nullptr);
  if (status != napi_ok) {
    delete data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk010(napi_env env, napi_callback_info info) {
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  ResetRiskState(10);
  auto *probe = new CallbackRiskProbe();
  probe->id = 10;
  probe->ref = CreateStrongRef(env, object);
  auto *data = new int32_t(10);
  napi_status status =
      napi_wrap(env, object, data, WrapDeleteSameRefFinalizer, probe, nullptr);
  if (status == napi_ok && probe->ref != nullptr) {
    // Keep probe->ref unchanged intentionally; finalizer will try deleting the
    // same ref again.
    status = napi_delete_reference(env, probe->ref);
  }
  if (status != napi_ok) {
    delete data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk011(napi_env env, napi_callback_info info) {
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  ResetRiskState(11);
  auto *probe = new CallbackRiskProbe();
  probe->id = 11;
  auto *data = new int32_t(11);
  napi_status status =
      napi_wrap_enhance(env, object, data, CreateObjectFinalizer, false, probe,
                        sizeof(int32_t), nullptr);
  if (status != napi_ok) {
    delete data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk012(napi_env env, napi_callback_info info) {
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  ResetRiskState(12);
  auto *probe = new CallbackRiskProbe();
  probe->id = 12;
  auto *data = new int32_t(12);
  napi_status status =
      napi_wrap_enhance(env, object, data, CreateObjectFinalizer, true, probe,
                        sizeof(int32_t), nullptr);
  if (status != napi_ok) {
    delete data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk015(napi_env env, napi_callback_info info) {
  auto *data = new int32_t(15);
  ResetRiskState(15);
  auto *probe = new CallbackRiskProbe();
  probe->id = 15;
  napi_value external = nullptr;
  napi_status status = napi_create_external(
      env, data, ExternalGetValueFinalizer, probe, &external);
  if (status == napi_ok && external != nullptr) {
    probe->ref = CreateWeakRef(env, external);
  } else {
    delete data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk018(napi_env env, napi_callback_info info) {
  auto *data = new uint8_t[16];
  ResetRiskState(18);
  auto *probe = new CallbackRiskProbe();
  probe->id = 18;
  napi_value arrayBuffer = nullptr;
  napi_status status = napi_create_external_arraybuffer(
      env, data, 16, ArrayBufferInfoFinalizer, probe, &arrayBuffer);
  if (status == napi_ok && arrayBuffer != nullptr) {
    probe->ref = CreateWeakRef(env, arrayBuffer);
  } else {
    delete[] data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk019(napi_env env, napi_callback_info info) {
  auto *data = new uint8_t[16];
  ResetRiskState(19);
  auto *probe = new CallbackRiskProbe();
  probe->id = 19;
  napi_value buffer = nullptr;
  napi_status status = napi_create_external_buffer(
      env, 16, data, BufferInfoFinalizer, probe, &buffer);
  if (status == napi_ok && buffer != nullptr) {
    probe->ref = CreateWeakRef(env, buffer);
  } else {
    delete[] data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk020(napi_env env, napi_callback_info info) {
  auto *text = new char16_t[5]{u't', u'e', u's', u't', 0};
  ResetRiskState(20);
  auto *probe = new CallbackRiskProbe();
  probe->id = 20;
  probe->env = env;
  napi_value value = nullptr;
  napi_status status = napi_create_external_string_utf16(
      env, text, 4, ExternalStringCreateValueFinalizer, probe, &value);
  if (status != napi_ok) {
    delete[] text;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk021(napi_env env, napi_callback_info info) {
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  auto *data = new int32_t(21);
  ResetRiskState(21);
  auto *probe = new CallbackRiskProbe();
  probe->id = 21;
  napi_status status =
      napi_add_finalizer(env, object, data, AddFinalizerAgain, probe, nullptr);
  if (status != napi_ok) {
    delete data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk022(napi_env env, napi_callback_info info) {
  napi_value object = nullptr;
  napi_status status =
      napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
  if (status != napi_ok || object == nullptr) {
    return RiskResult(env, false);
  }
  auto *data = new int32_t(22);
  ResetRiskState(22);
  auto *probe = new CallbackRiskProbe();
  probe->id = 22;
  probe->ref = CreateWeakRef(env, object);
  status =
      napi_wrap_sendable(env, object, data, SendableUnwrapFinalizer, probe);
  if (status != napi_ok) {
    delete data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk023(napi_env env, napi_callback_info info) {
  napi_value object = nullptr;
  napi_status status =
      napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
  if (status != napi_ok || object == nullptr) {
    return RiskResult(env, false);
  }
  auto *data = new int32_t(23);
  ResetRiskState(23);
  auto *probe = new CallbackRiskProbe();
  probe->id = 23;
  status = napi_wrap_sendable_with_size(
      env, object, data, SendableCreateArrayFinalizer, probe, sizeof(int32_t));
  if (status != napi_ok) {
    delete data;
    delete probe;
  }
  return RiskResult(env, status == napi_ok);
}

static napi_value RemoveWrapCallsFinalizer(napi_env env,
                                           napi_callback_info info) {
  constexpr int32_t id = 46;
  ResetRiskState(id);
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  auto *probe = new CallbackRiskProbe();
  probe->id = id;
  auto *data = new RemoveWrapSpecData();
  napi_status status =
      napi_wrap(env, object, data, RemoveWrapSpecFinalizer, probe, nullptr);
  if (status != napi_ok) {
    delete data;
    delete probe;
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  void *removed = nullptr;
  status = napi_remove_wrap(env, object, &removed);
  RecordRiskStatus(id, status);
  bool ok = status == napi_ok && removed == data && data->finalized &&
            GetRiskStates()[id].called.load() > 0;
  delete data;
  delete probe;
  return RiskResult(env, ok);
}

static napi_value SendableWrapFinalizerAfterGc(napi_env env,
                                               napi_callback_info info) {
  constexpr int32_t id = 48;
  ResetRiskState(id);
  napi_value object = nullptr;
  napi_status status =
      napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
  if (status != napi_ok || object == nullptr) {
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  auto *data = new RemoveWrapSendableDiagData();
  data->id = id;
  status = napi_wrap_sendable(env, object, data,
                              RemoveWrapSendableDiagFinalizer, nullptr);
  RecordRiskStatus(id, status);
  if (status != napi_ok) {
    delete data;
    return RiskResult(env, false);
  }
  return RiskResult(env, true);
}

static napi_value
RemoveWrapSendableDoesNotCallFinalizer(napi_env env, napi_callback_info info) {
  constexpr int32_t id = 47;
  ResetRiskState(id);
  napi_value object = nullptr;
  napi_status status =
      napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
  if (status != napi_ok || object == nullptr) {
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  auto *data = new int32_t(id);
  status = napi_wrap_sendable(env, object, data,
                              RemoveWrapSendableSpecFinalizer, nullptr);
  if (status != napi_ok) {
    delete data;
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  void *removed = nullptr;
  status = napi_remove_wrap_sendable(env, object, &removed);
  RecordRiskStatus(id, status);
  bool ok = status == napi_ok && removed == data &&
            GetRiskStates()[id].called.load() == 0;
  delete reinterpret_cast<int32_t *>(removed);
  return RiskResult(env, ok);
}

static napi_value
RemoveWrapSendableNoManualDeleteProbe(napi_env env, napi_callback_info info) {
  constexpr int32_t id = 49;
  ResetRiskState(id);
  napi_value object = nullptr;
  napi_status status =
      napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
  if (status != napi_ok || object == nullptr) {
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  auto *data = new RemoveWrapSendableDiagData();
  data->id = id;
  status = napi_wrap_sendable(env, object, data,
                              RemoveWrapSendableDiagFinalizer, nullptr);
  if (status != napi_ok) {
    delete data;
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  void *removed = nullptr;
  status = napi_remove_wrap_sendable(env, object, &removed);
  RecordRiskStatus(id, status);
  bool ok = status == napi_ok && removed == data &&
            GetRiskStates()[id].called.load() == 0;
  if (!ok) {
    delete data;
  }
  return RiskResult(env, ok);
}

static napi_value RemoveWrapSendableNoGcWaitProbe(napi_env env,
                                                  napi_callback_info info) {
  constexpr int32_t id = 51;
  ResetRiskState(id);
  napi_value object = nullptr;
  napi_status status =
      napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
  if (status != napi_ok || object == nullptr) {
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  auto *data = new RemoveWrapSendableDiagData();
  data->id = id;
  status = napi_wrap_sendable(env, object, data,
                              RemoveWrapSendableDiagFinalizer, nullptr);
  if (status != napi_ok) {
    delete data;
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  void *removed = nullptr;
  status = napi_remove_wrap_sendable(env, object, &removed);
  RecordRiskStatus(id, status);
  bool ok = status == napi_ok && removed == data &&
            GetRiskStates()[id].called.load() == 0;
  if (!ok) {
    delete data;
  }
  return RiskResult(env, ok);
}

static napi_value
RemoveWrapSendableKeepObjectAliveProbe(napi_env env, napi_callback_info info) {
  constexpr int32_t id = 50;
  ResetRiskState(id);
  if (g_keepAliveSendableRef != nullptr) {
    napi_delete_reference(env, g_keepAliveSendableRef);
    g_keepAliveSendableRef = nullptr;
  }
  if (g_keepAliveSendableData != nullptr) {
    // Keep old native data for its potential delayed finalizer. Deleting it
    // here would turn a later callback into a use-after-free probe instead.
    g_keepAliveSendableData = nullptr;
  }

  napi_value object = nullptr;
  napi_status status =
      napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
  if (status != napi_ok || object == nullptr) {
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  auto *data = new RemoveWrapSendableDiagData();
  data->id = id;
  status = napi_wrap_sendable(env, object, data,
                              RemoveWrapSendableDiagFinalizer, nullptr);
  if (status != napi_ok) {
    delete data;
    RecordRiskStatus(id, status);
    return RiskResult(env, false);
  }

  void *removed = nullptr;
  status = napi_remove_wrap_sendable(env, object, &removed);
  if (status == napi_ok && removed == data) {
    g_keepAliveSendableData = data;
    g_keepAliveSendableRef = CreateStrongRef(env, object);
  }
  RecordRiskStatus(id, status);
  bool ok = status == napi_ok && removed == data &&
            g_keepAliveSendableRef != nullptr &&
            GetRiskStates()[id].called.load() == 0;
  if (!ok) {
    delete data;
    g_keepAliveSendableData = nullptr;
  }
  return RiskResult(env, ok);
}

static napi_value CleanupRemoveWrapSendableKeepAlive(napi_env env,
                                                     napi_callback_info info) {
  if (g_keepAliveSendableRef != nullptr) {
    napi_delete_reference(env, g_keepAliveSendableRef);
    g_keepAliveSendableRef = nullptr;
  }
  return RiskResult(env, true);
}

napi_value RegisterFinalizerRisk(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("risk009", Risk009),
      DECLARE_NAPI_FUNCTION("risk010", Risk010),
      DECLARE_NAPI_FUNCTION("risk011", Risk011),
      DECLARE_NAPI_FUNCTION("risk012", Risk012),
      DECLARE_NAPI_FUNCTION("risk015", Risk015),
      DECLARE_NAPI_FUNCTION("risk018", Risk018),
      DECLARE_NAPI_FUNCTION("risk019", Risk019),
      DECLARE_NAPI_FUNCTION("risk020", Risk020),
      DECLARE_NAPI_FUNCTION("risk021", Risk021),
      DECLARE_NAPI_FUNCTION("risk022", Risk022),
      DECLARE_NAPI_FUNCTION("risk023", Risk023),
      DECLARE_NAPI_FUNCTION("removeWrapCallsFinalizer",
                            RemoveWrapCallsFinalizer),
      DECLARE_NAPI_FUNCTION("sendableWrapFinalizerAfterGc",
                            SendableWrapFinalizerAfterGc),
      DECLARE_NAPI_FUNCTION("removeWrapSendableDoesNotCallFinalizer",
                            RemoveWrapSendableDoesNotCallFinalizer),
      DECLARE_NAPI_FUNCTION("removeWrapSendableNoManualDeleteProbe",
                            RemoveWrapSendableNoManualDeleteProbe),
      DECLARE_NAPI_FUNCTION("removeWrapSendableNoGcWaitProbe",
                            RemoveWrapSendableNoGcWaitProbe),
      DECLARE_NAPI_FUNCTION("removeWrapSendableKeepObjectAliveProbe",
                            RemoveWrapSendableKeepObjectAliveProbe),
      DECLARE_NAPI_FUNCTION("cleanupRemoveWrapSendableKeepAlive",
                            CleanupRemoveWrapSendableKeepAlive),
  };
  napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
  return exports;
}
