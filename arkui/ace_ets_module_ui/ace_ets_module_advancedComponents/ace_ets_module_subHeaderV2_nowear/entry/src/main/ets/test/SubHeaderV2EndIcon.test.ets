/**
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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';

export default function subHeaderV2EndIcon() {
  describe('subHeaderV2EndIcon', () => {
    beforeEach(async (done: Function) => {
      console.info('subHeaderV2EndIcon beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/subHeaderV2EndIcon',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get subHeaderV2EndIcon state pages: ' + JSON.stringify(pages));
        if (!('SubHeaderV2EndIconExample' == pages.name)) {
          console.info('get subHeaderV2EndIcon pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push subHeaderV2EndIcon page result successful');
        }
      } catch (err) {
        console.error('push subHeaderV2EndIcon page error: ' + err);
      }

      await CommonFunc.sleep(1000);
      console.info('subHeaderV2EndIcon beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('subHeaderV2EndIcon after each called');
    })

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0100
     * @tc.name   subHeaderV2EndIcon_0100
     * @tc.desc   Test SubHeaderV2 endIcon with image resource
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderV2EndIcon_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderV2EndIcon_0100] START');
      let strJson: string = getInspectorByKey('subheaderv2_endicon_image');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderV2EndIcon_0100] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SubHeaderV2');
      expect(obj.$attrs.endIcon !== undefined && obj.$attrs.endIcon !== null).assertTrue();
      console.info('[subHeaderV2EndIcon_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0200
     * @tc.name   subHeaderV2EndIcon_0200
     * @tc.desc   Test SubHeaderV2 endIcon with SymbolGlyphModifier
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderV2EndIcon_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderV2EndIcon_0200] START');
      let strJson: string = getInspectorByKey('subheaderv2_endicon_symbol');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderV2EndIcon_0200] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SubHeaderV2');
      expect(obj.$attrs.endIcon !== undefined && obj.$attrs.endIcon !== null).assertTrue();
      console.info('[subHeaderV2EndIcon_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0300
     * @tc.name   subHeaderV2EndIcon_0300
     * @tc.desc   Test SubHeaderV2 endIcon default value, verify endIcon is undefined when not set
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderV2EndIcon_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderV2EndIcon_0300] START');
      let strJson: string = getInspectorByKey('subheaderv2_endicon_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderV2EndIcon_0300] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SubHeaderV2');
      expect(obj.$attrs.endIcon === undefined || obj.$attrs.endIcon === null).assertTrue();
      console.info('[subHeaderV2EndIcon_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0400
     * @tc.name   subHeaderV2EndIcon_0400
     * @tc.desc   Test SubHeaderV2 primaryTitle + secondaryTitle + endIcon(image) — scenario 5
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderV2EndIcon_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderV2EndIcon_0400] START');
      let strJson: string = getInspectorByKey('subheaderv2_endicon_primary_secondary');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderV2EndIcon_0400] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SubHeaderV2');
      expect(obj.$attrs.endIcon !== undefined && obj.$attrs.endIcon !== null).assertTrue();
      console.info('[subHeaderV2EndIcon_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_SUBHEADERV2_ENDICON_0500
     * @tc.name   subHeaderV2EndIcon_0500
     * @tc.desc   Test SubHeaderV2 endIcon + operationItems coexist
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('subHeaderV2EndIcon_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[subHeaderV2EndIcon_0500] START');
      let strJson: string = getInspectorByKey('subheaderv2_endicon_operation');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[subHeaderV2EndIcon_0500] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj.$type).assertEqual('SubHeaderV2');
      expect(obj.$attrs.endIcon !== undefined && obj.$attrs.endIcon !== null).assertTrue();
      console.info('[subHeaderV2EndIcon_0500] END');
      done();
    });
  })
}
