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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';

export default function webEnableFullscreenVideoOverlay() {
  describe('WebEnableFullscreenVideoOverlayTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(3000);
      console.log('App start')
    });

    beforeEach(async () => {
      await Utils.msSleep(5000);
      console.info('WebEnableFullscreenVideoOverlay beforeEach start');
    })

    /**
     * @tc.name   testEnableFullscreenVideoOverlayStatic001
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0100
     * @tc.desc   test enableFullscreenVideoOverlay with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableFullscreenVideoOverlayStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableFullscreenVideoOverlayTrue', 10);
        Utils.registerEvent('testEnableFullscreenVideoOverlayStatic001', 'success', 20260601, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('EnableFullscreenVideoOverlayTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testEnableFullscreenVideoOverlayStatic002
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0200
     * @tc.desc   test enableFullscreenVideoOverlay with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableFullscreenVideoOverlayStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableFullscreenVideoOverlayFalse', 10);
        Utils.registerEvent('testEnableFullscreenVideoOverlayStatic002', 'success', 20260602, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('EnableFullscreenVideoOverlayTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testEnableFullscreenVideoOverlayStatic003
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0300
     * @tc.desc   test enableFullscreenVideoOverlay with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableFullscreenVideoOverlayStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitEnableFullscreenVideoOverlayUndefined', 10);
        Utils.registerEvent('testEnableFullscreenVideoOverlayStatic003', 'success', 20260603, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('EnableFullscreenVideoOverlayTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}
