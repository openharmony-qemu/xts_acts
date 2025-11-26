'use static';
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
import geometryTransition from './geometryTransitionTest/geometryTransition.test';
import animateToTest from './AnimateToTest.test';
import animationCurveTest from './AnimationCurveTest.test';
import geometryTransitionJsunit from './geometryTransitionTest/GeometryTransitionJsunit.test';
import animatorOnframeJsunit from './Animation/animator.test';
import remoteWindowJsunit from './RemoteWindowTest/remoteWindow.test'
import AnimationJsunit from './AnimationTest/AnimationJsunit.test';
import animateJsunit from './AnimationTest/AnimateJsunit.test';
import animationStatusJsunit from './AnimationTest/AnimationStatusJsunit.test';
import pageTransitionJsunit from './Animation/PageTransitionJsunit.test';
import curvesJsunit from './CurvesJsunit.test';
import WorkerUseCurvesTest from './WorkerUseCurves.test';

export default function testsuite() {
  animateToTest(); // 23 pass 23 1117sdk
  animationCurveTest(); // 5 pass 5 1117sdk
  geometryTransition() // 1 pass 1 1117sdk
  geometryTransitionJsunit() // 1 pass 1 1117sdk
  animatorOnframeJsunit() // 12 pass 9 3用例自动化app died 1117sdk App died
  remoteWindowJsunit() // 9 pass 9 1117sdk
  AnimationJsunit(); // 7 pass 7  1117sdk App died
  animateJsunit(); // 20 pass 20 1117sdk
  animationStatusJsunit(); // 4 pass 4 1117sdk
  curvesJsunit(); // 0 1117sdk
  WorkerUseCurvesTest(); // 1 worker 接口问题
  pageTransitionJsunit(); // 1 pass 1 Navigator替换为Navigation 1117sdk
}