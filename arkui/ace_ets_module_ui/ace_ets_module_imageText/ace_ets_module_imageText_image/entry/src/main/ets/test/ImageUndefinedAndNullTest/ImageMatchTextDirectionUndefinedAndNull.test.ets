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

export default function ImageMatchTextDirectionUndefinedAndNullTest() {
  describe('ImageMatchTextDirectionUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageMatchTextDirectionUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageMatchTextDirectionUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageMatchTextDirectionUndefinedAndNullTest state pages: ' + JSON.stringify(pages));
        if (!('imageMatchTextDirectionUndefinedAndNullTest' == pages.name)) {
          console.info('get ImageMatchTextDirectionUndefinedAndNullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageMatchTextDirectionUndefinedAndNullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageMatchTextDirectionUndefinedAndNullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageMatchTextDirectionUndefinedAndNullTest_0100
     * @tc.number ImageMatchTextDirectionUndefinedAndNullTest_0100
     * @tc.desc   test the Image matchTextDirection with true value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageMatchTextDirectionUndefinedAndNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0100] START');
      try {
        await CommonFunc.sleep(2000);

        let strJson = getInspectorByKey('imageMatchTextDirectionTrue');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0100] strJson is: ' + strJson);
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0100] matchTextDirection is: ' + JSON.stringify(obj.$attrs.matchTextDirection));
        expect(obj.$attrs.matchTextDirection).assertEqual('true');
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0100] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0100] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageMatchTextDirectionUndefinedAndNullTest_0200
     * @tc.number ImageMatchTextDirectionUndefinedAndNullTest_0200
     * @tc.desc   test the Image matchTextDirection with false value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageMatchTextDirectionUndefinedAndNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0200] START');
      try {
        await CommonFunc.sleep(2000);

        let strJson = getInspectorByKey('imageMatchTextDirectionFalse');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0200] strJson is: ' + strJson);
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0200] matchTextDirection is: ' + JSON.stringify(obj.$attrs.matchTextDirection));
        expect(obj.$attrs.matchTextDirection).assertEqual('false');
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0200] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0200] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageMatchTextDirectionUndefinedAndNullTest_0300
     * @tc.number ImageMatchTextDirectionUndefinedAndNullTest_0300
     * @tc.desc   test the Image matchTextDirection with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageMatchTextDirectionUndefinedAndNullTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0300] START');
      try {
        await CommonFunc.sleep(2000);

        let strJson = getInspectorByKey('imageMatchTextDirectionUndefined');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0300] strJson is: ' + strJson);
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0300] matchTextDirection is: ' + JSON.stringify(obj.$attrs.matchTextDirection));
        expect(obj.$attrs.matchTextDirection).assertEqual('false');
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0300] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0300] ERR ' + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   ImageMatchTextDirectionUndefinedAndNullTest_0400
     * @tc.number ImageMatchTextDirectionUndefinedAndNullTest_0400
     * @tc.desc   test the Image matchTextDirection with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageMatchTextDirectionUndefinedAndNullTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0400] START');
      try {
        await CommonFunc.sleep(2000);

        let strJson = getInspectorByKey('imageMatchTextDirectionNull');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0400] strJson is: ' + strJson);
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0400] matchTextDirection is: ' + JSON.stringify(obj.$attrs.matchTextDirection));
        expect(obj.$attrs.matchTextDirection).assertEqual('false');
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0400] END');
      } catch (err) {
        expect().assertFail();
        console.info('[ImageMatchTextDirectionUndefinedAndNullTest_0400] ERR ' + JSON.stringify(err));
      }
      done();
    });
  })
}
