/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function RefreshOffsetMinTest() {
  describe('RefreshOffsetMinTest', () => {
    beforeEach(async (done: Function) => {
      console.info('refreshOffsetMin beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshOffsetMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get refreshOffsetMin state pages: ' + JSON.stringify(pages));
        if (!('refreshOffsetMin' == pages.name)) {
          console.info('get refreshOffsetMin state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push refreshOffsetMin success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push refreshOffsetMin page error: ' + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_REFRESH_REFRESHOFFSET_1_0100
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_1_0100
     * @tc.desc   Test Refresh refreshOffset property with value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REFRESH_REFRESHOFFSET_1_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_1_0100] START');

      let strJson: string = getInspectorByKey('refresh_refreshOffset_1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_1_0100] obj is: ' + JSON.stringify(obj.$attrs));
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_1_0100] refreshOffset is: ' + obj.$attrs.refreshOffset);

      expect(obj.$type).assertEqual('Refresh');
      expect(obj.$attrs.refreshOffset).assertEqual('1.00vp');
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_1_0100] END');
    })

    /**
     * @tc.name   SUB_ARKUI_REFRESH_REFRESHOFFSET_0_0100
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_0_0100
     * @tc.desc   Test Refresh refreshOffset property with value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REFRESH_REFRESHOFFSET_0_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_0_0100] START');

      let strJson: string = getInspectorByKey('refresh_refreshOffset_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_0_0100] obj is: ' + JSON.stringify(obj.$attrs));
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_0_0100] refreshOffset is: ' + obj.$attrs.refreshOffset);

      expect(obj.$type).assertEqual('Refresh');
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_0_0100] END');
    })

  })
}
