'use static';
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';

export default function webResourceResponseSetResponseBodyParam(): void {

  describe('webResourceResponseSetResponseBodyParamStaticTest', (): void => {

    beforeAll(async (): Promise<void> => {
      // 接在 componentLifeCycleTestOneAdapt001 之后，当前在 webTwo；勿 aa start（易与 JsMessageExtButton 竞态导致 beforeAll 失败）
      await Utils.msSleep(2000);
      Utils.emitEvent('GoSetResponseBodyPageStatic', 10);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webcomponent', 10, '');
      await Utils.msSleep(3000);
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
      console.info('webResourceResponseSetResponseBodyParamStatic beforeEach start');
    })

    /**
     * @tc.name   testSetResponseBodyNullStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_NULL_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with null parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyNullStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyNullStatic001', 'success', 174710, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetResponseBodyUndefinedStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_UNDEFINED_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with undefined parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyUndefinedStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyUndefinedStatic001', 'success', 174720, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetResponseBodyEmptyStringStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_EMPTYSTRING_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with empty string parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyEmptyStringStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyEmptyStringStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyEmptyStringStatic001', 'success', 174730, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetResponseBodyHtmlStringStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_HTMLSTRING_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with HTML string parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyHtmlStringStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyHtmlStringStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyHtmlStringStatic001', 'success', 174735, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetResponseBodyNumberStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_NUMBER_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with int parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyNumberStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyNumberStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyNumberStatic001', 'success', 174740, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetResponseBodyNumberZeroStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_NUMBERZERO_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with int zero parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyNumberZeroStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyNumberZeroStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyNumberZeroStatic001', 'success', 174750, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetResponseBodyNumberNegativeStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_NUMBERNEGATIVE_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with negative int parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyNumberNegativeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyNumberNegativeStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyNumberNegativeStatic001', 'success', 174760, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetResponseBodyResourceStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_RESOURCE_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with Resource parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyResourceStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyResourceStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyResourceStatic001', 'success', 174770, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetResponseBodyArrayBufferStatic001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_ARRAYBUFFER_STATIC_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with ArrayBuffer parameter (static)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyArrayBufferStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitSetResponseBodyArrayBufferStatic001', 174700);
        await Utils.msSleep(2000);
        Utils.registerEvent('testSetResponseBodyArrayBufferStatic001', 'success', 174780, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
