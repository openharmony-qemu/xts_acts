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
 
import RepeatCloseReuseTest0110 from './repeat/RepeatCloseReuseTest0110.test';
import RepeatLazyTest0150 from './repeat/RepeatLazyTest0150.test';
import BasicPrefetcherMethods from './Prefetcher/BasicPrefetcherMethods.test';
import IDataSourcePrefetchingMethods from './Prefetcher/IDataSourcePrefetchingMethods.test';
import ReuseObjectRawTest from './ReuseObject/ReuseObjectRawTest.test';
import LazyForEachReleaseStrategyTest from './LazyForeach/LazyForEachReleaseStrategy.test';
import LazyForEachCustomComponentFreezeModeStaticTest from './LazyForeach/LazyForEachCustomComponentFreezeModeStaticTest.test';
import RepeatAllowReuseInAnimationGridTest from './repeat/RepeatAllowReuseInAnimationGridTest.test';
import RepeatAllowReuseInAnimationWaterFlowTest from './repeat/RepeatAllowReuseInAnimationWaterFlowTest.test';
import RepeatAllowReuseInAnimationNullUndefinedTest from './repeat/RepeatAllowReuseInAnimationNullUndefinedTest.test';
import ClearCacheLazyForEachReusableStaticTest from './LazyForeach/ClearCacheLazyForEachReusableStatic.test';
import ClearCacheLazyForEachReusableV2StaticTest from './LazyForeach/ClearCacheLazyForEachReusableV2Static.test';
import IDefaultReusePoolClearCacheNullUndefinedStaticTest from './LazyForeach/IDefaultReusePoolClearCacheNullUndefinedStatic.test';
import ClearCacheRepeatReusableStaticTest from './repeat/ClearCacheRepeatReusableStatic.test';
import ClearCacheRepeatReusableV2StaticTest from './repeat/ClearCacheRepeatReusableV2Static.test';

export default function testsuite() {
  //RepeatCloseReuseTest0110();
  //RepeatLazyTest0150();
  BasicPrefetcherMethods();
  IDataSourcePrefetchingMethods();
  //ReuseObjectRawTest();
  LazyForEachReleaseStrategyTest();
  LazyForEachCustomComponentFreezeModeStaticTest();
  RepeatAllowReuseInAnimationGridTest();
  RepeatAllowReuseInAnimationWaterFlowTest();
  RepeatAllowReuseInAnimationNullUndefinedTest();
  ClearCacheLazyForEachReusableStaticTest();
  ClearCacheLazyForEachReusableV2StaticTest();
  IDefaultReusePoolClearCacheNullUndefinedStaticTest();
  ClearCacheRepeatReusableStaticTest();
  ClearCacheRepeatReusableV2StaticTest();
}