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
import CommonFunc from '../../MainAbility/common/Common'

const SLEEP_TIME = 500;

export default function TransPageEnabledTest() {
  describe('TransPageEnabledTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TransPageEnabledTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/transPage/TransPageEnabled',
      }
      try {
        router.clear();
        await CommonFunc.sleep(500);
        await router.replaceUrl(options);
        await CommonFunc.sleep(2000);
        console.info('replace TransPageEnabledTest page success');
      } catch (err) {
        console.error('replace TransPageEnabledTest page error: ' + JSON.stringify(err));
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TransPageEnabledTest afterEach called');
    });

    /**
     * @tc.name   testIsTransPageEnabledDefault0100
     * @tc.number SUB_ARKUI_UICONTEXT_ISTRANSPAGEENABLED_DEFAULT_0100
     * @tc.desc   Test isTransPageEnabled returns true by default without calling setTransPageEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsTransPageEnabledDefault0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testIsTransPageEnabledDefault0100] START');
      await CommonFunc.sleep(SLEEP_TIME);

      sendEventByKey('transPage_check_btn', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);

      let strJson = getInspectorByKey('transPage_result_text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[testIsTransPageEnabledDefault0100] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('true');

      console.info('[testIsTransPageEnabledDefault0100] END');
      done();
    });

    /**
     * @tc.name   testSetTransPageEnabledFalse0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTRANSPAGEENABLED_FALSE_0100
     * @tc.desc   Test setTransPageEnabled(false) makes isTransPageEnabled return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTransPageEnabledFalse0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testSetTransPageEnabledFalse0100] START');
      await CommonFunc.sleep(SLEEP_TIME);

      sendEventByKey('transPage_setFalse_btn', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);

      let strJson = getInspectorByKey('transPage_result_text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[testSetTransPageEnabledFalse0100] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('false');

      console.info('[testSetTransPageEnabledFalse0100] END');
      done();
    });

    /**
     * @tc.name   testSetTransPageEnabledTrue0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTRANSPAGEENABLED_TRUE_0100
     * @tc.desc   Test setTransPageEnabled(true) makes isTransPageEnabled return true after being disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTransPageEnabledTrue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[testSetTransPageEnabledTrue0100] START');
      await CommonFunc.sleep(SLEEP_TIME);

      sendEventByKey('transPage_setFalse_btn', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);

      sendEventByKey('transPage_setTrue_btn', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);

      let strJson = getInspectorByKey('transPage_result_text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[testSetTransPageEnabledTrue0100] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('true');

      console.info('[testSetTransPageEnabledTrue0100] END');
      done();
    });

    /**
     * @tc.name   testSetTransPageEnabledNull0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTRANSPAGEENABLED_NULL_0100
     * @tc.desc   Test setTransPageEnabled with null parameter does not crash the application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTransPageEnabledNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('[testSetTransPageEnabledNull0100] START');
      await CommonFunc.sleep(SLEEP_TIME);

      sendEventByKey('transPage_setNull_btn', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);

      let strJson = getInspectorByKey('transPage_result_text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[testSetTransPageEnabledNull0100] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content === 'null_no_error' || obj.$attrs.content === 'null_error').assertTrue();

      console.info('[testSetTransPageEnabledNull0100] END');
      done();
    });

    /**
     * @tc.name   testSetTransPageEnabledUndefined0100
     * @tc.number SUB_ARKUI_UICONTEXT_SETTRANSPAGEENABLED_UNDEFINED_0100
     * @tc.desc   Test setTransPageEnabled with undefined parameter does not crash the application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTransPageEnabledUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('[testSetTransPageEnabledUndefined0100] START');
      await CommonFunc.sleep(SLEEP_TIME);

      sendEventByKey('transPage_setUndefined_btn', 10, '');
      await CommonFunc.sleep(SLEEP_TIME);

      let strJson = getInspectorByKey('transPage_result_text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[testSetTransPageEnabledUndefined0100] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content === 'undefined_no_error' || obj.$attrs.content === 'undefined_error').assertTrue();

      console.info('[testSetTransPageEnabledUndefined0100] END');
      done();
    });
  })
}
