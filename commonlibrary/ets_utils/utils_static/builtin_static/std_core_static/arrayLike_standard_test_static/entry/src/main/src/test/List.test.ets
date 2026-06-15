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

import ArrayLikeIteratorTest from './arraylike/ArrayLikeIteratorTest.test.ets';
import ArrayLikeGetLenTest from './arraylike/ArrayLikeGetLenTest.test.ets';
import ArrayLikeGetTest from './arraylike/ArrayLikeGetTest.test.ets';
import ArrayLikeGetTest02 from './arraylike/ArrayLikeGetTest02.test.ets';
import ArrayLikeLengthTest from './arraylike/ArrayLikeLengthTest.test.ets';

export default function testsuite(): void {
  ArrayLikeIteratorTest();
  ArrayLikeGetLenTest();
  ArrayLikeGetTest();
  ArrayLikeGetTest02();
  ArrayLikeLengthTest();
}
