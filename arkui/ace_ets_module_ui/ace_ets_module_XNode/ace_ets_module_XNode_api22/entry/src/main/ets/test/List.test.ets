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
import FlushStateNodeTest from './ReactiveBuilderNodeTest/FlushStateNodeTest.test'
import InheritFreezeOptionsNodeTest from './ReactiveBuilderNodeTest/InheritFreezeOptionsNodeTest.test'
import IsDisposedNodeTest from './ReactiveBuilderNodeTest/IsDisposedNodeTest.test'
import postInputEventTest from './ReactiveBuilderNodeTest/postInputEventTest.test'
import postTouchEventTest from './ReactiveBuilderNodeTest/postTouchEventTest.test'
import UpdateConfigurationNodeTest from './ReactiveBuilderNodeTest/UpdateConfigurationNodeTest.test'
import FlushStateContentTest from './ReactiveComponentContentTest/FlushStateContentTest.test'
import InheritFreezeOptionsContentTest from './ReactiveComponentContentTest/InheritFreezeOptionsContentTest.test'
import IsDisposedContentTest from './ReactiveComponentContentTest/IsDisposedContentTest.test'
import UpdateConfigurationContentTest from './ReactiveComponentContentTest/UpdateConfigurationContentTest.test'

export default function testsuite() {
  FlushStateNodeTest();
  InheritFreezeOptionsNodeTest();
  IsDisposedNodeTest();
  postInputEventTest();
  postTouchEventTest();
  UpdateConfigurationNodeTest();
  FlushStateContentTest();
  InheritFreezeOptionsContentTest();
  IsDisposedContentTest();
  UpdateConfigurationContentTest();
}