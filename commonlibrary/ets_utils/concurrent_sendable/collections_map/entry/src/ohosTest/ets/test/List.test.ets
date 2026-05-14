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

import MapClearCollectionsTest from "./MapClearCollectionsTest.test";
import MapConstructorCollectionsTest from "./MapConstructorCollectionsTest.test";
import MapDeleteCollectionsTest from "./MapDeleteCollectionsTest.test";
import MapEntriesCollectionsTest from "./MapEntriesCollectionsTest.test";
import MapForeachCollectionsTest from "./MapForeachCollectionsTest.test";
import MapGetCollectionsTest from "./MapGetCollectionsTest.test";
import MapHasCollectionsTest from "./MapHasCollectionsTest.test";
import MapValuesCollectionsTest from "./MapValuesCollectionsTest.test";

export default function testsuite() {
  MapClearCollectionsTest();
  MapConstructorCollectionsTest();
  MapDeleteCollectionsTest();
  MapEntriesCollectionsTest();
  MapForeachCollectionsTest();
  MapGetCollectionsTest();
  MapHasCollectionsTest();
  MapValuesCollectionsTest();
};

