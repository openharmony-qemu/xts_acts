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

import CollectionsSetTest from "./CollectionsSetTest.test";
import CollectionsSetAddTest from "./CollectionsSetAddTest.test";
import CollectionsSetClearTest from "./CollectionsSetClearTest.test";
import CollectionsSetConstructorTest from "./CollectionsSetConstructorTest.test";
import CollectionsSetDeleteTest from "./CollectionsSetDeleteTest.test";
import CollectionsSetEntriesTest from "./CollectionsSetEntriesTest.test";
import CollectionsSetForeachTest from "./CollectionsSetForeachTest.test";
import CollectionsSetFromTest from "./CollectionsSetFromTest.test";
import CollectionsSetHasTest from "./CollectionsSetHasTest.test";
import CollectionsSetKeysTest from "./CollectionsSetKeysTest.test";
import CollectionsSetValuesTest from "./CollectionsSetValuesTest.test";
import CollectionsSetSizeTest from "./CollectionsSetSizeTest.test";
import CollectionsSetSymbolIteratorTest from './CollectionsSetSymbolIteratorTest.test'

export default function testsuite() {
  CollectionsSetTest();
  CollectionsSetAddTest();
  CollectionsSetClearTest();
  CollectionsSetConstructorTest();
  CollectionsSetDeleteTest();
  CollectionsSetEntriesTest();
  CollectionsSetForeachTest();
  CollectionsSetFromTest();
  CollectionsSetHasTest();
  CollectionsSetKeysTest();
  CollectionsSetValuesTest();
  CollectionsSetSizeTest();
  CollectionsSetSymbolIteratorTest();

};

