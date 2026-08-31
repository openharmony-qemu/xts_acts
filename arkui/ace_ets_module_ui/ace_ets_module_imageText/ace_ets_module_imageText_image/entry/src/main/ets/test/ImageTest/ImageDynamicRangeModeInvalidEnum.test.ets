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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageDynamicRangeModeInvalidEnumTest() {
  describe('ImageDynamicRangeModeInvalidEnumTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageDynamicRangeModeInvalidEnumTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/ImageDynamicRangeModeInvalidEnum',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageDynamicRangeModeInvalidEnumTest state pages:' + JSON.stringify(pages));
        if (!('ImageDynamicRangeModeInvalidEnumPage' == pages.name)) {
          console.info('get ImageDynamicRangeModeInvalidEnumTest state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageDynamicRangeModeInvalidEnumTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageDynamicRangeModeInvalidEnumTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageDynamicRangeModeInvalidEnumTest afterEach called');
    });

    /**
     * @tc.name   ImageDynamicRangeModeInvalidEnumTest_0100
     * @tc.number SUB_ARKUI_IMAGE_DYNAMICRANGEMODE_INVALIDENUM_0100
     * @tc.desc   test the Image dynamicRangeMode with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageDynamicRangeModeInvalidEnumTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageDynamicRangeModeInvalidEnumTest_0100] START');
      try {
        await CommonFunc.sleep(2000);
        let strJson = getInspectorByKey('imageDynamicRangeModeInvalid');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0100] strJson is: ' + strJson);
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0100] dynamicRangeMode is: ' + JSON.stringify(obj.$attrs.dynamicRangeMode));
        expect(obj.$attrs.dynamicRangeMode).assertEqual('STANDARD');
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0100] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0100] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageDynamicRangeModeInvalidEnumTest_0200
     * @tc.number SUB_ARKUI_IMAGE_DYNAMICRANGEMODE_INVALIDENUM_0200
     * @tc.desc   test the Image dynamicRangeMode with invalid enum value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageDynamicRangeModeInvalidEnumTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageDynamicRangeModeInvalidEnumTest_0200] START');
      try {
        await CommonFunc.sleep(1000);
        globalThis.value.message.notify({
          name: 'dynamicRangeMode', value: -1
        })
        await CommonFunc.sleep(2000);
        let strJson = getInspectorByKey('imageDynamicRangeModeInvalid');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0200] strJson is: ' + strJson);
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0200] dynamicRangeMode is: ' + JSON.stringify(obj.$attrs.dynamicRangeMode));
        expect(obj.$attrs.dynamicRangeMode).assertEqual('STANDARD');
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0200] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0200] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageDynamicRangeModeInvalidEnumTest_0300
     * @tc.number SUB_ARKUI_IMAGE_DYNAMICRANGEMODE_INVALIDENUM_0300
     * @tc.desc   test the Image dynamicRangeMode with invalid enum value 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageDynamicRangeModeInvalidEnumTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageDynamicRangeModeInvalidEnumTest_0300] START');
      try {
        await CommonFunc.sleep(1000);
        globalThis.value.message.notify({
          name: 'dynamicRangeMode', value: 3
        })
        await CommonFunc.sleep(2000);
        let strJson = getInspectorByKey('imageDynamicRangeModeInvalid');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0300] strJson is: ' + strJson);
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0300] dynamicRangeMode is: ' + JSON.stringify(obj.$attrs.dynamicRangeMode));
        expect(obj.$attrs.dynamicRangeMode).assertEqual('STANDARD');
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0300] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageDynamicRangeModeInvalidEnumTest_0300] ERR ' + JSON.stringify(err));
      }
      done();
    });
  })
}
