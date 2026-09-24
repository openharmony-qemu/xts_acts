/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import WeakMapTest from './weak/WeakMap.test';
import WeakMixTest from './weak/WeakMix.test';
import WeakRefTest from './weak/WeakRef.test';
import WeakSetTest from './weak/WeakSet.test';
import keyedCollections_03Test from './WeakMap/KeyedCollections_03.test';
import keyedCollections_04Test from './WeakMap/KeyedCollections_04.test';
import keyedCollections_15Test from './WeakMap/KeyedCollections_15.test';
import keyedCollections_16Test from './WeakMap/KeyedCollections_16.test';
import keyedCollections_18Test from './WeakMap/KeyedCollections_18.test';
import keyedCollections_10Test from './WeakSet/KeyedCollections_10.test';
import keyedCollections_19Test from './WeakSet/KeyedCollections_19.test';

import weakMapBigIntTest from "./weakMap2/WeakMapBigIntTest.test";
import weakMapBooleanTest from "./weakMap2/WeakMapBooleanTest.test";
import weakMapClassTest from "./weakMap2/WeakMapClassTest.test";
import weakMapDateTest from "./weakMap2/WeakMapDateTest.test";
import weakMapFunctionTest from "./weakMap2/WeakMapFunctionTest.test";
import weakMapMapTest from "./weakMap2/WeakMapMapTest.test";
import weakMapNestedTest from "./weakMap2/WeakMapNestedTest.test";
import weakMapNumberTest from "./weakMap2/WeakMapNumberTest.test";
import weakMapObjectTest from "./weakMap2/WeakMapObjectTest.test";
import weakMapRegExpTest from "./weakMap2/WeakMapRegExpTest.test";
import weakMapSetTest from "./weakMap2/WeakMapSetTest.test";
import weakMapStringTest from "./weakMap2/WeakMapStringTest.test";
import weakMapSymbolTest from "./weakMap2/WeakMapSymbolTest.test";
import weakMapUnionTest from "./weakMap2/WeakMapUnionTest.test";

import weakSetBigIntTest from "./weakSet2/WeakSetBigIntTest.test";
import weakSetBooleanTest from "./weakSet2/WeakSetBooleanTest.test";
import weakSetClassTest from "./weakSet2/WeakSetClassTest.test";
import weakSetDateTest from "./weakSet2/WeakSetDateTest.test";
import weakSetFunctionTest from "./weakSet2/WeakSetFunctionTest.test";
import weakSetMapTest from "./weakSet2/WeakSetMapTest.test";
import weakSetNestedTest from "./weakSet2/WeakSetNestedTest.test";
import weakSetNumberTest from "./weakSet2/WeakSetNumberTest.test";
import weakSetObjectTest from "./weakSet2/WeakSetObjectTest.test";
import weakSetRegExpTest from "./weakSet2/WeakSetRegExpTest.test";
import weakSetSetTest from "./weakSet2/WeakSetSetTest.test";
import weakSetStringTest from "./weakSet2/WeakSetStringTest.test";
import weakSetSymbolTest from "./weakSet2/WeakSetSymbolTest.test";
import weakSetUnionTest from "./weakSet2/WeakSetUnionTest.test";

export default function testsuite() {
  WeakMapTest();
  WeakMixTest();
  WeakRefTest();
  WeakSetTest();
  keyedCollections_03Test();
  keyedCollections_04Test();
  keyedCollections_04Test();
  keyedCollections_15Test();
  keyedCollections_16Test();
  keyedCollections_18Test();
  keyedCollections_10Test();
  keyedCollections_19Test();

  weakMapBigIntTest();
  weakMapBooleanTest();
  weakMapClassTest();
  weakMapDateTest();
  weakMapFunctionTest();
  weakMapMapTest();
  weakMapNestedTest();
  weakMapNumberTest();
  weakMapObjectTest();
  weakMapRegExpTest();
  weakMapSetTest();
  weakMapStringTest();
  weakMapSymbolTest();
  weakMapUnionTest();

  weakSetBigIntTest();
  weakSetBooleanTest();
  weakSetClassTest();
  weakSetDateTest();
  weakSetFunctionTest();
  weakSetMapTest();
  weakSetNestedTest();
  weakSetNumberTest();
  weakSetObjectTest();
  weakSetRegExpTest();
  weakSetSetTest();
  weakSetStringTest();
  weakSetSymbolTest();
  weakSetUnionTest();
}