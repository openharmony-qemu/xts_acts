/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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



import counterDirectionTest from './counter/counterDirection.test';
import counterApi from './counter/counterApi.test';
import ActsAceCounterComponentTest from './counter/ActsAceCounterComponentTest.test';
import CounterComponentTest from './counter/CounterComponentTest.test';
import CounterEnableTest from './counter/CounterEnableTest.test';
import CounterJsunitTest from './counter/CounterJsunitTest.test';
import ActsAceCounterV2ComponentTest from './CounterV2/ActsAceCounterV2ComponentTest.test';
import CounterV2Api from './CounterV2/CounterV2Api.test';
import CounterV2ComponentTest from './CounterV2/CounterV2ComponentTest.test';
import CounterV2Direction from './CounterV2/CounterV2Direction.test';
import CounterV2AttrsTest from './CounterV2/CounterV2Attrs.test';
import CounterV2AbnormalOptionsTest from './CounterV2/CounterV2AbnormalOptionsTest.test';
import CounterV2AbnormalNumberTest from './CounterV2/CounterV2AbnormalNumberTest.test';
import CounterV2AbnormalInlineTest from './CounterV2/CounterV2AbnormalInlineTest.test';
import CounterV2AbnormalDateTest from './CounterV2/CounterV2AbnormalDateTest.test';

export default function testsuite() {
  counterDirectionTest();
  counterApi();
    // CounterTest
    ActsAceCounterComponentTest()
    CounterComponentTest()
    CounterEnableTest()
    CounterJsunitTest()
    ActsAceCounterV2ComponentTest()
    CounterV2Api()
    CounterV2ComponentTest()
    CounterV2Direction()
    CounterV2AttrsTest()
    CounterV2AbnormalOptionsTest()
    CounterV2AbnormalNumberTest()
    CounterV2AbnormalInlineTest()
    CounterV2AbnormalDateTest()
}