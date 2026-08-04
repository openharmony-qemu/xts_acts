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

import Uint8ArrayConstructor01Test from './Uint8Array/Uint8ArrayConstructor01Test.test';
import Uint8ArrayConstructor02Test from './Uint8Array/Uint8ArrayConstructor02Test.test';
import Uint8ArrayConstructor03Test from './Uint8Array/Uint8ArrayConstructor03Test.test';
import Uint8ArrayConstructor04Test from './Uint8Array/Uint8ArrayConstructor04Test.test';
import Uint8ArrayCopyWithin01Test from './Uint8Array/Uint8ArrayCopyWithin01Test.test';
import Uint8ArrayCopyWithin02Test from './Uint8Array/Uint8ArrayCopyWithin02Test.test';
import Uint8Array$SetTest from './Uint8Array/Uint8Array$SetTest.test';
import Uint8ArraySet01Test from './Uint8Array/Uint8ArraySet01Test.test';
import Uint8ArraySet02Test from './Uint8Array/Uint8ArraySet02Test.test';

export default function testsuite(): void {
  Uint8ArrayConstructor01Test();
  Uint8ArrayConstructor02Test();
  Uint8ArrayConstructor03Test();
  Uint8ArrayConstructor04Test();
  Uint8ArrayCopyWithin01Test();
  Uint8ArrayCopyWithin02Test();
  Uint8Array$SetTest();
  Uint8ArraySet01Test();
  Uint8ArraySet02Test();
}
