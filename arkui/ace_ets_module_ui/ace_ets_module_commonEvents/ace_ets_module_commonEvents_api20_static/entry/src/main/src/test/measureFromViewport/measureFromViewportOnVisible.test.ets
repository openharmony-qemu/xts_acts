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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function measureFromViewportOnVisibleTest(): void {
  describe('measureFromViewportOnVisibleTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/measureFromViewport/measureFromViewportOnVisible',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[measureFromViewportOnVisibleTest] get state pages: " + JSON.stringify(pages));
        if (!("measureFromViewportOnVisible" == pages.name)) {
          console.info("[measureFromViewportOnVisibleTest] page name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("[measureFromViewportOnVisibleTest] push page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('measureFromViewportOnVisibleTest afterEach sleep error: ' + err);
      }
      console.info("[measureFromViewportOnVisibleTest] afterEach called");
    });

    /**
     * @tc.number   measureFromViewportOnVisible_static_0010
     * @tc.name     measureFromViewportOnVisible_static_0010
     * @tc.desc     onVisibleAreaChange with measureFromViewport=true, visible ratio equals 1
     * @tc.level    Level.LEVEL0
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     */
    it('measureFromViewportOnVisible_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[measureFromViewportOnVisible_static_0010] START');
      await CommonFunc.sleep(500);
      expect(AppStorage.get<number>('measureFromViewportOnVisibleIsTrue')).assertEqual(1);
      console.info('[measureFromViewportOnVisible_static_0010] END');
      done();
    });

    /**
     * @tc.number   measureFromViewportOnVisible_static_0020
     * @tc.name     measureFromViewportOnVisible_static_0020
     * @tc.desc     onVisibleAreaChange with measureFromViewport=false, visible ratio less than 1
     * @tc.level    Level.LEVEL0
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     */
    it('measureFromViewportOnVisible_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[measureFromViewportOnVisible_static_0020] START');
      await CommonFunc.sleep(500);
      expect(AppStorage.get<number>('measureFromViewportOnVisibleIsFalse')).assertLess(1);
      console.info('[measureFromViewportOnVisible_static_0020] END');
      done();
    });
  });
}
