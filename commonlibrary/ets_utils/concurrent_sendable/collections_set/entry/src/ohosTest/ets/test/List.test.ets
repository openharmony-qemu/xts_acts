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

import SetCollectionsTest from "./SetCollectionsTest.test";
import SetAddCollectionsTest from "./SetAddCollectionsTest.test";
import SetClearCollectionsTest from "./SetClearCollectionsTest.test";
import SetConstructorCollectionsTest from "./SetConstructorCollectionsTest.test";
import SetDeleteCollectionsTest from "./SetDeleteCollectionsTest.test";
import SetEntriesCollectionsTest from "./SetEntriesCollectionsTest.test";
import SetForeachCollectionsTest from "./SetForeachCollectionsTest.test";
import SetFromCollectionsTest from "./SetFromCollectionsTest.test";
import SetHasCollectionsTest from "./SetHasCollectionsTest.test";
import SetKeysCollectionsTest from "./SetKeysCollectionsTest.test";
import SetValuesCollectionsTest from "./SetValuesCollectionsTest.test";
import SetSizeCollectionsTest from "./SetSizeCollectionsTest.test";
import SetSymbolIteratorCollectionsTest from './SetSymbolIteratorCollectionsTest.test'

export default function testsuite() {
  SetCollectionsTest();
  SetAddCollectionsTest();
  SetClearCollectionsTest();
  SetConstructorCollectionsTest();
  SetDeleteCollectionsTest();
  SetEntriesCollectionsTest();
  SetForeachCollectionsTest();
  SetFromCollectionsTest();
  SetHasCollectionsTest();
  SetKeysCollectionsTest();
  SetValuesCollectionsTest();
  SetSizeCollectionsTest();
  SetSymbolIteratorCollectionsTest();

};

