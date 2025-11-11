/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <sys/stat.h>
#include <sys/types.h>
#include <string>

#include "common.h"
#include "database/rdb/oh_rdb_crypto_param.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/relational_store.h"

OH_Rdb_Store *storeTestRdbStore_;
OH_Rdb_Store *predicatesTestRdbStore_;
const char *RDB_TEST_PATH = "/data/storage/el2/database/com.example.buchongndktest/entry/";
const char *RDB_TEST_PATH1 = "/data/storage/el2/database";
static napi_value OH_Rdb_Predicates_NotLike0100(napi_env env, napi_callback_info)
{
    const char *data5Value = "BBCD%";
    auto ret = OH_Predicates_NotLike(nullptr, "data5", data5Value);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_NotLike is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_Predicates_Glob0100(napi_env env, napi_callback_info)
{
    const char *data5Value = "aBCD*";
    auto ret = OH_Predicates_Glob(nullptr, "data5", data5Value);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Glob is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_Predicates_NotGlob0100(napi_env env, napi_callback_info)
{
    const char *data5Value = "aBCD*";
    auto ret = OH_Predicates_NotGlob(nullptr, "data5", data5Value);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_NotGlob is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_Predicates_Having0100(napi_env env, napi_callback_info)
{
      auto ret = OH_Predicates_Having(nullptr, "data5", nullptr);
      NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Having is fail.");
      napi_value result;
      napi_create_int32(env, 0, &result);
      return result;
}


static napi_value OH_Rdb_SetCryptoParam0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *confg = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, confg != nullptr, "OH_Predicates_Having is fail.");

    OH_Rdb_CryptoParam *crypto = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, crypto != NULL, "OH_Predicates_Having is fail.");

    auto ret = OH_Rdb_SetCryptoParam(nullptr, crypto);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Having is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_InsertWithConflictResolution0100(napi_env env, napi_callback_info)
{
    OH_Rdb_Store *store = storeTestRdbStore_;
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    int64_t rowId = 0;
    int errCode = OH_Rdb_InsertWithConflictResolution(nullptr, "store_test", valueBucket, RDB_CONFLICT_ROLLBACK, &rowId);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_InsertWithConflictResolution is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_UpdateWithConflictResolution0100(napi_env env, napi_callback_info)
{
    OH_Rdb_Store *store = storeTestRdbStore_;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    NAPI_ASSERT(env, predicates != NULL, "OH_Rdb_CreatePredicates is fail.");

    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    NAPI_ASSERT(env, valueObject != NULL, "OH_Rdb_CreateValueObject is fail.");
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket != NULL, "OH_Rdb_CreateValueObject is fail.");
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");

    int64_t chgs = 0;
    int errCode = OH_Rdb_UpdateWithConflictResolution(nullptr, valueBucket, predicates, RDB_CONFLICT_ROLLBACK, &chgs);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_CreateValueObject is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}
static napi_value OH_Rdb_Attach0100(napi_env env, napi_callback_info)
{
    size_t attachedNumber = 0;
    auto ret = OH_Rdb_Attach(nullptr, nullptr,"rdb_attach_test", 3, &attachedNumber);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_Detach is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}
static napi_value OH_Rdb_Detach0100(napi_env env, napi_callback_info)
{
    size_t attachedNumber = 0;
    auto ret = OH_Rdb_Detach(nullptr, "rdb_attach_test", 3, &attachedNumber);;
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_CreateValueObject is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_Setlocale0100(napi_env env, napi_callback_info)
{
    int errCode = OH_Rdb_SetLocale(nullptr, "zh");
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_CreateValueObject is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_LockRow_0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2* config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH1);
    OH_Rdb_SetStoreName(config, "Rdb_Test.db");
    OH_Rdb_SetBundleName(config, "ohos.acts.relationalstorendktesthvigor");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S3);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL2);
    int errCode = 0;
    OH_Rdb_Store *store1 = OH_Rdb_CreateOrOpen(config, &errCode);
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, "
    "AGE INTEGER, SALARY FLOAT, CODES BLOB);";
    errCode = OH_Rdb_Execute(store1, createTableSql);
    Rdb_DistributedConfig distributedConfig1{ .version = 1, .isAutoSync = true };
    const int tableCount = 1;
    const char *table[tableCount];
    int age = 18;
    float sal = 100.5;
    table[0] = "EMPLOYEE";
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "NAME", "Lisa");
    valueBucket->putInt64(valueBucket, "AGE", age);
    valueBucket->putReal(valueBucket, "SALARY", sal);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "CODES", arr, len);
    OH_Rdb_Insert(store1, "EMPLOYEE", valueBucket);
    valueBucket->clear(valueBucket);
    errCode = OH_Rdb_SetDistributedTables(store1, table, tableCount, RDB_DISTRIBUTED_CLOUD, &distributedConfig1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_SetDistributedTables is fail");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("EMPLOYEE");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *name = "Lisa";
    valueObject->putText(valueObject, name);
    predicates->equalTo(predicates, "NAME", valueObject);
    errCode = OH_Rdb_LockRow(store1, predicates);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_LockRow is fail");
    errCode = OH_Rdb_UnlockRow(store1, predicates);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_LockRow is fail");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OH_Rdb_CreateTransaction_0100(napi_env env, napi_callback_info)
{
    int errorCode = 14800000;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "Rdb_Test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store1 = OH_Rdb_CreateOrOpen(config, &errCode);
    char createTableSql[] ="CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, "
    "AGE INTEGER, SALARY FLOAT, CODES BLOB);";
    errCode = OH_Rdb_Execute(store1, createTableSql);
    OH_RDB_TransOptions *options = OH_RdbTrans_CreateOptions();
    OH_RdbTransOption_SetType(options, RDB_TRANS_EXCLUSIVE);
    OH_Rdb_Transaction *trans = nullptr;
    OH_Rdb_Transaction *trans1 = nullptr;
    errCode = OH_Rdb_CreateTransaction(store1, options, &trans);
    errCode = OH_Rdb_CreateTransaction(store1, options, &trans1);
    NAPI_ASSERT(env, errCode == errorCode, "OH_Rdb_CreateTransaction is fail");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    errCode = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    errCode = OH_RdbTrans_DestroyOptions(options);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_DestroyOptions is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OH_Rdb_NotSupport0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2* config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "Rdb_Test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(config, RDB_CAYLEY);
    int errCode = 0;
    OH_Rdb_Store *store1 = OH_Rdb_CreateOrOpen(config, &errCode);
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, "
    "AGE INTEGER, SALARY FLOAT, CODES BLOB);";
    errCode = OH_Rdb_Execute(store1, createTableSql);
    NAPI_ASSERT(env, errCode == RDB_E_NOT_SUPPORTED, "OH_Rdb_Execute is fail");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "OH_Rdb_Predicates_NotLike0100", nullptr, OH_Rdb_Predicates_NotLike0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Predicates_Glob0100", nullptr, OH_Rdb_Predicates_Glob0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Predicates_NotGlob0100", nullptr, OH_Rdb_Predicates_NotGlob0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Predicates_Having0100", nullptr, OH_Rdb_Predicates_Having0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_SetCryptoParam0100", nullptr, OH_Rdb_SetCryptoParam0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_InsertWithConflictResolution0100", nullptr, OH_Rdb_InsertWithConflictResolution0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_UpdateWithConflictResolution0100", nullptr, OH_Rdb_UpdateWithConflictResolution0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Attach0100", nullptr, OH_Rdb_Attach0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Detach0100", nullptr, OH_Rdb_Detach0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Setlocale0100", nullptr, OH_Rdb_Setlocale0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_LockRow_0100", nullptr, OH_Rdb_LockRow_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateTransaction_0100", nullptr, OH_Rdb_CreateTransaction_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_NotSupport0100", nullptr, OH_Rdb_NotSupport0100, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "interfacetest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

