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
#include <cstdint>
#include <database/data/data_asset.h>
#include <sys/stat.h>
#include "hilog/log.h"
#include <string>
#include "common.h"
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"

static OH_Rdb_Store *rdbStore_;
const char *TAG = "testlog";
static const char *RDB_TEST_PATH = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/";
static OH_RDB_TransOptions *options_;
static OH_Rdb_ConfigV2 *InitRdbConfig();

OH_Rdb_ConfigV2 *InitRdbConfig()
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "queryWithoutRowCount_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.querywithoutrowcount");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(config, RDB_SQLITE);
    return config;
}
    static void CreateAssetTable();
    static void SetAsset(Data_Asset *asset, int index);
    static void CheckResultSetForNormalGet(OH_Cursor *cursor);
    static void CheckResultSetForAllColumn(OH_Cursor *cursor);
    static void CheckResultSetForAbnormalGet1(OH_Cursor *cursor);
    static void CheckResultSetForAbnormalGet2(OH_Cursor *cursor);
    static void CheckResultSetForGetAssert(OH_Cursor *cursor);
    static void CheckResultSetForGetAsserts(OH_Cursor *cursor);

static napi_value TranSetUpTestCase(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------func TranSetUpTestCase start------");
    mkdir(RDB_TEST_PATH, 0770); // The permission on the path is 0770.
    int errCode = 0;
    auto config = InitRdbConfig();
    char table[] = "test";
    rdbStore_ = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, rdbStore_ != NULL, "OH_RDB_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == errCode, "OH_RDB_CreateOrOpen is fail.");
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "data1 TEXT, data2 INTEGER, data3 FLOAT, data4 BLOB);";
    errCode = OH_Rdb_Execute(rdbStore_, createTableSql);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == errCode, "OH_RDB_CreateOrOpen is fail.");
    
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1); // Set the value of id to 1.
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800); // Set the value of data2 to 12800.
    valueBucket->putReal(valueBucket, "data3", 100.1); // Set the value of data3 to 100.1.
    uint8_t arr[] = { 1, 2, 3, 4, 5 };
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    errCode = OH_Rdb_Insert(rdbStore_, table, valueBucket);
    const int errCodes = 1;
    NAPI_ASSERT(env, errCode == errCodes, "OH_RDB_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2); // Set the value of id to 2.
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800); // Set the value of data2 to 13800.
    valueBucket->putReal(valueBucket, "data3", 200.1); // Set the value of data3 to 200.1.
    errCode = OH_Rdb_Insert(rdbStore_, table, valueBucket);
    const int errCodes1 = 2;
    NAPI_ASSERT(env, errCode == errCodes1, "OH_RDB_Insert is fail2.");

    valueBucket->destroy(valueBucket);
    CreateAssetTable();
    options_ = OH_RdbTrans_CreateOptions();
    NAPI_ASSERT(env, options_ != nullptr, "OH_RDB_Insert is fail2.");
    int ret = OH_RdbTransOption_SetType(options_, RDB_TRANS_DEFERRED);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RDB_Insert is fail2.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------func TranSetUpTestCase end------");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}


static napi_value TranearDownTestCase(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------func TranearDownTestCase start------");
    rdbStore_ = nullptr;
    auto config = InitRdbConfig();
    OH_Rdb_DeleteStoreV2(config);
    OH_RdbTrans_DestroyOptions(options_);
    options_ = nullptr;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------func TranearDownTestCase end------");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}


void CreateAssetTable()
{
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS asset_table (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 "
                            "asset, data2 assets );";
    int errCode = OH_Rdb_Execute(rdbStore_, createTableSql);
    char table[] = "asset_table";
    int assetsCount = 2;
    int curRow = 1;
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    Data_Asset *asset1 = OH_Data_Asset_CreateOne();
    SetAsset(asset1, 1); // The suffix of index is 1.
    Data_Asset *asset2 = OH_Data_Asset_CreateOne();
    SetAsset(asset2, 2); // The suffix of index is 2.
    valueBucket->putInt64(valueBucket, "id", curRow);
    OH_VBucket_PutAsset(valueBucket, "data1", asset1);
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(assetsCount);
    SetAsset(assets[0], 1); // The suffix of index is 1.
    SetAsset(assets[1], 2); // The suffix of index is 2.
    errCode = OH_VBucket_PutAssets(valueBucket, "data2", assets, assetsCount);
    int rowID = OH_Rdb_Insert(rdbStore_, table, valueBucket);
    curRow++;
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", curRow);
    OH_VBucket_PutAsset(valueBucket, "data1", asset2);
    Data_Asset **assets2 = OH_Data_Asset_CreateMultiple(assetsCount);
    SetAsset(assets2[0], 1); // The suffix of index is 1.
    SetAsset(assets2[1], 3); // The suffix of index is 3.
    errCode = OH_VBucket_PutAssets(valueBucket, "data2", assets2, assetsCount);
    rowID = OH_Rdb_Insert(rdbStore_, table, valueBucket);
    OH_Data_Asset_DestroyMultiple(assets, assetsCount);
    OH_Data_Asset_DestroyMultiple(assets2, assetsCount);
    OH_Data_Asset_DestroyOne(asset1);
    OH_Data_Asset_DestroyOne(asset2);
    valueBucket->destroy(valueBucket);
}

void SetAsset(Data_Asset *asset, int index)
{
    std::string indexString = std::to_string(index);
    std::string name;
    name.append("name").append(indexString);
    int errcode = OH_Data_Asset_SetName(asset, name.c_str());
    std::string uri;
    uri.append("uri").append(indexString);
    errcode = OH_Data_Asset_SetUri(asset, uri.c_str());
    std::string path;
    path.append("path").append(indexString);
    errcode = OH_Data_Asset_SetPath(asset, path.c_str());
    errcode = OH_Data_Asset_SetCreateTime(asset, index);
    errcode = OH_Data_Asset_SetModifyTime(asset, index);
    errcode = OH_Data_Asset_SetSize(asset, index);
    errcode = OH_Data_Asset_SetStatus(asset, Data_AssetStatus::ASSET_NORMAL);
}

void CheckResultSetForNormalGet(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    size_t size = 0;
    cursor->getSize(cursor, 0, &size);
    char data1Value[size];
    cursor->getText(cursor, 0, data1Value, size);
    int64_t data2Value;
    cursor->getInt64(cursor, 1, &data2Value);
    double data3Value;
    cursor->getReal(cursor, 2, &data3Value); // columnIndex is 2
    cursor->getSize(cursor, 3, &size); // columnIndex is 3
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 3, data4Value, size); // columnIndex is 3
    cursor->goToNextRow(cursor);
    cursor->getSize(cursor, 0, &size);
    char data1Value1[size];
    cursor->getText(cursor, 0, data1Value1, size);
    cursor->getInt64(cursor, 1, &data2Value);
    cursor->getReal(cursor, 2, &data3Value); // columnIndex is 2
    cursor->destroy(cursor);
}

void CheckResultSetForAllColumn(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    int64_t id;
    cursor->getInt64(cursor, 0, &id);
    size_t size = 0;
    cursor->getSize(cursor, 1, &size);  
    char data1Value[size];
    cursor->getText(cursor, 1, data1Value, size);
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value); // columnIndex is 2
    double data3Value;
    cursor->getReal(cursor, 3, &data3Value); // columnIndex is 3
    cursor->getSize(cursor, 4, &size); // columnIndex is 4
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size); // columnIndex is 4
    cursor->goToNextRow(cursor);
    cursor->getInt64(cursor, 0, &id);
    cursor->getSize(cursor, 1, &size);
    char data1Value1[size];
    cursor->getText(cursor, 1, data1Value1, size);
    cursor->getInt64(cursor, 2, &data2Value); // columnIndex is 2
    cursor->getReal(cursor, 3, &data3Value); // columnIndex is 3
    cursor->destroy(cursor);
}

void CheckResultSetForAbnormalGet1(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    size_t size = 0;
    int errCode = cursor->getSize(nullptr, 1, &size);
    errCode = cursor->getSize(cursor, 1, nullptr);
    errCode = cursor->getSize(cursor, -1, &size);
    errCode = cursor->getSize(cursor, 5, &size); // columnIndex is 5
    errCode = cursor->getSize(cursor, 1, &size);

    char data1Value[size];
    errCode = cursor->getText(nullptr, 1, data1Value, size);
    errCode = cursor->getText(cursor, -1, data1Value, size);
    errCode = cursor->getText(cursor, 5, data1Value, size); // columnIndex is 5
    errCode = cursor->getText(cursor, 1, nullptr, size);
    errCode = cursor->getText(cursor, 1, data1Value, 0);

    int64_t data2Value;
    errCode = cursor->getInt64(nullptr, 2, &data2Value); // columnIndex is 2
    errCode = cursor->getInt64(cursor, 2, nullptr); // columnIndex is 2
    errCode = cursor->getInt64(cursor, -1, &data2Value);
    errCode = cursor->getInt64(cursor, 5, &data2Value); // columnIndex is 5
    cursor->destroy(cursor);
}

void CheckResultSetForAbnormalGet2(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    double data3Value;
    int errCode = cursor->getReal(nullptr, 3, &data3Value);
    errCode = cursor->getReal(cursor, 3, nullptr); // columnIndex is 3
    errCode = cursor->getReal(cursor, -1, &data3Value);
    errCode = cursor->getReal(cursor, 5, &data3Value); // columnIndex is 5
    size_t size = 0;
    errCode = cursor->getSize(cursor, 4, &size); // columnIndex is 4
    unsigned char data4Value[size];
    errCode = cursor->getBlob(nullptr, 4, data4Value, size); // columnIndex is 4
    errCode = cursor->getBlob(cursor, 4, nullptr, size); // columnIndex is 4
    errCode = cursor->getBlob(cursor, 4, data4Value, 0); // columnIndex is 4
    errCode = cursor->getBlob(cursor, -1, data4Value, size);
    errCode = cursor->getBlob(cursor, 5, data4Value, size); // columnIndex is 5

    bool isNull = false;
    errCode = cursor->isNull(nullptr, 1, &isNull);
    errCode = cursor->isNull(cursor, 1, nullptr);
    errCode = cursor->destroy(nullptr);
    cursor->destroy(cursor);
}


void CheckResultSetForGetAssert(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    OH_ColumnType type;
    int errCode = cursor->getColumnType(cursor, 1, &type);
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    errCode = cursor->getAsset(cursor, 1, asset);
    char name[10] = "";
    size_t nameLength = 10;
    errCode = OH_Data_Asset_GetName(asset, name, &nameLength);
    char uri[10] = "";
    size_t uriLength = 10;
    errCode = OH_Data_Asset_GetUri(asset, uri, &uriLength);
    char path[10] = "";
    size_t pathLength = 10;
    errCode = OH_Data_Asset_GetPath(asset, path, &pathLength);
    int64_t createTime = 0;
    errCode = OH_Data_Asset_GetCreateTime(asset, &createTime);
    int64_t modifyTime = 0;
    errCode = OH_Data_Asset_GetModifyTime(asset, &modifyTime);
    size_t size = 0;
    errCode = OH_Data_Asset_GetSize(asset, &size);
    Data_AssetStatus status = Data_AssetStatus::ASSET_NULL;
    errCode = OH_Data_Asset_GetStatus(asset, &status);
    OH_Data_Asset_DestroyOne(asset);
    cursor->destroy(cursor);
}


void CheckResultSetForGetAsserts(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    OH_ColumnType type;
    int errCode = cursor->getColumnType(cursor, 2, &type);
    int assetCount = 0;
    errCode = cursor->getAssets(cursor, 2, nullptr, &assetCount); // columnIndex is 2
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(assetCount);
    errCode = cursor->getAssets(cursor, 2, assets, &assetCount); // columnIndex is 2
    Data_Asset *asset = assets[1];

    char name[10] = "";
    size_t nameLength = 10;
    errCode = OH_Data_Asset_GetName(asset, name, &nameLength);
    char uri[10] = "";
    size_t uriLength = 10;
    errCode = OH_Data_Asset_GetUri(asset, uri, &uriLength);
    char path[10] = "";
    size_t pathLength = 10;
    errCode = OH_Data_Asset_GetPath(asset, path, &pathLength);
    int64_t createTime = 0;
    errCode = OH_Data_Asset_GetCreateTime(asset, &createTime);
    int64_t modifyTime = 0;
    errCode = OH_Data_Asset_GetModifyTime(asset, &modifyTime);
    size_t size = 0;
    errCode = OH_Data_Asset_GetSize(asset, &size);
    Data_AssetStatus status = Data_AssetStatus::ASSET_NULL;
    errCode = OH_Data_Asset_GetStatus(asset, &status);
    OH_Data_Asset_DestroyMultiple(assets, assetCount);
    cursor->destroy(cursor);
}

/**
 * @tc.name: RdbTrans_QueryWithoutRowCount_Normal_Get_001
 * @tc.desc: Normal testCase of store for OH_RdbTrans_QueryWithoutRowCount, getColumnCount, getXXX.
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QueryWithoutRowCount_Normal_Get_001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Normal_Get_001 start------");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, len);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction is fail.");
    CheckResultSetForNormalGet(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_putInt is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Normal_Get_001 end------");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QueryWithoutRowCount_Normal_Get_002
 * @tc.desc: Normal testCase of store for OH_RdbTrans_QueryWithoutRowCount, getColumnCount, getXXX.
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QueryWithoutRowCount_Normal_Get_002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Normal_Get_002 start------");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction  trans is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, NULL, 0);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction  trans is fail.");
    CheckResultSetForAllColumn(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Normal_Get_002 end------");
    
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QueryWithoutRowCount_003_Abnormal_InvalidArgs
 * @tc.desc: Abnormal testCase of store for InvalidArgs.
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003 start------");
    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(nullptr, predicates, columnNames, len);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_CreateTransaction is fail.");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction  trans is fail2.");
    cursor = OH_RdbTrans_QueryWithoutRowCount(trans, nullptr, columnNames, len);
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_CreateTransaction tran is fail.");
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_Trans_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003 end------");

    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004
 * @tc.desc: Abnormal testCase of store for InvalidArgs
 *           the size of columnNames is different from that of len columnNames
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004 start------");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction  trans is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"data1", "data2", "data3", "data4"};
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, 2);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction trans is fail.");
    cursor->goToNextRow(cursor);

    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    const int columnCountData = 2;
    NAPI_ASSERT(env, columnCount == columnCountData, "getColumnCount is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 0, &size);
    const size_t sizeData = 9;
    NAPI_ASSERT(env, size == sizeData, "getSize is fail.");

    char data1Value[size];
    cursor->getText(cursor, 0, data1Value, size);
    NAPI_ASSERT(env, strcmp(data1Value, "zhangSan") == 0, "getText is fail.");

    int64_t data2Value;
    const int64_t data2Values = 12800;
    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == data2Values, "getInt64 is fail.");

    double data3Value;
    int errCode = cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_COLUMN_INDEX, "getReal is fail.");

    errCode = cursor->getSize(cursor, 3, &size);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_COLUMN_INDEX, "getSize is fail.");
    
    const int size1 = 5;
    unsigned char data4Value[size1];
    errCode = cursor->getBlob(cursor, 3, data4Value, size1);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_COLUMN_INDEX, "getBlob is fail.");
    
    cursor->goToNextRow(cursor);

    cursor->getSize(cursor, 0, &size1);
    const int sizeData1 = 5;
    NAPI_ASSERT(env, size1 == sizeData1, "getSize is fail.");
    
    char data1Value1[size1];
    cursor->getText(cursor, 0, data1Value1, size1);
    NAPI_ASSERT(env, strcmp(data1Value1, "liSi") == 0, "getText is fail.");

    cursor->getInt64(cursor, 1, &data2Value);
    const int data2Values1 = 13800;
    NAPI_ASSERT(env, data2Value == data2Values1, "getInt64 is fail.");
    errCode = cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_COLUMN_INDEX, "getReal is fail.");
    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004 end------");

    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005
 * @tc.desc: Abnormal testCase of store for InvalidArgs
 *           the size of columnNames is different from that of len columnNames
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005 start------");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction  trans is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"data1", "data2", "data3", "data4", "data5"};
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, 5);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail.");
    int errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == RDB_E_STEP_RESULT_CLOSED, "OH_RdbTrans_QueryWithoutRowCount_Trans is fail.");

    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005 end------");
    
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006
 * @tc.desc: Abnormal testCase of store for InvalidArgs, the field in columnNames has nullptr
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006 start------");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = { nullptr, "data2", "data3", "data4" };
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, len);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_CreateTransaction trans is fail2.");
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006 end------");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007
 * @tc.desc: Abnormal testCase of store for InvalidArgs, the columnNames contains an empty string
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007(napi_env env, napi_callback_info info)
{
    const char *columnNames[] = {"", "data1", "data2", "data3", "data4"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction  trans is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, len);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction trans is fail2.");
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    const int columnCountData = 4;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == columnCountData, "getColumnCount is fail.");
    size_t size = 0;
    cursor->getSize(cursor, 0, &size);
    const size_t sizeData = 9;
    NAPI_ASSERT(env, size == sizeData, "getSize is fail.");
    char data1Value[size];
    cursor->getText(cursor, 0, data1Value, size);
    NAPI_ASSERT(env, strcmp(data1Value, "zhangSan") == 0, "getText is fail.");
    int64_t data2Value;
    const int64_t data2Values = 12800;
    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == data2Values, "getInt64 is fail.");
    double data3Value;
    const double data3Values = 100.1;
    cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, data3Value == data3Values, "getReal is fail.");
    cursor->getSize(cursor, 3, &size);
    const int sizeData1 = 5;
    NAPI_ASSERT(env, size == sizeData1, "getSize is fail.");
    unsigned char data4Value[size];
    const int data4Values1 = 1;
    const int data4Values2 = 2;
    cursor->getBlob(cursor, 3, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == data4Values1, "getBlob is fail.");
    NAPI_ASSERT(env, data4Value[1] == data4Values2, "getBlob is fail.");
    cursor->goToNextRow(cursor);
    const int sizeData2 = 5;
    cursor->getSize(cursor, 0, &size);
    NAPI_ASSERT(env, size == sizeData2, "getSize is fail.");
    char data1Value1[size];
    cursor->getText(cursor, 0, data1Value1, size);
    NAPI_ASSERT(env, strcmp(data1Value1, "liSi") == 0, "getText is fail.");
    const int data2Values1 = 13800;
    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == data2Values1, "getInt64 is fail.");
    const double data3Values1 = 200.1;
    cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, data3Value == data3Values1, "getReal is fail.");
    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");  
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001
 * @tc.desc: Normal testCase of store for OH_RdbTrans_QueryWithNoCount, getColumnCount, getXXX.
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001 start------");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction  trans is fail.");
    char querySql[] = "select data1, data2, data3, data4 from test;";
    OH_Cursor *cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql, nullptr);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction  trans is fail.");
    CheckResultSetForNormalGet(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001 end------");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002
 * @tc.desc: Normal testCase of store for OH_RdbTrans_QueryWithNoCount, getColumnCount, getXXX.
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002 start------");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction  trans is fail.");
    char querySql[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    ret = OH_Values_PutInt(values, 1); // Add int value 1 to values
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_Cursor *cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql, values);
    ret = OH_Values_Destroy(values);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_CreateTransaction  trans is fail.");
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    const int columnCountData = 5;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == columnCountData, "getColumnCount is fail.");

    int64_t id;
    const int64_t idData = 1;
    cursor->getInt64(cursor, 0, &id);
    NAPI_ASSERT(env, id == idData, "getInt64 is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    const size_t sizeData = 9;
    NAPI_ASSERT(env, size == sizeData, "getSize is fail.");
    char data1Value[size];
    cursor->getText(cursor, 1, data1Value, size);
    NAPI_ASSERT(env, strcmp(data1Value, "zhangSan") == 0, "getText is fail.");

    int64_t data2Value;
    const int64_t data2Values = 12800;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == data2Values, "getInt64 is fail.");

    double data3Value;
    const double data3Values = 100.1;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == data3Values, "getReal is fail.");

    cursor->getSize(cursor, 4, &size);
    const int sizeData1 = 5;
    NAPI_ASSERT(env, size == sizeData1, "getSize is fail.");
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    const int data4Values1 = 1;
    const int data4Values2 = 2;
    NAPI_ASSERT(env, data4Value[0] == data4Values1, "getBlob is fail.");
    NAPI_ASSERT(env, data4Value[1] == data4Values2, "data4Value[0] is fail2.");

    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002 end------");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

/**
 * @tc.name: RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003
 * @tc.desc: Abnormal testCase of store for InvalidArgs.
 * @tc.type: FUNC
 */
static napi_value RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003 start------");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction  trans is fail.");
    char querySql[] = "select * from test;";
    OH_Cursor *cursor = OH_RdbTrans_QuerySqlWithoutRowCount(nullptr, querySql, {});
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_CreateTransaction is fail.");

    cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, nullptr, {});
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_CreateTransaction is fail.");

    char querySql1[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql1, values);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction  trans is fail.");

    cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql1, {});
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction  trans is fail.");

    ret = OH_Values_PutInt(values, 1); // Add int value 1 to values
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql, values);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction  trans is fail.");

    cursor->destroy(cursor);
    ret = OH_Values_Destroy(values);

    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003 end------");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TranSetUpTestCase", nullptr, TranSetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TranearDownTestCase", nullptr, TranearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QueryWithoutRowCount_Normal_Get_001", nullptr, RdbTrans_QueryWithoutRowCount_Normal_Get_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QueryWithoutRowCount_Normal_Get_002", nullptr, RdbTrans_QueryWithoutRowCount_Normal_Get_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003", nullptr, RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004", nullptr, RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005", nullptr, RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_005,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006", nullptr, RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_006,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007", nullptr, RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_007,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001", nullptr, RdbTrans_QuerySqlWithoutRowCount_Normal_Get_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002", nullptr, RdbTrans_QuerySqlWithoutRowCount_Normal_Get_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003", nullptr, RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END
static  napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "tran",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
