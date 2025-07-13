/**
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
import IfElse001Test from './IfElseTest/IfElse001.test';
import IfElse002Test from './IfElseTest/IfElse002.test';
import IfElse003Test from './IfElseTest/IfElse003.test';
// import IfElse004Test from './IfElseTest/IfElse004.test';
import IfElse005Test from './IfElseTest/IfElse005.test';
import LinkTest0090 from './link/LinkTest0090.test';
import Link0100TestJsunit from './link/Link0100TestJsunit.test';
// import IfElseTest0100 from './IfElseTest/IfElseTest0100.test';
// import WatchLinkTest0050 from './watchTest/WatchLinkTest0050.test';
// import StateUndefinedTest0010 from './state/StateUndefinedTest0010.test';
import stateArr from './state/stateArr.test';
import StateTest0040 from './state/StateTest0040.test';
import StateTest0080 from './state/StateTest0080.test';
import StateTest0070 from './state/StateTest0070.test';
import StateTest0090 from './state/StateTest0090.test';
import StateMap0010TestJsunit from './state/StateMap0010TestJsunit.test';
import StateSet0010TestJsunit from './state/StateSet0010TestJsunit.test';
import Observed0060TestJsunit from './observed_object/Observed0060TestJsunit.test';
// import appStorageRefJsunit from './StorageTest/appStorageRefJsunit.test';
// import AbstractPropertyRefTest from './StorageTest/AbstractPropertyRefTest.test';
import DataOperationTypeTest from './LazyForEach/DataOperationTypeTest.test';
import lazyChangeJsunit from './LazyForEach/lazyChangeJsunit.test';
import lazyReloadJsunit from './LazyForEach/lazyReloadJsunit.test';
// import Prefetcher1 from './LazyForEach/Prefetcher1.test';
// import Prefetcher2 from './LazyForEach/Prefetcher2.test';
import LazyForEachTest0470 from './LazyForEach/LazyForEachTest0470.test';
import LazyForEachTest0120 from './LazyForEach/LazyForEachTest0120.test';
import LazyForEachChangeTest0020 from './LazyForEach/LazyForEachChangeTest0020.test';
// import LazyForEachAdd from './LazyForEach/LazyForEachAdd.test';
// import LazyForEachDelete from './LazyForEach/LazyForEachDelete.test';
// import LazyForEachMove from './LazyForEach/LazyForEachMove.test';
import LazyForEachCacheEnhance from './LazyForEach/LazyForEachCacheEnhance.test';
// import LazyForEachVisibleAreaChange from './LazyForEach/LazyForEachVisibleAreaChange.test';
// import LazyForEachSingleBoolean from './LazyForEach/LazyForEachSingleBoolean.test';
// import LazyForEachSingleNumber from './LazyForEach/LazyForEachSingleNumber.test';
// import LazyForEachSingleString from './LazyForEach/LazyForEachSingleString.test';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function testsuite() {
  IfElse001Test();
  IfElse002Test();
  IfElse003Test();
  // IfElse004Test();
  // IfElseTest0100();
  IfElse005Test();
  LinkTest0090();
  Link0100TestJsunit();
  // WatchLinkTest0050();
  // StateUndefinedTest0010();
  stateArr();
  StateTest0040();
  StateTest0080();
  StateTest0070();
  StateTest0090();
  StateMap0010TestJsunit();
  StateSet0010TestJsunit();
  Observed0060TestJsunit();
  // appStorageRefJsunit();
  // AbstractPropertyRefTest();
  DataOperationTypeTest();
  lazyChangeJsunit();
  lazyReloadJsunit();
  // Prefetcher1();
  // Prefetcher2();
  LazyForEachTest0470();
  LazyForEachTest0120();
  LazyForEachChangeTest0020();
  // LazyForEachAdd();
  // LazyForEachDelete();
  // LazyForEachMove();
  LazyForEachCacheEnhance();
  // LazyForEachVisibleAreaChange();
  // LazyForEachSingleBoolean();
  // LazyForEachSingleNumber();
  // LazyForEachSingleString();
}
