'use static'
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

import booleanBoxTest from "./box/BooleanBoxTest.test";
import boxGenericConstructorTest1 from "./box/BoxGenericConstructorTest_1.test";
import boxGenericConstructorTest2 from "./box/BoxGenericConstructorTest_2.test";
import boxGenericConstructorTest3 from "./box/BoxGenericConstructorTest_3.test";
import boxGenericConstructorTest4 from "./box/BoxGenericConstructorTest_4.test";
import boxGenericGetSetTest1 from "./box/BoxGenericGetSetTest_1.test";
import boxGenericGetSetTest2 from "./box/BoxGenericGetSetTest_2.test";
import boxGenericGetSetTest3 from "./box/BoxGenericGetSetTest_3.test";
import boxGenericGetSetTest4 from "./box/BoxGenericGetSetTest_4.test";
import byteBoxTest from "./box/ByteBoxTest.test";
import charBoxTest1 from "./box/CharBoxTest_1.test";
import charBoxTest2 from "./box/CharBoxTest_2.test";
import doubleBoxTest1 from "./box/DoubleBoxTest_1.test";
import floatBoxTest1 from "./box/FloatBoxTest_1.test";
import intBoxTest1 from "./box/IntBoxTest_1.test";
import longBoxTest1 from "./box/LongBoxTest_1.test";
import shortBoxTest from "./box/ShortBoxTest.test";

export default function testsuite():void {
  booleanBoxTest();
  boxGenericConstructorTest1();
  boxGenericConstructorTest2();
  boxGenericConstructorTest3();
  boxGenericConstructorTest4();
  boxGenericGetSetTest1();
  boxGenericGetSetTest2();
  boxGenericGetSetTest3();
  boxGenericGetSetTest4();
  byteBoxTest();
  charBoxTest1();
  charBoxTest2();
  doubleBoxTest1();
  floatBoxTest1();
  intBoxTest1();
  longBoxTest1();
  shortBoxTest();
}
