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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function refreshOffsetTest() {
  describe('refreshOffsetTest', () => {
    beforeEach(async (done: Function) => {
      console.info('refreshOffsetTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/RefreshOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get RefreshOffset state pages: ' + JSON.stringify(pages));
        if (!('RefreshOffset' == pages.name)) {
          console.info('get RefreshOffset state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push RefreshOffset success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RefreshOffset page error: ' + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_REFRESH_REFRESHOFFSET_64_0100
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_64_0100
     * @tc.desc   Test Refresh refreshOffset property with value 64
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REFRESH_REFRESHOFFSET_64_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_64_0100] START');

      let strJson: string = getInspectorByKey('refresh_refreshOffset_64');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_64_0100] obj is: ' + JSON.stringify(obj.$attrs));
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_64_0100] refreshOffset is: ' + obj.$attrs.refreshOffset);

      expect(obj.$type).assertEqual('Refresh');
      expect(obj.$attrs.refreshOffset).assertEqual('64.00vp');
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_64_0100] END');
    })

    /**
     * @tc.name   SUB_ARKUI_REFRESH_REFRESHOFFSET_50_0100
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_50_0100
     * @tc.desc   Test Refresh refreshOffset property with value 50
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REFRESH_REFRESHOFFSET_50_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_50_0100] START');

      let strJson: string = getInspectorByKey('refresh_refreshOffset_50');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_50_0100] obj is: ' + JSON.stringify(obj.$attrs));
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_50_0100] refreshOffset is: ' + obj.$attrs.refreshOffset);

      expect(obj.$type).assertEqual('Refresh');
      expect(obj.$attrs.refreshOffset).assertEqual('50.00vp');
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_50_0100] END');
    })

    /**
     * @tc.name   SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100
     * @tc.desc   Test Refresh refreshOffset property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100] START');

      let strJsonCompare: string = getInspectorByKey('refresh_refreshOffset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('refresh_refreshOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100] default obj is: ' + JSON.stringify(objCompare.$attrs));
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100] null obj is: ' + JSON.stringify(obj.$attrs));
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100] default refreshOffset is: ' +
        objCompare.$attrs.refreshOffset);
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100] null refreshOffset is: ' + obj.$attrs.refreshOffset);

      expect(obj.$attrs.refreshOffset).assertEqual(objCompare.$attrs.refreshOffset);
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_NULL_0100] END');
    })

    /**
     * @tc.name   SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100
     * @tc.number SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100
     * @tc.desc   Test Refresh refreshOffset property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100] START');

      let strJsonCompare: string = getInspectorByKey('refresh_refreshOffset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('refresh_refreshOffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100] default obj is: ' +
        JSON.stringify(objCompare.$attrs));
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100] undefined obj is: ' + JSON.stringify(obj.$attrs));
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100] default refreshOffset is: ' +
        objCompare.$attrs.refreshOffset);
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100] undefined refreshOffset is: ' +
        obj.$attrs.refreshOffset);

      expect(obj.$attrs.refreshOffset).assertEqual(objCompare.$attrs.refreshOffset);
      console.info('[SUB_ARKUI_REFRESH_REFRESHOFFSET_UNDEFINED_0100] END');
    })

  })
}
