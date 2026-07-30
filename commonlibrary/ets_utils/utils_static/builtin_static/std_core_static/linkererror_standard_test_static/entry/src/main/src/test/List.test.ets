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

import linkerErrorTest from './linkerror/LinkerErrorTest.test';
import linkerVerificationErrorTest from './linkerror/LinkerVerificationErrorTest.test';
import linkerUnresolvedClassErrorTest from './linkerror/LinkerUnresolvedClassErrorTest.test';
import linkerUnresolvedFieldErrorTest from './linkerror/LinkerUnresolvedFieldErrorTest.test';
import linkerUnresolvedMethodErrorTest from './linkerror/LinkerUnresolvedMethodErrorTest.test';
import linkerBadSupertypeErrorTest from './linkerror/LinkerBadSupertypeErrorTest.test';
import linkerTypeCircularityErrorTest from './linkerror/LinkerTypeCircularityErrorTest.test';
import linkerMethodConflictErrorTest from './linkerror/LinkerMethodConflictErrorTest.test';
import linkerAbstractMethodErrorTest from './linkerror/LinkerAbstractMethodErrorTest.test';
import linkerClassNotFoundErrorTest from './linkerror/LinkerClassNotFoundErrorTest.test';

export default function testsuite(): void {
  linkerErrorTest();
  linkerVerificationErrorTest();
  linkerUnresolvedClassErrorTest();
  linkerUnresolvedFieldErrorTest();
  linkerUnresolvedMethodErrorTest();
  linkerBadSupertypeErrorTest();
  linkerTypeCircularityErrorTest();
  linkerMethodConflictErrorTest();
  linkerAbstractMethodErrorTest();
  linkerClassNotFoundErrorTest();
}
