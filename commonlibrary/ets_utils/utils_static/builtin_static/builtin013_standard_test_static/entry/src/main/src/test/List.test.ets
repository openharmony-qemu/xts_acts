'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import BuiltinsArrayFromTest from "./Array_From/BuiltinsArrayFromTest.test";
import BuiltinsArrayIsArrayTest from "./Array_PrototypeIsArray/BuiltinsArrayIsArrayTest.test";
import BuiltinsArrayPrototypeCopyWithinTest from "./Array_PrototypeCopyWithin/BuiltinsArrayPrototypeCopyWithinTest.test";
import BuiltinsArrayPrototypeEntriesTest from "./Array_Prototype_Entries/BuiltinsArrayPrototypeEntriesTest.test";
import BuiltinsArrayPrototypeEveryTest from "./Array_Prototype_Every/BuiltinsArrayPrototypeEveryTest.test";
import BuiltinsArrayPrototypeFillTest from "./Array_Prototype_Fill/BuiltinsArrayPrototypeFillBasic.test";
import BuiltinsArrayPrototypeFindBasicTest from "./Array_prototype_find/BuiltinsArrayPrototypeFindBasic.test";
import BuiltinsArrayPrototypeFilterBasicTest from "./Array_prototype_filter/BuiltinsArrayPrototypeFilterBasic.test";
import BuiltinsArrayPrototypeFilterBasicSecTest from "./Array_prototype_filter/BuiltinsArrayPrototypeFilterBasicSec.test";
import BuiltinsArrayPrototypeConcatTest from "./Array_Prototype_Concat/BuiltinsArrayConcatTest.test"; 
import BuiltinsArrayFindIndexTest from "./Array_Prototype_FindIndex/BuiltinsArrayFindIndexTest.test";
import BuiltinsArrayShiftTest from "./shift/BuiltinsArrayShiftTest.test";
import BuiltinsArrayReverseTest from "./Array_Reverse/BuiltinsArrayReverseTest.test";
import BuiltinsArrayReduceSecTest from "./Array_Prototype_Reduce/BuiltinsArrayReduceSecTest.test";
import BuiltinsArrayPrototypeReduceTest from "./Array_Prototype_Reduce/BuiltinsArrayReduceTest.test";

import BuiltinsArrayPrototypeForEachTest from './Array_PrototypeForEach/BuiltinsArrayPrototypeForEachTest.test';
import BuiltinsArrayIncludesTest from './Array_PrototypeIncludes/BuiltinsArrayIncludesTest.test';
import BuiltinsArrayPrototypeMapTest from './Array_PrototypeMap/BuiltinsArrayPrototypeMapTest.test';
import BuiltinsArrayPrototypePopTest from './Array_PrototypePop/BuiltinsArrayPrototypePopTest.test';
import BuiltinsArrayPrototypePushTest from './Array_PrototypePush/BuiltinsArrayPrototypePushTest.test';
import BuiltinsArrayOfTest from './Array_Of/BuiltinsArrayOfTest.test';
import BuiltinsArrayPrototypeJoinTest from './Array_PrototypeJoin/BuiltinsArrayPrototypeJoinTest.test';
import BuiltinsArrayOfExtendedTest from './Array_Of/BuiltinsArrayOfExtendedTest.test';
import BuiltinsArrayIndexOfTest from './Array_PrototypeIndexOf/BuiltinsArrayIndexOfTest.test';
import BuiltinsArrayLastIndexOfTest from './Array_Prototype_LastIndexOf/BuiltinsArrayLastIndexOfTest.test';
import BuiltinsArrayReduceRightTest from './reduceRight/BuiltinsArrayReduceRightTest.test';
export default function testsuite(): void {
  BuiltinsArrayFromTest()
  BuiltinsArrayIsArrayTest()
  BuiltinsArrayPrototypeCopyWithinTest()
  BuiltinsArrayPrototypeEntriesTest()
  BuiltinsArrayPrototypeEveryTest()
  BuiltinsArrayPrototypeFillTest()
  BuiltinsArrayPrototypeFindBasicTest()
  BuiltinsArrayPrototypeFilterBasicTest()
  BuiltinsArrayPrototypeFilterBasicSecTest()
  BuiltinsArrayPrototypeConcatTest()
  BuiltinsArrayFindIndexTest()
  BuiltinsArrayShiftTest()
  BuiltinsArrayReverseTest()
  BuiltinsArrayReduceSecTest()
  BuiltinsArrayPrototypeReduceTest()

  BuiltinsArrayPrototypeForEachTest();
  BuiltinsArrayIncludesTest();
  BuiltinsArrayIndexOfTest();
  BuiltinsArrayPrototypeMapTest()
  BuiltinsArrayPrototypePopTest()
  BuiltinsArrayPrototypePushTest();
  BuiltinsArrayOfTest();
  BuiltinsArrayOfExtendedTest();
  BuiltinsArrayPrototypeJoinTest();
  BuiltinsArrayIndexOfTest();
  BuiltinsArrayLastIndexOfTest();
  BuiltinsArrayReduceRightTest();
};

