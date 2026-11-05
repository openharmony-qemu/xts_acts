'use static';

/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


import Base64HelperConstructorTest from './utilBase64Helper/Base64HelperConstructorTest.test';
import Base64HelperDecodeTest from './utilBase64Helper/Base64HelperDecodeTest.test';
import Base64HelperEncodeTest from './utilBase64Helper/Base64HelperEncodeTest.test';
import Base64HelperEncodeToStringTest from './utilBase64Helper/Base64HelperEncodeToStringTest.test';
import Base64HelperOverviewTest from './utilBase64Helper/Base64HelperOverviewTest.test';

export default function testsuite(): void {
  Base64HelperConstructorTest();
  Base64HelperDecodeTest();
  Base64HelperEncodeTest();
  Base64HelperEncodeToStringTest();
  Base64HelperOverviewTest();
}
