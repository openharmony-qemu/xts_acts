'use static';
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

import SetAddTest from "./set/SetAddTest.test";
import SetClearTest from "./set/SetClearTest.test";
import SetConstructor1Test from "./set/SetConstructor1Test.test";
import SetConstructor2Test from "./set/SetConstructor2Test.test";
import SetConstructor3Test from "./set/SetConstructor3Test.test";
import SetConstructor4Test from "./set/SetConstructor4Test.test";
import SetDeleteTest from "./set/SetDeleteTest.test";
import SetEntriesTest from "./set/SetEntriesTest.test";
import SetForEachTest from "./set/SetForEachTest.test";
import SetHasTest from "./set/SetHasTest.test";
import SetIteratorTest from "./setIterator/SetIteratorTest.test";
import SetKeysTest from "./set/SetKeysTest.test";
import SetSizeTest from "./set/SetSizeTest.test";
import SetValuesTest from "./set/SetValuesTest.test";
import ReadonlySetEntriesTest from "./readonlySet/ReadonlySetEntriesTest.test";
import ReadonlySetForEachTest from "./readonlySet/ReadonlySetForEachTest.test";
import ReadonlySetHasTest from "./readonlySet/ReadonlySetHasTest.test";
import ReadonlySetKeysTest from "./readonlySet/ReadonlySetKeysTest.test";
import ReadonlySetSizeTest from "./readonlySet/ReadonlySetSizeTest.test";
import ReadonlySetValuesTest from "./readonlySet/ReadonlySetValuesTest.test";
import SetIteratorDollarIteratorTest from "./setIterator/SetIteratorDollarIteratorTest.test";
import SetIteratorNextTest from "./setIterator/SetIteratorNextTest.test";


export default function testsuite(): void {

   SetAddTest();
   SetClearTest();
   SetConstructor1Test();
   SetConstructor2Test();
   SetConstructor3Test();
   SetConstructor4Test();
   SetDeleteTest();
   SetEntriesTest();
   SetForEachTest();
   SetHasTest();
   SetIteratorTest();
   SetKeysTest();
   SetSizeTest();
   SetValuesTest();
   ReadonlySetEntriesTest();
   ReadonlySetForEachTest();
   ReadonlySetHasTest();
   ReadonlySetKeysTest();
   ReadonlySetSizeTest();
   ReadonlySetValuesTest();
   SetIteratorDollarIteratorTest();
   SetIteratorNextTest();

}
