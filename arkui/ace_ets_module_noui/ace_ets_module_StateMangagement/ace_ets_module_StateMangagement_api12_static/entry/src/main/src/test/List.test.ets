/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import ExtendTrackTest from './ObservedV2Test/ExtendTrackTest.test';
import Extend0010TestJsunit from './Extend/Extend0010TestJsunit.test';
import Foreach1 from './Foreach1/Foreach1.test';
import FreezeV2Test from './FreezeV2/Freeze001.test';
import FreezeV2Test03 from './FreezeV2/Freeze002.test';
import FreezeV2Child from './FreezeV2/Freeze003.test';
import LazyForEachAdd from './LazyForEach/LazyForEachAdd.test';
import LazyForEachDelete from './LazyForEach/LazyForEachDelete.test';
import LazyForEachMove from './LazyForEach/LazyForEachMove.test';
import LazyForEachCacheEnhance from './LazyForEach/LazyForEachCacheEnhance.test';
import LazyForEachVisibleAreaChange from './LazyForEach/LazyForEachVisibleAreaChange.test';
import LazyForEachSingleBoolean from './LazyForEach/LazyForEachSingleBoolean.test';
import LazyForEachSingleNumber from './LazyForEach/LazyForEachSingleNumber.test';
import LazyForEachSingleString from './LazyForEach/LazyForEachSingleString.test';
import NestTrackTest from './ObservedV2Test/NestTrackTest.test';
import ObjectArrayTest from './ObservedV2Test/ObjectArrayTest.test';
import OnlyObserveTest from './ObservedV2Test/OnlyObserveTest.test';
import StaticTrackTest from './ObservedV2Test/StaticTrackTest.test';
import TrackDateTest from './ObservedV2Test/TrackDateTest.test';
import TrackMapTest from './ObservedV2Test/TrackMapTest.test';
import TrackSetTest from './ObservedV2Test/TrackSetTest.test';
import TwoNestTrackTest from './ObservedV2Test/TwoNestTrackTest.test';
import ArrayTrackTest from './ObservedV2Test/ArrayTrackTest.test';
import getSharedLocalStorageTest from './GetSharedLocalTest/getSharedLocalStorage.test';
import useSharedStorageTest from './GetSharedLocalTest/useSharedStorage.test';
import Monitor1Test from './MonitorTest/Monitor1.test';
import Monitor2Test from './MonitorTest/Monitor2.test';
import Monitor3Test from './MonitorTest/Monitor3.test';
import Monitor4Test from './MonitorTest/Monitor4.test';
import Monitor5Test from './MonitorTest/Monitor5.test';
import Monitor6Test from './MonitorTest/Monitor6.test';
import RepeatEachJsunit from './RepeatTest/RepeatEachJsunit.test';
import RepeatForeachNumberBool from './RepeatMix/RepeatForeachNumberBool.test';
import RepeatForeachString from './RepeatMix/RepeatForeachString.test';
import RepeatIfElseObject from './RepeatMix/RepeatIfElseObject.test';
import RepeatIfElseBoolean from './RepeatMix/RepeatIfElseBoolean.test';
import RepeatLazyForEachBooleanSource from './RepeatMix/RepeatLazyForEachBooleanSource.test';
import RepeatLazyForEachNumberSource from './RepeatMix/RepeatLazyForEachNumberSource.test';
import RepeatLazyForEachStringSource from './RepeatMix/RepeatLazyForEachStringSource.test';
import RepeatGridBoolean from './RepeatMixedComponent/RepeatGridBoolean.test';
import RepeatGridNumber from './RepeatMixedComponent/RepeatGridNumber.test';
import RepeatListBoolean from './RepeatMixedComponent/RepeatListBoolean.test';
import RepeatListNumber from './RepeatMixedComponent/RepeatListNumber.test';
import RepeatNestObject from './RepeatMix/RepeatNestObject.test';
import RepeatObservedV2Nest from './RepeatMix/RepeatObservedV2Nest.test';
import RepeatSwiperBoolean from './RepeatMixedComponent/RepeatSwiperBoolean.test';
import RepeatSwiperNumber from './RepeatMixedComponent/RepeatSwiperNumber.test';
import RepeatV1Boolean from './RepeatMix/RepeatV1Boolean.test';
import RepeatV1Object from './RepeatMix/RepeatV1Object.test';
import persistStorageATest from './GetSharedLocalTest/persistStorageA.test';
import appStorageRefJsunit from './StorageTest/appStorageRefJsunit.test';
import localStorageRefJsunit from './StorageTest/localStorageRefJsunit.test';
import IMonitorTest from './MonitorTest/IMonitor.test';
import Local1Jsunit from './ComponentV2Test/Local1Jsunit.test';
import Local2Jsunit from './ComponentV2Test/Local2Jsunit.test';
import Param1Jsunit from './ComponentV2Test/Param1Jsunit.test';
import Param2Jsunit from './ComponentV2Test/Param2Jsunit.test';
import Param3Jsunit from './ComponentV2Test/Param3Jsunit.test';
import Param4Jsunit from './ComponentV2Test/Param4Jsunit.test';
import Monitor1Jsunit from './ComponentV2Test/Monitor1Jsunit.test';
import Monitor2Jsunit from './ComponentV2Test/Monitor2Jsunit.test';
import Monitor3Jsunit from './ComponentV2Test/Monitor3Jsunit.test';
import Monitor4Jsunit from './ComponentV2Test/Monitor4Jsunit.test';
import repeatCountJsunit from './RepeatTest/repeatCountJsunit.test';
import repeatKeyJsunit from './RepeatTest/repeatKeyJsunit.test';
import repeatNoTemplateIdJsunit from './RepeatTest/repeatNoTemplateIdJsunit.test';
import repeatVirtualScrollJsunit from './RepeatTest/repeatVirtualScrollJsunit.test';
import LocalTestJsunit from './ComponentV2Test/LocalTestJsunit.test';
import ComponentV2TestJsunit from './ComponentV2Test/ComponentV2TestJsunit.test';
import ParamTestJsunit from './ComponentV2Test/ParamTestJsunit.test';
import ParamTestJsunit1 from './ComponentV2Test/ParamTestJsunit1.test';
import Provider1Test from './ProviderTest/Provider1.test';
import Provider2Test from './ProviderTest/Provider2.test';
import Provider3Test from './ProviderTest/Provider3.test';
import Provider4Test from './ProviderTest/Provider4.test';
import Provider5Test from './ProviderTest/Provider5.test';
import Provider14Test from './ProviderTest/Provider14.test';
import Provider15Test from './ProviderTest/Provider15.test';
import Provider18Test from './ProviderTest/Provider18.test';
import getTarget1Test from './getTargetTest/getTarget1.test';
import getTarget2Test from './getTargetTest/getTarget2.test';
import getTarget3Test from './getTargetTest/getTarget3.test';
import getTarget4Test from './getTargetTest/getTarget4.test';
import getTarget5Test from './getTargetTest/getTarget5.test';
import getTarget6Test from './getTargetTest/getTarget6.test';
import ComputedTest from './ComputedTest/Computed.test';
import makeObservedTest from './makeObservedTest/makeObserved.test';
import makeObserved0020Test from './makeObservedTest/makeObserved0020Test.test';
import makeObserved0030Test from './makeObservedTest/makeObserved0030Test.test';
import makeObserved0040Test from './makeObservedTest/makeObserved0040Test.test';
import makeObserved0050Test from './makeObservedTest/makeObserved0050Test.test';
import makeObserved0060Test from './makeObservedTest/makeObserved0060Test.test';
import makeObserved0070Test from './makeObservedTest/makeObserved0070Test.test';
import makeObserved0080Test from './makeObservedTest/makeObserved0080Test.test';
import makeObserved0100Test from './makeObservedTest/makeObserved0100Test.test';
import makeObserved0110Test from './makeObservedTest/makeObserved0110Test.test';
import makeObserved0120Test from './makeObservedTest/makeObserved0120Test.test';
import makeObserved0130Test from './makeObservedTest/makeObserved0130Test.test';
import makeObserved0150Test from './makeObservedTest/makeObserved0150Test.test';
import twoWayBindTest from './twoWayBindTest/twoWayBind.test';
import IfElse001Test from './IfElseTest/IfElse001.test';
import IfElse002Test from './IfElseTest/IfElse002.test';
import IfElse003Test from './IfElseTest/IfElse003.test';
import IfElse004Test from './IfElseTest/IfElse004.test';
import IfElse005Test from './IfElseTest/IfElse005.test';
import LifeCycle0120TestJsunit from './lifecycle/LifeCycle0120TestJsunit.test';
import LifeCycle0050TestJsunit from './lifecycle/LifeCycle0050TestJsunit.test';
import WrapBuilder0010TestJsunit from './wrap_builder/WrapBuilder0010TestJsunit.test';
import Link0100TestJsunit from './link/Link0100TestJsunit.test';
import ProvideConsume0020TestJsunit from './provide_consume/ProvideConsume0020TestJsunit.test';
import ProvideConsume0030TestJsunit from './provide_consume/ProvideConsume0030TestJsunit.test';
import ProvideConsume0040TestJsunit from './provide_consume/ProvideConsume0040TestJsunit.test';
import ProvideConsume0050TestJsunit from './provide_consume/ProvideConsume0050TestJsunit.test';
import ProvideConsume0080TestJsunit from './provide_consume/ProvideConsume0080TestJsunit.test';
import ProvideConsume0360TestJsunit from './provide_consume/ProvideConsume0360TestJsunit.test';
import StateMap0010TestJsunit from './state/StateMap0010TestJsunit.test';
import StateSet0010TestJsunit from './state/StateSet0010TestJsunit.test';
import Observed0060TestJsunit from './observed_object/Observed0060TestJsunit.test';
import LocalStorageLink0310TestJsunit from './local_storage/LocalStorageLink0310TestJsunit.test';
import LocalStorageProp0320TestJsunit from './local_storage/LocalStorageProp0320TestJsunit.test';
import LocalStorageAbsTestJsunit from './local_storage/LocalStorageAbsTestJsunit.test';
import ComputedLocalTest from './ComputedTest/ComputedLocal.test';
import ComputedMonitorTest from './ComputedTest/ComputedMonitor.test';
import ComputedTraceTest from './ComputedTest/ComputedTrace.test';
import ParamAndOnceTest from './ParamTest/ParamAndOnce.test';
import ParamChangeTest from './ParamTest/ParamChange.test';
import EventTest from './EventTest/Event.test';
import Provider0300Test from './ProviderTest/Provider0300Test.test';
import Monitor0031Test from './MonitorTest/Monitor0031Test.test';
import Monitor0034Test from './MonitorTest/Monitor0034Test.test';
import Monitor0260Test from './MonitorTest/Monitor0260Test.test';
import Monitor0280Test from './MonitorTest/Monitor0280Test.test';
import Monitor0290Test from './MonitorTest/Monitor0290Test.test';
import Monitor0300Test from './MonitorTest/Monitor0300Test.test';
import LinkTest0090 from './link/LinkTest0090.test';
import RepeatTest0040 from './RepeatTest/RepeatTest0040.test';
import MakeObservedTest0090 from './makeObservedTest/MakeObservedTest0090.test';
import stateArr from './state/stateArr.test';
import V1ToV2 from './V1V2Mix/V1ToV2.test';
import V2ToV1 from './V1V2Mix/V2ToV1.test';
import DataOperationTypeTest from './LazyForEach/DataOperationTypeTest.test';
import lazyChangeJsunit from './LazyForEach/lazyChangeJsunit.test';
import lazyReloadJsunit from './LazyForEach/lazyReloadJsunit.test';
import Prefetcher1 from './LazyForEach/Prefetcher1.test';
import Prefetcher2 from './LazyForEach/Prefetcher2.test';
import appStorageV2 from './StorageTest/appStorageV2.test';
import persistenceV2 from './StorageTest/persistenceV2.test';
import StateTest0040 from './state/StateTest0040.test';
import StateTest0080 from './state/StateTest0080.test';
import WrapBuilder0020Test from './wrap_builder/WrapBuilder0020Test.test';
import StateTest0070 from './state/StateTest0070.test';
import StateTest0090 from './state/StateTest0090.test';
import LazyForEachTest0470 from './LazyForEach/LazyForEachTest0470.test';
import IfElseTest0100 from './IfElseTest/IfElseTest0100.test';
import RepeatTest0200 from './RepeatTest/RepeatTest0200.test';
import MakeObservedTest0300 from './makeObservedTest/MakeObservedTest0300.test';
import WatchLinkTest0050 from './watchTest/WatchLinkTest0050.test';
import ProvideConsumeTest0010 from './provide_consume/ProvideConsumeTest0010.test';
import ProviderTest0270 from './ProviderTest/ProviderTest0270.test';
import StateUndefinedTest0010 from './state/StateUndefinedTest0010.test';
import AbstractPropertyRefTest from './StorageTest/AbstractPropertyRefTest.test';
import SubAbstractPropertyLinkTest from './StorageTest/SubAbstractPropertyLinkTest.test';
import EnvironmentTest0040 from './StorageTest/EnvironmentTest0040.test';
import LocalStorageDeleteTest0120 from './StorageTest/LocalStorageDeleteTest0120.test';
import LazyForEachTest0120 from './LazyForEach/LazyForEachTest0120.test';
import LazyForEachChangeTest0020 from './LazyForEach/LazyForEachChangeTest0020.test';
import RepeatTest0020 from './RepeatTest/RepeatTest0020.test';
import LazyForEachInterface from './LazyForEach/LazyForEachInterface.test';
import RepeatTest0010 from './RepeatTest/RepeatTest0010.test';
import RepeatTest0400 from './RepeatTest/RepeatTest0400.test';

export default function testsuite() {
  // // ExtendTrackTest(); //全pass 注释
  // Extend0010TestJsunit(); //一个断言失败 颜色不相等 backgroundColor 页面代码有注释
  //
  // //全pass 注释
  // // Foreach1();
  // // FreezeV2Test();
  // // FreezeV2Child();
  //
  // LazyForEachAdd();  //页面白屏 Null cannot be cast to @ohos.UiTest.Component
  // LazyForEachDelete();  //页面白屏 Null cannot be cast to @ohos.UiTest.Component
  // LazyForEachMove();  //页面白屏 Null cannot be cast to @ohos.UiTest.Component
  // LazyForEachCacheEnhance();
  // LazyForEachVisibleAreaChange();
  // // LazyForEachSingleBoolean();  //pass 注释
  // // LazyForEachSingleNumber();  //pass 注释
  // // LazyForEachSingleString();  //pass 注释
  // // NestTrackTest(); //全pass 注释
  // // StaticTrackTest(); //全pass 注释
  // getSharedLocalStorageTest(); //expect propAM:undefined equals propAM:47
  // useSharedStorageTest(); //expect propBM:0 equals propBM:40
  //
  // //全pass 注释
  // // ObjectArrayTest();
  // // OnlyObserveTest();
  // // TrackDateTest();
  // // TrackMapTest();
  // // TrackSetTest();
  // // TwoNestTrackTest();
  // // ArrayTrackTest();
  // // Monitor1Test();
  // // Monitor2Test();
  // // Monitor3Test();
  // // Monitor4Test();
  // // Monitor5Test();
  // // Monitor6Test();
  //
  // RepeatEachJsunit();
  // RepeatForeachNumberBool();
  // RepeatForeachString();
  // // RepeatLazyForEachBooleanSource(); //pass 注释
  // // RepeatLazyForEachNumberSource(); //pass 注释
  // // RepeatLazyForEachStringSource(); //pass 注释
  //
  // //全pass 注释
  // // RepeatIfElseObject();
  // // RepeatIfElseBoolean();
  // // RepeatGridBoolean();
  // // RepeatGridNumber();
  // // RepeatListBoolean();
  // // RepeatListNumber();
  // // RepeatNestObject();
  // // RepeatObservedV2Nest();
  // // RepeatSwiperBoolean();
  // // RepeatSwiperNumber();
  // // RepeatV1Boolean();
  // // RepeatV1Object();
  //
  // persistStorageATest();  //expect PropAX:1 equals PropAX:47
  // appStorageRefJsunit();   //
  // localStorageRefJsunit();  //
  //
  //
  // IMonitorTest();
  // // Local1Jsunit();  //全pass 注释
  // // Local2Jsunit();  //全pass 注释
  // // Param1Jsunit(); //全pass 注释
  // // Param2Jsunit(); //全pass 注释
  // // Param3Jsunit(); //全pass 注释
  // // Param4Jsunit(); //全pass 注释
  // // Monitor1Jsunit(); //全pass 注释
  // Monitor2Jsunit(); //inspector.getInspectorByKey('extends_mes');null 空指针
  // Monitor3Jsunit(); //await (btn?.click() as Promise<void>)空指针
  // // Monitor4Jsunit(); //全pass 注释
  // // repeatCountJsunit();  //全pass 注释
  // // repeatNoTemplateIdJsunit(); //全pass 注释
  // // repeatKeyJsunit(); //全pass 注释
  // repeatVirtualScrollJsunit();
  // // LocalTestJsunit();  //全pass 注释
  // // ComponentV2TestJsunit(); //全pass 注释
  // // ParamTestJsunit();  //全pass 注释
  // // ParamTestJsunit1(); //全pass 注释
  // // Provider1Test();  //全pass 注释
  // // Provider2Test();  //全pass 注释
  // // Provider3Test();  //全pass 注释
  // // Provider4Test();  //全pass 注释
  // // Provider5Test();  //全pass 注释
  // // Provider14Test();  //全pass 注释
  // // Provider15Test();  //全pass 注释
  // // Provider18Test();  //全pass 注释
  // getTarget1Test(); //使用最新SDK尝试 未解决
  // // getTarget2Test();  //全pass 注释
  // // getTarget3Test(); //全pass 注释
  // getTarget4Test();
  // getTarget5Test();  //expect Tom equals Bob
  // // getTarget6Test(); //全pass 注释
  // // ComputedTest(); //全pass 注释
  // makeObservedTest();
  // makeObserved0020Test();  //collections.Array不存在 页面注释导致页面白屏1用例
  // // makeObserved0030Test();  //pass 注释
  // makeObserved0040Test();  //collections.Set 页面注释页面未加载1用例
  // makeObserved0050Test();  //页面白屏1用例
  // makeObserved0060Test();  //pass 注释
  // makeObserved0070Test();  //页面有注释 1
  // makeObserved0080Test();
  // // makeObserved0110Test(); //pass 注释
  // makeObserved0120Test();  //页面有注释 1
  // makeObserved0130Test();
  // makeObserved0150Test();
  // twoWayBindTest();
  //
  // //全pass 注释
  // // IfElse001Test();
  // // IfElse002Test();
  // // IfElse003Test();
  // // IfElse004Test();
  // // IfElse005Test();
  //
  // LifeCycle0050TestJsunit();
  // //全pass 注释
  // // WrapBuilder0010TestJsunit();
  // // ProvideConsume0020TestJsunit();
  // // ProvideConsume0030TestJsunit();
  // // ProvideConsume0040TestJsunit(); //全pass 注释
  // ProvideConsume0050TestJsunit();
  // // ProvideConsume0080TestJsunit();  //全pass 注释
  // // ProvideConsume0360TestJsunit(); //全pass 注释
  // Link0100TestJsunit();
  // // StateMap0010TestJsunit(); //全pass 注释
  // // StateSet0010TestJsunit(); //全pass 注释
  // stateArr();
  // // Observed0060TestJsunit(); //全pass 注释
  // LocalStorageLink0310TestJsunit(); //页面有注释 2用例
  // LocalStorageProp0320TestJsunit(); //页面有注释 2用例
  // LocalStorageAbsTestJsunit(); //页面未加载
  // ComputedLocalTest(); //create page failed, name: Error message: Attempt to modify state variables from @Computed function
  // ComputedMonitorTest(); //create page failed, name: Error message: Attempt to modify state variables from @Computed function
  // ComputedTraceTest(); //create page failed, name: Error message: Attempt to modify state variables from @Computed function
  //
  // //全pass 注释
  // // ParamAndOnceTest();
  // // ParamChangeTest();
  // // EventTest();
  // // Monitor0031Test();
  // // Monitor0034Test();
  // // Provider0300Test();
  // // Monitor0260Test();
  //
  // Monitor0280Test();
  // // Monitor0290Test(); //全pass 注释
  // Monitor0300Test();
  // LinkTest0090(); //get('content')不存在
  // // RepeatTest0040(); //全pass 注释
  // MakeObservedTest0090(); //expect Jerry equals Tom
  // // V1ToV2();  //全pass 注释
  // V2ToV1(); //@BuilderParam注释导致1用例failed
  // Prefetcher1();  // 页面编译不通过 页面注释 1用例
  // Prefetcher2(); // 页面编译不通过 页面注释 1用例
  // appStorageV2(); // 页面编译不通过 页面注释 2用例
  // persistenceV2(); // 页面编译不通过 页面注释 3用例
  // // StateTest0040();  //全pass 注释
  // // StateTest0080();  //全pass 注释
  // // WrapBuilder0020Test(); //全pass 注释
  // StateTest0070();
  // StateTest0090();
  // // LazyForEachTest0470(); //全pass 注释
  // // IfElseTest0100(); //全pass 注释
  // // RepeatTest0200(); //全pass 注释
  // MakeObservedTest0300();
  // // WatchLinkTest0050(); //全pass 注释
  // // ProvideConsumeTest0010(); //全pass 注释
  // // ProviderTest0270(); //全pass 注释
  // StateUndefinedTest0010(); //页面注释导致1用例failed
  // AbstractPropertyRefTest();  //页面未加载
  // SubAbstractPropertyLinkTest(); //页面未加载
  // EnvironmentTest0040();
  // // LocalStorageDeleteTest0120(); //全pass 注释
  // LazyForEachInterface(); //@Reusable生命周期函数未调用
  // // RepeatTest0010(); //全pass 注释
  // // RepeatTest0020(); //全pass 注释
  // // RepeatTest0400(); //全pass 注释
  //
  //
  // // FreezeV2Test03(); //代码有注释
  // makeObserved0100Test(); //pass 注释
  // DataOperationTypeTest();  // 10.13SDK app died DataOperationTypeTest_static_0100
  // lazyChangeJsunit();  //10.13SDK app died lazyChangeJsunit_static_0100
  // lazyReloadJsunit();  //10.13 app died lazyReloadJsunit_static_0100
  // LazyForEachTest0120();  //10.13SDK app died LazyForEachTest0120_static_0100
  // LazyForEachChangeTest0020();  //10.13SDK app died LazyForEachChangeTest0020_static_0100
}
