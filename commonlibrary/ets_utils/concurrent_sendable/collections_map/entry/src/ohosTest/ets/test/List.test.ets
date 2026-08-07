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

import CollectionsMapClearTest from "./CollectionsMapClearTest.test";
import CollectionsMapConstructorTest from "./CollectionsMapConstructorTest.test";
import CollectionsMapDeleteTest from "./CollectionsMapDeleteTest.test";
import CollectionsMapEntriesTest from "./CollectionsMapEntriesTest.test";
import CollectionsMapForeachTest from "./CollectionsMapForeachTest.test";
import CollectionsMapGetTest from "./CollectionsMapGetTest.test";
import CollectionsMapHasTest from "./CollectionsMapHasTest.test";
import CollectionsMapValuesTest from "./CollectionsMapValuesTest.test";
import collectionsMapConstructorTest01 from './CollectionsMapConstructorTest01.test';
import collectionsMapClearSizeTest from './CollectionsMapClearSize.test';
import collectionsMapHasDeleteTest from './CollectionsMapHasDelete.test';
import collectionsMapKeysValuesTest from './CollectionsMapKeysValues.test';
import collectionsMapNonOrthogonalTest from './CollectionsMapNonOrthogonal.test';
import collectionsMapForEachEntriesTest from './CollectionsMapForEachEntries.test';
import collectionsMapSetGet from './CollectionsMapSetGet.test';
import collectionsMapConcurrentTest from './CollectionsMapConcurrent.test';


export default function testsuite() {
  CollectionsMapClearTest();
  CollectionsMapConstructorTest();
  CollectionsMapDeleteTest();
  CollectionsMapEntriesTest();
  CollectionsMapForeachTest();
  CollectionsMapGetTest();
  CollectionsMapHasTest();
  CollectionsMapValuesTest();
  collectionsMapConstructorTest01();
  collectionsMapClearSizeTest();
  collectionsMapForEachEntriesTest();
  collectionsMapHasDeleteTest();
  collectionsMapKeysValuesTest();
  collectionsMapNonOrthogonalTest();
  collectionsMapSetGet();
  collectionsMapConcurrentTest();
};
