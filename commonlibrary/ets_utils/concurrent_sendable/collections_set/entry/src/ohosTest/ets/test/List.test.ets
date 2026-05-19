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

import BuiltinsSetTest from "./BuiltinsSetTest.test";
import BuiltinsSetAddTest from "./BuiltinsSetAddTest.test";
import BuiltinsSetClearTest from "./BuiltinsSetClearTest.test";
import BuiltinsSetConstructorTest from "./BuiltinsSetConstructorTest.test";
import BuiltinsSetDeleteTest from "./BuiltinsSetDeleteTest.test";
import BuiltinsSetEntriesTest from "./BuiltinsSetEntriesTest.test";
import BuiltinsSetForeachTest from "./BuiltinsSetForeachTest.test";
import BuiltinsSetFromTest from "./BuiltinsSetFromTest.test";
import BuiltinsSetHasTest from "./BuiltinsSetHasTest.test";
import BuiltinsSetKeysTest from "./BuiltinsSetKeysTest.test";
import BuiltinsSetValuesTest from "./BuiltinsSetValuesTest.test";
import BuiltinsSetSizeTest from "./BuiltinsSetSizeTest.test";
import BuiltinsSetSymbolIteratorTest from './BuiltinsSetSymbolIteratorTest.test'

export default function testsuite() {
  BuiltinsSetTest();
  BuiltinsSetAddTest();
  BuiltinsSetClearTest();
  BuiltinsSetConstructorTest();
  BuiltinsSetDeleteTest();
  BuiltinsSetEntriesTest();
  BuiltinsSetForeachTest();
  BuiltinsSetFromTest();
  BuiltinsSetHasTest();
  BuiltinsSetKeysTest();
  BuiltinsSetValuesTest();
  BuiltinsSetSizeTest();
  BuiltinsSetSymbolIteratorTest();

};

