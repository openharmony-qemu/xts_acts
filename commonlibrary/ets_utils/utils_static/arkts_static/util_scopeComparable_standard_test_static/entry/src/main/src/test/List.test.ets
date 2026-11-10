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

import ScopeComparableTest from './utilScopeComparable/ScopeComparableTest.test';
import ScopeHelperClampTest from './utilScopeComparable/ScopeHelperClampTest.test';
import ScopeHelperConstructorTest from './utilScopeComparable/ScopeHelperConstructorTest.test';
import ScopeHelperContainsTest from './utilScopeComparable/ScopeHelperContainsTest.test';
import ScopeHelperExpandTest from './utilScopeComparable/ScopeHelperExpandTest.test';
import ScopeHelperGetLowerTest from './utilScopeComparable/ScopeHelperGetLowerTest.test';
import ScopeHelperGetUpperTest from './utilScopeComparable/ScopeHelperGetUpperTest.test';
import ScopeHelperIntersectTest from './utilScopeComparable/ScopeHelperIntersectTest.test';
import ScopeHelperOverviewTest from './utilScopeComparable/ScopeHelperOverviewTest.test';
import ScopeHelperToStringTest from './utilScopeComparable/ScopeHelperToStringTest.test';
import StringDecoderConstructorTest from './utilScopeComparable/StringDecoderConstructorTest.test';
import StringDecoderEndTest from './utilScopeComparable/StringDecoderEndTest.test';

export default function testsuite(): void {
  ScopeComparableTest();
  ScopeHelperClampTest();
  ScopeHelperConstructorTest();
  ScopeHelperContainsTest();
  ScopeHelperExpandTest();
  ScopeHelperGetLowerTest();
  ScopeHelperGetUpperTest();
  ScopeHelperIntersectTest();
  ScopeHelperOverviewTest();
  ScopeHelperToStringTest();
  StringDecoderConstructorTest();
  StringDecoderEndTest();
}
