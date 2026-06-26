/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import GlobalReusePoolTest from './uiutilsTest/GlobalReusePool.test';
import GlobalReusePool002Test from './uiutilsTest/GlobalReusePool002.test';
import ReusableChildState1Test from './Reusable/ReusableChildState1Test.test';
import ReusableChildState2Test from './Reusable/ReusableChildState2Test.test';
import ReusableChildState3Test from './Reusable/ReusableChildState3Test.test';
import ReusableChildState4Test from './Reusable/ReusableChildState4Test.test';

export default function testsuite() {
    GlobalReusePoolTest();
    GlobalReusePool002Test();
    ReusableChildState1Test();
    ReusableChildState2Test();
    ReusableChildState3Test();
    ReusableChildState4Test();
}
