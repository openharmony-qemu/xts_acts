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

import BooleanBoxTest2 from './box/BooleanBoxTest2.test';
import BoxGenericConstructorTest5 from './box/BoxGenericConstructorTest5.test';
import BoxGenericConstructorTest6 from './box/BoxGenericConstructorTest6.test';
import BoxGenericGetSetTest5 from './box/BoxGenericGetSetTest5.test';
import ByteBoxTest2 from './box/ByteBoxTest2.test';
import CharBoxTest3 from './box/CharBoxTest3.test';
import DoubleBoxTest2 from './box/DoubleBoxTest2.test';
import FloatBoxTest2 from './box/FloatBoxTest2.test';
import FloatBoxTest3 from './box/FloatBoxTest3.test';
import IntBoxTest2 from './box/IntBoxTest2.test';
import LongBoxTest2 from './box/LongBoxTest2.test';
import LongBoxTest3 from './box/LongBoxTest3.test';
import ShortBoxTest2 from './box/ShortBoxTest2.test';
import ShortBoxTest3 from './box/ShortBoxTest3.test';


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

  BooleanBoxTest2();
  BoxGenericConstructorTest5();
  BoxGenericConstructorTest6();
  BoxGenericGetSetTest5();
  ByteBoxTest2();
  CharBoxTest3();
  DoubleBoxTest2();
  FloatBoxTest2();
  FloatBoxTest3();
  IntBoxTest2();
  LongBoxTest2();
  LongBoxTest3();
  ShortBoxTest2();
  ShortBoxTest3();
}
