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
import CommonFunc from '../../../MainAbility/common/Common';

export default function xComponentInterfaceConstructorNullUndefinedTest() {
  describe('XComponentInterfaceConstructorNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info('[XComponentInterfaceConstructorNullUndefinedTest] beforeAll called');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedcoverage/xcomponent/XComponentInterfaceConstructorNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('[XComponentInterfaceConstructorNullUndefinedTest] state pages: ' + JSON.stringify(pages));
        if (!('XComponentInterfaceConstructorNullUndefined' == pages.name)) {
          console.info('[XComponentInterfaceConstructorNullUndefinedTest] pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info('[XComponentInterfaceConstructorNullUndefinedTest] push success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('[XComponentInterfaceConstructorNullUndefinedTest] push page error: ' + err);
        expect().assertFail();
      }
    });

    beforeEach(() => {
      console.info('[XComponentInterfaceConstructorNullUndefinedTest] beforeEach called');
    });

    afterEach(() => {
      console.info('[XComponentInterfaceConstructorNullUndefinedTest] afterEach called');
    });

    afterAll(() => {
      console.info('[XComponentInterfaceConstructorNullUndefinedTest] afterAll called');
    });

    // ========== (options: XComponentOptions) constructor tests (since 12) ==========

    /**
     * @tc.name   xComponentInterface_options_null_001
     * @tc.number SUB_ARKUI_XCOMPONENTINTERFACE_OPTIONS_NULL_0001
     * @tc.desc   测试XComponentInterface constructor(since 12)第1个参数options传入null，不创建组件节点（优雅处理无崩溃）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentInterface_options_null_001', Level.LEVEL2, () => {
      console.info('[xComponentInterface_options_null_001] START');
      let strJson: string = getInspectorByKey('xcomponent_options_null');
      console.info('[xComponentInterface_options_null_001] strJson: ' + strJson);
      expect(strJson.length === 0).assertTrue();
      console.info('[xComponentInterface_options_null_001] END');
    });

    /**
     * @tc.name   xComponentInterface_options_undefined_001
     * @tc.number SUB_ARKUI_XCOMPONENTINTERFACE_OPTIONS_UNDEFINED_0002
     * @tc.desc   测试XComponentInterface constructor(since 12)第1个参数options传入undefined，使用默认值创建组件节点
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentInterface_options_undefined_001', Level.LEVEL2, () => {
      console.info('[xComponentInterface_options_undefined_001] START');
      let strJson: string = getInspectorByKey('xcomponent_options_undefined');
      console.info('[xComponentInterface_options_undefined_001] strJson: ' + strJson);
      expect(strJson.length > 0).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[xComponentInterface_options_undefined_001] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj !== null && obj !== undefined).assertTrue();
      console.info('[xComponentInterface_options_undefined_001] END');
    });

    // ========== (params: NativeXComponentParameters) constructor tests (since 19) ==========

    /**
     * @tc.name   xComponentInterface_params_null_001
     * @tc.number SUB_ARKUI_XCOMPONENTINTERFACE_PARAMS_NULL_0003
     * @tc.desc   测试XComponentInterface constructor(since 19)第1个参数params传入null，不创建组件节点（优雅处理无崩溃）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentInterface_params_null_001', Level.LEVEL2, () => {
      console.info('[xComponentInterface_params_null_001] START');
      let strJson: string = getInspectorByKey('xcomponent_params_null');
      console.info('[xComponentInterface_params_null_001] strJson: ' + strJson);
      expect(strJson.length === 0).assertTrue();
      console.info('[xComponentInterface_params_null_001] END');
    });

    /**
     * @tc.name   xComponentInterface_params_undefined_001
     * @tc.number SUB_ARKUI_XCOMPONENTINTERFACE_PARAMS_UNDEFINED_0004
     * @tc.desc   测试XComponentInterface constructor(since 19)第1个参数params传入undefined，使用默认值创建组件节点
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentInterface_params_undefined_001', Level.LEVEL2, () => {
      console.info('[xComponentInterface_params_undefined_001] START');
      let strJson: string = getInspectorByKey('xcomponent_params_undefined');
      console.info('[xComponentInterface_params_undefined_001] strJson: ' + strJson);
      expect(strJson.length > 0).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[xComponentInterface_params_undefined_001] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj !== null && obj !== undefined).assertTrue();
      console.info('[xComponentInterface_params_undefined_001] END');
    });

    /**
     * @tc.name   xComponentInterface_params_valid_001
     * @tc.number SUB_ARKUI_XCOMPONENTINTERFACE_PARAMS_VALID_0005
     * @tc.desc   测试XComponentInterface constructor(since 19)第1个参数params传入正常NativeXComponentParameters对象，创建组件节点
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('xComponentInterface_params_valid_001', Level.LEVEL2, () => {
      console.info('[xComponentInterface_params_valid_001] START');
      let strJson: string = getInspectorByKey('xcomponent_params_valid');
      console.info('[xComponentInterface_params_valid_001] strJson: ' + strJson);
      expect(strJson.length > 0).assertTrue();
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[xComponentInterface_params_valid_001] obj is: ' + JSON.stringify(obj.$attrs));
      expect(obj !== null && obj !== undefined).assertTrue();
      console.info('[xComponentInterface_params_valid_001] END');
    });
  });
}
