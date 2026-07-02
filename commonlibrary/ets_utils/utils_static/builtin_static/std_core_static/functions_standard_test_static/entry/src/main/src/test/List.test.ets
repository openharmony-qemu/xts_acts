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

import EscapeTest from './functions/EscapeTest.test';
import UnescapeTest from './functions/UnescapeTest.test';
import EncodeUriTest from './functions/EncodeUriTest.test';
import DecodeUriTest from './functions/DecodeUriTest.test';
import EncodeUriComponentTest from './functions/EncodeUriComponentTest.test';
import DecodeUriComponentTest from './functions/DecodeUriComponentTest.test';

export default function testsuite(): void {
  EscapeTest();
  UnescapeTest();
  EncodeUriTest();
  DecodeUriTest();
  EncodeUriComponentTest();
  DecodeUriComponentTest();
}
