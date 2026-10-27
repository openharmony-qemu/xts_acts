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
 
import EntryParamsTest from './entryTest/EntryParamsTest.test';
import EntryParams2Test from './entryTest/EntryParams2Test.test';
import EntryOptionPage from './entryTest/EntryOptionPage.test'
import EntryOptionPage2 from './entryTest/EntryOptionPage2.test'
import componentLifecycleDecoratorsTest from './lifecycle/ComponentLifecycleDecorators.test';
import reuseComponentLifecycleTest from './lifecycle/ReuseComponentLifecycle.test';
import reuseV2ComponentLifecycleTest from './lifecycle/ReuseV2ComponentLifecycle.test';
import ExtendableButtonBuiltInTest from './ExtendBuiltIn/ExtendableButtonBuiltInTest.test';
import ExtendableColumnBuiltInTest from './ExtendBuiltIn/ExtendableColumnBuiltInTest.test';
import ExtendableGridBuiltInTest from './ExtendBuiltIn/ExtendableGridBuiltInTest.test';
import ExtendableGridBuiltInUndefinedTest from './ExtendBuiltIn/ExtendableGridBuiltInUndefinedTest.test';
import ExtendableGridItemBuiltInTest from './ExtendBuiltIn/ExtendableGridItemBuiltInTest.test';
import ExtendableGridItemBuiltInUndefinedTest from './ExtendBuiltIn/ExtendableGridItemBuiltInUndefinedTest.test';
import ExtendableImageBuiltInTest from './ExtendBuiltIn/ExtendableImageBuiltInTest.test';
import ExtendableListBuiltInTest from './ExtendBuiltIn/ExtendableListBuiltInTest.test';
import ExtendableListBuiltInUndefinedTest from './ExtendBuiltIn/ExtendableListBuiltInUndefinedTest.test';
import ExtendableListItemBuiltInTest from './ExtendBuiltIn/ExtendableListItemBuiltInTest.test';
import ExtendableListItemBuiltInUndefinedTest from './ExtendBuiltIn/ExtendableListItemBuiltInUndefinedTest.test';
import ExtendableRelativeContainerBuiltInTest from './ExtendBuiltIn/ExtendableRelativeContainerBuiltInTest.test';
import ExtendableRowBuiltInTest from './ExtendBuiltIn/ExtendableRowBuiltInTest.test';
import ExtendableStackBuiltInTest from './ExtendBuiltIn/ExtendableStackBuiltInTest.test';
import ExtendableStackBuiltInUndefinedTest from './ExtendBuiltIn/ExtendableStackBuiltInUndefinedTest.test';
import ExtendableTextBuiltInTest from './ExtendBuiltIn/ExtendableTextBuiltInTest.test';
import ExtendableToggleBuiltInTest from './ExtendBuiltIn/ExtendableToggleBuiltInTest.test';
import RepeatReusableFalse1 from './ReusableTest/RepeatReusableFalse1.test';
import RepeatReusableTrue1 from './ReusableTest/RepeatReusableTrue1.test';
import SVDeepListenMakeObservedTest from './stateVariableDeepListen/SVDeepListenMakeObservedTest.test';
import SVDeepListenMakeObservedFalseTest from './stateVariableDeepListen/SVDeepListenMakeObservedFalseTest.test';
import SVDeepListenObservedAndObjectlinkTest
  from './stateVariableDeepListen/SVDeepListenObservedAndObjectlinkTest.test';
import SVDeepListenObservedBuiltInTest from './stateVariableDeepListen/SVDeepListenObservedBuiltInTest.test';
import GlobalReusePoolTest from './uiutilsTest/GlobalReusePool.test';
import GlobalReusePool002Test from './uiutilsTest/GlobalReusePool002.test';
import GlobalReusePool003Test from './uiutilsTest/GlobalReusePool003.test';
import GlobalReusePool004Test from './uiutilsTest/GlobalReusePool004.test';
import StaticCoverageComponentTest from './staticCoverage/StaticCoverageComponent.test';
import StaticCoverageDecoratorTest from './staticCoverage/StaticCoverageDecorator.test';
import StaticCoverageStorageTest from './staticCoverage/StaticCoverageStorage.test';
import StaticCoverageUtilsTest from './staticCoverage/StaticCoverageUtils.test';
import IsPlaceholder0060Test from './builder/IsPlaceholder0060Test.test';
import IsPlaceholder0070Test from './builder/IsPlaceholder0070Test.test';
 
 
export default function testsuite() {
  ExtendableListBuiltInTest();
  ExtendableListBuiltInUndefinedTest();
  EntryParamsTest();
  EntryParams2Test();
  EntryOptionPage();
  EntryOptionPage2();
  ExtendableListItemBuiltInTest();
  ExtendableListItemBuiltInUndefinedTest();
  ExtendableButtonBuiltInTest();
  ExtendableColumnBuiltInTest();
  ExtendableGridBuiltInTest();
  ExtendableGridBuiltInUndefinedTest();
  ExtendableGridItemBuiltInTest();
  ExtendableGridItemBuiltInUndefinedTest();
  ExtendableImageBuiltInTest();
  ExtendableRelativeContainerBuiltInTest();
  ExtendableRowBuiltInTest();
  ExtendableStackBuiltInTest();
  ExtendableStackBuiltInUndefinedTest();
  ExtendableTextBuiltInTest();
  ExtendableToggleBuiltInTest();
  componentLifecycleDecoratorsTest();
  reuseComponentLifecycleTest();
  reuseV2ComponentLifecycleTest();
  StaticCoverageComponentTest();
  StaticCoverageDecoratorTest();
  StaticCoverageStorageTest();
  StaticCoverageUtilsTest();
  //RepeatReusableFalse1(); 
  //RepeatReusableTrue1(); 
  GlobalReusePool004Test();
  SVDeepListenMakeObservedTest();
  SVDeepListenMakeObservedFalseTest();
  SVDeepListenObservedAndObjectlinkTest();
  SVDeepListenObservedBuiltInTest();
  GlobalReusePool002Test();
  GlobalReusePool003Test();
  GlobalReusePoolTest();
  IsPlaceholder0060Test();
  IsPlaceholder0070Test();
}