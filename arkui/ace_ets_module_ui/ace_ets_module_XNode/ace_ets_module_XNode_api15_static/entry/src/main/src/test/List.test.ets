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
import lazyForEachTest from './FrameNodeTest/lazyForEachTest.test';
import ApplyNormalAttributeTest from './AttributeUpdaterTest/ApplyNormalAttribute.test';  // 阻塞
import UIObserverDensityUpdateTest from './ObserverTest/UIObserverDensityUpdate.test';
import UIObserverWillDrawTest from './ObserverTest/UIObserverWillDraw.test';
import UIObserverDidLayoutTest from './ObserverTest/UIObserverDidLayout.test';

export default function testsuite() {
  lazyForEachTest();  // （page188）getFirstChildIndexWithoutExpand 造成app Died 8个用例
  ApplyNormalAttributeTest(); //pass
  UIObserverDensityUpdateTest(); // (page39).getUIObserver().on('densityUpdate', this.densityUpdateCallback); 造成app died 1个用例
  UIObserverWillDrawTest(); // .getUIObserver().on('willDraw', this.willDrawCallback); 1个用例
  UIObserverDidLayoutTest(); // .getUIObserver().on('didLayout', this.didLayoutCallback);1个用例
}