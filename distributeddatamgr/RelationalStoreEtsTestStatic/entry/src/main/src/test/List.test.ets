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
  RelationStoreError17Test();
}