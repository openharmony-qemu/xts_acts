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

import ArrayLikeStringTest from './ArrayLikeTest/ArrayLikeStringTest.test';
import RepeatCloseReuseTest0110 from './repeat/RepeatCloseReuseTest0110.test';
import RepeatLazyTest0150 from './repeat/RepeatLazyTest0150.test';
import repeatReusableFalse from './ReusableTest/repeatReusableFalse.test';
import repeatReusableTrue from './ReusableTest/repeatReusableTrue.test';
import ReuseV2Test0030 from './ReuseV2Test/ReuseV2Test0030.test';
import AddMonitorErrorCode from './AddMonitorTest/AddMonitorErrorCode.test';
import AddMonitorNoPath from './AddMonitorTest/AddMonitorNoPath.test';
import AddMonitorSetPath from './AddMonitorTest/AddMonitorSetPath.test';
import AddMonitorObservedV2Int from './AddMonitorTest/AddMonitorObservedV2Int.test';
import AddMonitorObservedV2Boolean from './AddMonitorTest/AddMonitorObservedV2Boolean.test';
import AddMonitorObservedV2String from './AddMonitorTest/AddMonitorObservedV2String.test';
import AddMonitorObservedV2Array from './AddMonitorTest/AddMonitorObservedV2Array.test';
import AddMonitorObservedV2Date from './AddMonitorTest/AddMonitorObservedV2Date.test';
import AddMonitorObservedV2Map from './AddMonitorTest/AddMonitorObservedV2Map.test';
import AddMonitorObservedV2Set from './AddMonitorTest/AddMonitorObservedV2Set.test';
import AddMonitorParentChild from './AddMonitorTest/AddMonitorParentChild.test';
import AddMonitorTwoDimensionalArray from './AddMonitorTest/AddMonitorTwoDimensionalArray.test';
import BasicPrefetcherMethods from './Prefetcher/BasicPrefetcherMethods.test';
import IDataSourcePrefetchingMethods from './Prefetcher/IDataSourcePrefetchingMethods.test';
import ReuseObjectRawTest from './ReuseObject/ReuseObjectRawTest.test';
import LazyForEachReleaseStrategyTest from './LazyForeach/LazyForEachReleaseStrategy.test';
import LazyForEachCustomComponentFreezeModeStaticTest from './LazyForeach/LazyForEachCustomComponentFreezeModeStaticTest.test';
import SyncMonitorNotWildcardsTest from './SyncMonitor/SyncMonitorNotWildcards.test';
import PersistentStorageApiTest from './PersistentStorage/PersistentStorageApi.test';
import PersistenceV2ApiTest from './PersistenceV2/PersistenceV2Api.test';
import PersistenceV2DefaultSubCreatorsTest from './PersistenceV2/PersistenceV2DefaultSubCreators.test';
import PersistenceV2AbnormalDefaultSubCreatorsTest from './PersistenceV2/PersistenceV2AbnormalDefaultSubCreators.test';
import AddMonitorWildcard from './AddMonitorTest/AddMonitorWildcard.test';
import AddMonitorWildcardUnerfined from './AddMonitorTest/AddMonitorWildcardUnerfined.test';
import MonitorWildcards from './Monitor/MonitorWildcards.test';
import PersistenceV2NotifyOnErrorTest from './PersistenceV2/PersistenceV2NotifyOnErrorTest.test';
import componentLifecycleDecoratorsTest from './lifecycle/ComponentLifecycleDecorators.test';
import reuseComponentLifecycleTest from './lifecycle/ReuseComponentLifecycle.test';
import reuseV2ComponentLifecycleTest from './lifecycle/ReuseV2ComponentLifecycle.test';
import SVDeepListenMakeObservedTest from './stateVariableDeepListen/SVDeepListenMakeObservedTest.test';
import SVDeepListenMakeObservedFalseTest from './stateVariableDeepListen/SVDeepListenMakeObservedFalseTest.test';
import SVDeepListenObservedAndObjectlinkTest from './stateVariableDeepListen/SVDeepListenObservedAndObjectlinkTest.test';
import SVDeepListenObservedBuiltInTest from './stateVariableDeepListen/SVDeepListenObservedBuiltInTest.test';
import AppStorageV2Api from './AppStorageV2/AppStorageV2Api.test';
import DumpObject from './DumpObjectTest/DumpObject.test';
import GlobalReusePoolTest from './uiutilsTest/GlobalReusePool.test';
import GlobalReusePool002Test from './uiutilsTest/GlobalReusePool002.test';
import GlobalReusePool003Test from './uiutilsTest/GlobalReusePool003.test';
import GlobalReusePool004Test from './uiutilsTest/GlobalReusePool004.test';
import AddMonitorWildcard2 from './AddMonitorTest/AddMonitorWildcard2.test';


export default function testsuite(): void {
  ArrayLikeStringTest(); 
  GlobalReusePool004Test();
  //RepeatCloseReuseTest0110(); 
  //RepeatLazyTest0150();  
  //repeatReusableFalse(); 
  //repeatReusableTrue(); 
  //ReuseV2Test0030(); 
  AddMonitorNoPath(); 
  AddMonitorSetPath(); 
  AddMonitorObservedV2Int(); 
  AddMonitorObservedV2Boolean(); 
  AddMonitorObservedV2String(); 
  AddMonitorObservedV2Array(); 
  AddMonitorObservedV2Date(); 
  AddMonitorObservedV2Map(); 
  AddMonitorObservedV2Set(); 
  AddMonitorErrorCode();
  AddMonitorParentChild();
  AddMonitorTwoDimensionalArray(); 
  BasicPrefetcherMethods();
  IDataSourcePrefetchingMethods();
  //ReuseObjectRawTest(); 
  LazyForEachReleaseStrategyTest();
  LazyForEachCustomComponentFreezeModeStaticTest();
  SyncMonitorNotWildcardsTest();
  PersistentStorageApiTest();
  PersistenceV2ApiTest();
  PersistenceV2DefaultSubCreatorsTest();
  PersistenceV2AbnormalDefaultSubCreatorsTest();
  PersistenceV2NotifyOnErrorTest();
  AddMonitorWildcard();
  AddMonitorWildcard2();
  MonitorWildcards();
  AddMonitorWildcardUnerfined();
  componentLifecycleDecoratorsTest();
  reuseComponentLifecycleTest();
  reuseV2ComponentLifecycleTest();
  SVDeepListenMakeObservedTest();
  SVDeepListenMakeObservedFalseTest();
  SVDeepListenObservedAndObjectlinkTest();
  SVDeepListenObservedBuiltInTest();
  AppStorageV2Api();
  DumpObject();
  GlobalReusePool002Test();
  GlobalReusePool003Test();
  GlobalReusePoolTest();
}