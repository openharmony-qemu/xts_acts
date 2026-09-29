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

import { describe, beforeEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function stylesVersionDecoratorTest() {
  describe('stylesVersionDecoratorTest', () => {
    beforeEach(async (done: Function) => {
      console.info('stylesVersionDecoratorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi26/StylesVersionDecorator',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('StylesVersionDecoratorPage' == pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push StylesVersionDecorator page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterAll(() => {
      AppStorage.delete('styles_page_ready');
      AppStorage.delete('styles_cond_num');
      AppStorage.delete('styles_cond_str');
      AppStorage.delete('styles_cond_undef');
      AppStorage.delete('styles_cond_null');
      AppStorage.delete('styles_decorator_type');
    });

    /**
     * @tc.name   SUB_ARKUI_COMMON_STYLES_VERSION_READY_0100
     * @tc.number SUB_ARKUI_COMMON_STYLES_VERSION_READY_0100
     * @tc.desc   Test StylesVersionDecorator type and VersionCondition objects ready
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_COMMON_STYLES_VERSION_READY_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_COMMON_STYLES_VERSION_READY_0100] START');
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('styles_page_ready')).assertEqual('ready');
      let decoType: string = AppStorage.get<string>('styles_decorator_type') as string;
      expect(decoType === 'ok' || decoType === 'catch').assertTrue();
      let numJson: string = AppStorage.get<string>('styles_cond_num') as string;
      expect(numJson.includes('12')).assertTrue();
      expect(numJson.includes('99')).assertTrue();
      console.info('[SUB_ARKUI_COMMON_STYLES_VERSION_READY_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_COMMON_STYLES_VERSION_NUM_0100
     * @tc.number SUB_ARKUI_COMMON_STYLES_VERSION_NUM_0100
     * @tc.desc   Test VersionCondition with number min/maxApiVersion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_COMMON_STYLES_VERSION_NUM_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_COMMON_STYLES_VERSION_NUM_0100] START');
      let strJson: string = getInspectorByKey('styles_version_cond_num_label');
      expect(strJson.length > 0).assertTrue();
      let numJson: string = AppStorage.get<string>('styles_cond_num') as string;
      expect(numJson.includes('"minApiVersion":12') || numJson.includes('12')).assertTrue();
      console.info('[SUB_ARKUI_COMMON_STYLES_VERSION_NUM_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_COMMON_STYLES_VERSION_STR_0100
     * @tc.number SUB_ARKUI_COMMON_STYLES_VERSION_STR_0100
     * @tc.desc   Test VersionCondition with string min/maxApiVersion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_COMMON_STYLES_VERSION_STR_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_COMMON_STYLES_VERSION_STR_0100] START');
      let condStr: string = AppStorage.get<string>('styles_cond_str') as string;
      expect(condStr.includes('12')).assertTrue();
      console.info('[SUB_ARKUI_COMMON_STYLES_VERSION_STR_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_COMMON_STYLES_VERSION_PLAIN_0100
     * @tc.number SUB_ARKUI_COMMON_STYLES_VERSION_PLAIN_0100
     * @tc.desc   Test plain @Styles MethodDecorator without version condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_COMMON_STYLES_VERSION_PLAIN_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_COMMON_STYLES_VERSION_PLAIN_0100] START');
      let strJson: string = getInspectorByKey('styles_version_plain');
      expect(strJson.length > 0).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type !== undefined).assertTrue();
      console.info('[SUB_ARKUI_COMMON_STYLES_VERSION_PLAIN_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_COMMON_VERSION_CONDITION_UNDEF_0100
     * @tc.number SUB_ARKUI_COMMON_VERSION_CONDITION_UNDEF_0100
     * @tc.desc   Test VersionCondition with undefined min/maxApiVersion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_COMMON_VERSION_CONDITION_UNDEF_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_COMMON_VERSION_CONDITION_UNDEF_0100] START');
      let val: string = AppStorage.get<string>('styles_cond_undef') as string;
      expect(val.includes('undefined')).assertTrue();
      console.info('[SUB_ARKUI_COMMON_VERSION_CONDITION_UNDEF_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_COMMON_VERSION_CONDITION_NULL_0100
     * @tc.number SUB_ARKUI_COMMON_VERSION_CONDITION_NULL_0100
     * @tc.desc   Test null values for VersionCondition field holders
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_COMMON_VERSION_CONDITION_NULL_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_COMMON_VERSION_CONDITION_NULL_0100] START');
      let val: string = AppStorage.get<string>('styles_cond_null') as string;
      expect(val.includes('null')).assertTrue();
      console.info('[SUB_ARKUI_COMMON_VERSION_CONDITION_NULL_0100] END');
    });
  });
}
