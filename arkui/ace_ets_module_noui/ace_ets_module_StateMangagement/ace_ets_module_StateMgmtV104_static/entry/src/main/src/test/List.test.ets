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
 
import repeatReusableFalse from './ReusableTest/repeatReusableFalse.test';
import repeatReusableTrue from './ReusableTest/repeatReusableTrue.test';
import SVDeepListenMakeObservedTest from './stateVariableDeepListen/SVDeepListenMakeObservedTest.test';
import SVDeepListenMakeObservedFalseTest from './stateVariableDeepListen/SVDeepListenMakeObservedFalseTest.test';
import SVDeepListenObservedAndObjectlinkTest from './stateVariableDeepListen/SVDeepListenObservedAndObjectlinkTest.test';
import SVDeepListenObservedBuiltInTest from './stateVariableDeepListen/SVDeepListenObservedBuiltInTest.test';
import GlobalReusePoolTest from './uiutilsTest/GlobalReusePool.test';
import GlobalReusePool002Test from './uiutilsTest/GlobalReusePool002.test';
import GlobalReusePool003Test from './uiutilsTest/GlobalReusePool003.test';
import GlobalReusePool004Test from './uiutilsTest/GlobalReusePool004.test';
import StaticCoverageComponentTest from './staticCoverage/StaticCoverageComponent.test';
import StaticCoverageDecoratorTest from './staticCoverage/StaticCoverageDecorator.test';
import StaticCoverageStorageTest from './staticCoverage/StaticCoverageStorage.test';
import StaticCoverageUtilsTest from './staticCoverage/StaticCoverageUtils.test';
 
 
export default function testsuite(): void {
  StaticCoverageComponentTest();
  StaticCoverageDecoratorTest();
  StaticCoverageStorageTest();
  StaticCoverageUtilsTest();
  //repeatReusableFalse(); 
  //repeatReusableTrue(); 
  GlobalReusePool004Test();
  SVDeepListenMakeObservedTest();
  SVDeepListenMakeObservedFalseTest();
  SVDeepListenObservedAndObjectlinkTest();
  SVDeepListenObservedBuiltInTest();
  GlobalReusePool002Test();
  GlobalReusePool003Test();
  GlobalReusePoolTest();
  
}
