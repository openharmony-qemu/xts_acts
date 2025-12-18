'use static';
/*
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

import getXComponentSurfaceRectJsunit from './XComponentTest/getXComponentSurfaceRect.test';
import onSurfaceCreatedJsunit from './XComponentTest/onSurfaceCreated.test';
import stopImageAnalyzerJsunit from './XComponentTest/stopImageAnalyzer.test';
import setXComponentSurfaceRotationJsunit from './XComponentTest/setXComponentSurfaceRotation.test';
import VideoTest1 from './VideoTest/VideoTest1.test';
import VideoTest2 from './VideoTest/VideoTest2.test';
import VideoReset1 from './VideoTest/VideoReset/VideoReset1.test';
import VideoReset2 from './VideoTest/VideoReset/VideoReset2.test';
import VideoReset3 from './VideoTest/VideoReset/VideoReset3.test';
import VideoReset4 from './VideoTest/VideoReset/VideoReset4.test';
import VideoReset5 from './VideoTest/VideoReset/VideoReset5.test';
import VideoReset6 from './VideoTest/VideoReset/VideoReset6.test';
import VideoReset7 from './VideoTest/VideoReset/VideoReset7.test';
import VideoReset8 from './VideoTest/VideoReset/VideoReset8.test';
import VideoReset9 from './VideoTest/VideoReset/VideoReset9.test';
import VideoReset10 from './VideoTest/VideoReset/VideoReset10.test';
import VideoReset11 from './VideoTest/VideoReset/VideoReset11.test';
import VideoReset12 from './VideoTest/VideoReset/VideoReset12.test';
import VideoReset13 from './VideoTest/VideoReset/VideoReset13.test';
import VideoReset14 from './VideoTest/VideoReset/VideoReset14.test';
import SurfaceRotationOptionsLockTest from './XComponentTest/SurfaceRotationOptionsLock.test';
import MovingPhotoView from './MovingPhotoView/MovingPhotoView.test.ets';
import onTerminated from './EmbeddedComponentTest/onTerminated.test.ets';
import inputMethodListTest from './InputMethodList/inputMethodListTest.test';

export default function testsuite() {
  onSurfaceCreatedJsunit(); // app died this.createText = AppStorage.get<string>('onSurfaceCreated')!

  stopImageAnalyzerJsunit(); //全pass 注释
  VideoTest1(); //全pass 注释
  VideoTest2(); //全pass 注释
  VideoReset1(); //全pass 注释
  VideoReset2(); //全pass 注释
  VideoReset3(); //全pass 注释
  VideoReset4(); //全pass 注释
  VideoReset5(); //全pass 注释
  VideoReset6(); //全pass 注释
  VideoReset7(); //全pass 注释
  VideoReset8(); //全pass 注释
  VideoReset9(); //全pass 注释1
  VideoReset10(); //全pass 注释1
  VideoReset11(); //全pass 注释1
  VideoReset12(); //全pass 注释1
  VideoReset13(); //全pass 注释1
  // 17 pass 17

  VideoReset14(); // 1 pass 1 需联网
  inputMethodListTest(); // 1 pass 1
  SurfaceRotationOptionsLockTest(); // 1 pass 1
  getXComponentSurfaceRectJsunit(); //expect null equals {"offsetX":20,"offsetY":20,"surfaceWidth":500,"surfaceHeight":500}
  setXComponentSurfaceRotationJsunit(); // JSON.stringify()
}