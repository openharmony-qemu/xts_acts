/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import EsArrayTest001 from "./EsArray001.test";
import EsArrayTest002 from "./EsArray002.test";
import EsArrayTest003 from "./EsArray003.test";
import EsBigIntTest from "./EsBigInt.test";
import EsBooleanTest from "./EsBoolean.test";
import EsDateTest from "./EsDate.test";
import EsErrorTest from "./EsError.test";
import EsFinalRegTest from "./EsFinalReg.test";
import EsInfinityTest from "./EsInfinity.test";
import EsJSONTest from "./EsJSON.test";
import EsNaNTest from "./EsNaN.test";
export default function testsuite() {
  EsArrayTest001();
  EsArrayTest002();
  EsArrayTest003();
  EsBooleanTest();
  EsBigIntTest();
  EsDateTest();
  EsErrorTest();
  EsFinalRegTest();
  EsInfinityTest();
  EsJSONTest();
  EsNaNTest();
}