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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageAnimatorReverseUndefinedAndNullTest() {
  describe('ImageAnimatorReverseUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAnimatorReverseUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimatorUndefinedAndNull/ImageAnimatorReverseUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageAnimatorReverseUndefinedAndNullTest state pages: ' + JSON.stringify(pages));
        if (!('ImageAnimatorReverseUndefinedAndNullTest' == pages.name)) {
          console.info('get ImageAnimatorReverseUndefinedAndNullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageAnimatorReverseUndefinedAndNullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAnimatorReverseUndefinedAndNullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorReverseUndefinedAndNullTest_0100
     * @tc.number ImageAnimatorReverseUndefinedAndNullTest_0100
     * @tc.desc   test the ImageAnimator reverse undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageAnimatorReverseUndefinedAndNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageAnimatorReverseUndefinedAndNullTest_0100] START');
      try {
        await CommonFunc.sleep(2000);

        let strJson = getInspectorByKey('reverseUndefined');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorReverseUndefinedAndNullTest_0100] strJson is: ' + strJson);
        console.info('[ImageAnimatorReverseUndefinedAndNullTest_0100] reverse is: ' + JSON.stringify(obj.$attrs.reverse));
        expect(obj.$attrs.reverse).assertEqual('false');
        console.info('[ImageAnimatorReverseUndefinedAndNullTest_0100] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorReverseUndefinedAndNullTest_0100] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorReverseUndefinedAndNullTest_0200
     * @tc.number ImageAnimatorReverseUndefinedAndNullTest_0200
     * @tc.desc   test the ImageAnimator reverse null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageAnimatorReverseUndefinedAndNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageAnimatorReverseUndefinedAndNullTest_0200] START');
      try {
        await CommonFunc.sleep(2000);

        let strJson = getInspectorByKey('reverseNull');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageAnimatorReverseUndefinedAndNullTest_0200] strJson is: ' + strJson);
        console.info('[ImageAnimatorReverseUndefinedAndNullTest_0200] reverse is: ' + JSON.stringify(obj.$attrs.reverse));
        expect(obj.$attrs.reverse).assertEqual('false');
        console.info('[ImageAnimatorReverseUndefinedAndNullTest_0200] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageAnimatorReverseUndefinedAndNullTest_0200] ERR ' + JSON.stringify(err));
      }
      done();
    });
  })
}
