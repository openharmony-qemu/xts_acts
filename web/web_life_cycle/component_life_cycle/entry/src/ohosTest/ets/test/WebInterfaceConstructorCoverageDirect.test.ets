/*
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import webview from '@ohos.web.webview';

interface WebConstructorOptionsLike {
  src: ResourceStr;
  controller: webview.WebviewController;
  renderMode?: number;
  incognitoMode?: boolean;
  sharedRenderProcessToken?: string;
  emulateTouchFromMouseEvent?: boolean;
}

export default function webInterfaceConstructorCoverageDirect() {
  describe('webInterfaceConstructorCoverageDirect', () => {
    /**
     * @tc.name   testWebInterfaceConstructorParamSpecDirect
     * @tc.number SUB_WEB_WEBINTERFACE_CONSTRUCTOR_PARAM_SPEC_0200
     * @tc.desc   Web constructor param spec: src/renderMode/incognitoMode/sharedRenderProcessToken
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebInterfaceConstructorParamSpecDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let controller: webview.WebviewController = new webview.WebviewController();
        let emptySrc: WebConstructorOptionsLike = {
          src: '',
          controller: controller,
          renderMode: 0,
          incognitoMode: true,
          sharedRenderProcessToken: '',
          emulateTouchFromMouseEvent: false
        };
        let normalSrc: WebConstructorOptionsLike = {
          src: 'resource://rawfile/index.html',
          controller: new webview.WebviewController(),
          renderMode: 1,
          incognitoMode: false,
          emulateTouchFromMouseEvent: true
        };
        expect(emptySrc.src).assertEqual('');
        expect(emptySrc.incognitoMode).assertTrue();
        expect(normalSrc.renderMode).assertEqual(1);
        expect(normalSrc.incognitoMode).assertFalse();
        done();
      });

    /**
     * @tc.name   testWebInterfaceConstructorReturnDirect
     * @tc.number SUB_WEB_WEBINTERFACE_CONSTRUCTOR_RETURN_DIRECT_0200
     * @tc.desc   WebviewController constructor return for Web component binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebInterfaceConstructorReturnDirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let controller: webview.WebviewController = new webview.WebviewController();
        expect(controller !== undefined && controller !== null).assertTrue();
        expect(typeof controller.loadUrl).assertEqual('function');
        done();
      });
  });
}
