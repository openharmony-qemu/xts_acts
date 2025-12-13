/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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


import RelationStoreRdbStoreTest from "./RelationStoreApi.test";
import RelationalStoreEnumTest from "./RelationStoreEnumApi.test";
import RdbResultSetTest from "./RelationalStoreResultEts.test";
import RelationStoreError00Test from "./RelationStoreError00Api.test";
import RelationStoreError10Test from "./RelationStoreError10Api.test";
import RelationStoreError11Test from "./RelationStoreError11Api.test";
import RelationStoreError14Test from "./RelationStoreError14Api.test";
import RelationStoreError12Test from "./RelationStoreError12Api.test";
import RelationStoreError21Test from "./RelationStoreError21Api.test";
import RelationStoreError24Test from "./RelationStoreError24Api.test";
import RelationStoreError30Test from "./RelationStoreError30Api.test";
import RelationStoreError32Test from "./RelationStoreError32Api.test";
import RelationStoreError17Test from "./RelationStoreError17Api.test";
import RelationStoreError33Test from './RelationStoreError33Api.test';
import RelationStoreError801Test from "./RelationStoreError801Api.test";
import RelationStoreError1001Test from "./RelationStoreError1001Api.test";
import RelationalStoreSyncApiTest from "./RelationalStoreSyncApiTest.test"; 
import RelationalStoreCloudSync from "./RelationalStoreCloudSync.test";
import RelationalStoreDistributedJsunit from "./RelationalStoreDistributedJsunit.test";
import relationalStoreCloudSyncEts from "./relationalStoreCloudSyncEts.test";
import VectorStore from "./VectorStore.test";

import RelationStoreSqlExecTimeTest from "./RelationStoreSqlExecTimeTest.test";
import RdbStoreAttachEtsunit from "./RdbStoreAttachEtsunit.test";

import RelationalStorePredicatesJsunit from "./RelationalStorePredicatesJsunit.test";
import RelationalStoreCloudCursor from "./RelationalStoreCloudCursor.test";
import RelationalStoreResultSetSync from "./RelationalStoreResultSetSync.test";
import relationalStoreInterfaceTest from  "./relationalstore.test";
import RelationalStoreBackupRestoreWithFAContextJsunit from "./RelationalStoreBackupRestoreWithFAContextJsunit.test";

import rdbErrorCode14800011 from "./RdbErrorCode14800011.test";
import rdbErrorCode14800010 from "./RdbErrorCode14800010.test";
import rdbErrorCode14800032 from "./RdbErrorCode14800032.test";
import rdbErrorCode14800014 from "./RdbErrorCode14800014.test";
import rdbErrorCode14800012 from "./RdbErrorCode14800012.test";
import rdbErrorCode14800013 from "./RdbErrorCode14800013.test";
import rdbErrorCode14800015 from "./RdbErrorCode14800015.test";
import rdbErrorCode14800016 from "./RdbErrorCode14800016.test";
import rdbErrorCode14800024 from "./RdbErrorCode14800024.test";
import rdbErrorCode14800033 from "./RdbErrorCode14800033.test";
import rdbErrorCode14800033 from "./RdbErrorCode14800033.test";
import rdbErrorCode801 from "./RdbErrorCode801.test";
import rdbErrorCode14800050 from "./RdbErrorCode14800050.test";
import rdbErrorCode14800051 from "./RdbErrorCode14800051.test";
import rdbErrorCode14801001 from "./RdbErrorCode14801001.test";
import rdbErrorCode14801002 from "./RdbErrorCode14801002.test";
import RDBErrorCode18Test from "./RDBErrorCode18Test.test";
import RDBErrorCode21Test from "./RDBErrorCode21Test.test";

export default function testsuite() {
  RelationStoreRdbStoreTest();
  RelationalStoreEnumTest();
  RdbResultSetTest();
  RelationStoreError00Test();
  RelationStoreError10Test();
  RelationStoreError11Test();
  RelationStoreError12Test();
  RelationStoreError14Test();
  RelationStoreError21Test();
  RelationStoreError24Test();
  RelationStoreError30Test();
  RelationStoreError32Test();
  RelationStoreError33Test();
  RelationStoreError17Test();
  RelationStoreError801Test();
  RelationStoreError1001Test();

  RelationalStoreSyncApiTest();  
  RelationalStoreCloudSync();  
  RelationalStoreDistributedJsunit();
  relationalStoreCloudSyncEts(); 
  
  RelationalStoreResultSetSync(); 
  
  relationalStoreInterfaceTest(); 
  RelationalStoreBackupRestoreWithFAContextJsunit();
  RelationalStorePredicatesJsunit(); 
  VectorStore(); 
  RelationalStoreCloudCursor(); 
  RdbStoreAttachEtsunit(); 
  RelationStoreSqlExecTimeTest();
  
  rdbErrorCode14800010(); 
  rdbErrorCode14800013();
  rdbErrorCode14800015();
  rdbErrorCode14800024();
  rdbErrorCode14800050();
  rdbErrorCode14800051();
  rdbErrorCode14801002();
  rdbErrorCode14800016();
  rdbErrorCode14801001(); 
  rdbErrorCode14800012();
  rdbErrorCode14800014();
  rdbErrorCode14800011();
  rdbErrorCode14800032();
  rdbErrorCode14800033();
  rdbErrorCode801();
  RDBErrorCode18Test();
  RDBErrorCode21Test();
}