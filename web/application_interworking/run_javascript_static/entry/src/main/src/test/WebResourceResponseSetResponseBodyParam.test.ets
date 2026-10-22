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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

function registerSetResponseBodyEvent(testCaseName: string, expectedValue: Object, eventId: Long,
  done: () => void): void {
  Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done,
    (backData: events_emitter.EventData, expected: Object) => {
      const data = backData?.data as Record<string, RecordData>;
      const action = data['ACTION'];
      console.info(`Begin to assert [` + action + `] Equal [` + expected + `]`);
      expect(action).assertEqual(expected);
      done();
    });
}

const IT_TIMEOUT_MS: number = 120000;
const BUNDLE_NAME: string = 'com.open.harmony.runjavascripttest.static';

async function navigateToSetResponseBodyPage(): Promise<void> {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let cmd: string = 'aa start -a EntryAbility -b ' + BUNDLE_NAME;
  let user: string | undefined = abilityDelegatorRegistry.getArguments().parameters['-u'] as string | undefined;
  if (user !== undefined) {
    cmd += ' -u ' + user;
  }
  let shellResult = await abilityDelegator.executeShellCommand(cmd);
  if (shellResult.exitCode !== 0) {
    throw new Error('aa start failed, exitCode=' + shellResult.exitCode + ', result=' + shellResult.stdResult);
  }
  await Utils.msSleep(5000);
  Utils.emitEvent('GoSetResponseBodyPageStatic', 10);
  await Utils.msSleep(2000);
  try {
    inspector.sendEventByKey('JsMessageExtButton', 10, '');
  } catch (err) {
    console.error('navigate: JsMessageExtButton failed, try webcomponent: ' + JSON.stringify(err));
    try {
      inspector.sendEventByKey('webcomponent', 10, '');
    } catch (err2) {
      console.error('navigate: webcomponent failed: ' + JSON.stringify(err2));
    }
  }
  await Utils.msSleep(6000);
}

export default function webResourceResponseSetResponseBodyParam(): void {

  describe('webResourceResponseSetResponseBodyParamStaticTest', (): void => {

    beforeAll(async (): Promise<void> => {
      // 本套件在 List 中最后执行；冷启动回到 jsMessageExt 再跳页，避免 webTwo 上 inspector 失败导致 beforeAll 抛错整套件 blocked
      try {
        await navigateToSetResponseBodyPage();
      } catch (err) {
        console.error('beforeAll navigate failed (non-fatal): ' + JSON.stringify(err));
      }
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(1000);
      console.info('webResourceResponseSetResponseBodyParamStatic beforeEach start');
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
        registerSetResponseBodyEvent('testSetResponseBodyEmptyStringStatic001', 'success', 174730, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
      }, IT_TIMEOUT_MS)

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
        registerSetResponseBodyEvent('testSetResponseBodyHtmlStringStatic001', 'success', 174735, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
      }, IT_TIMEOUT_MS)

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
        registerSetResponseBodyEvent('testSetResponseBodyNumberStatic001', 'success', 174740, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
      }, IT_TIMEOUT_MS)

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
        registerSetResponseBodyEvent('testSetResponseBodyNumberZeroStatic001', 'success', 174750, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
      }, IT_TIMEOUT_MS)

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
        registerSetResponseBodyEvent('testSetResponseBodyNumberNegativeStatic001', 'success', 174760, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
      }, IT_TIMEOUT_MS)

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
        registerSetResponseBodyEvent('testSetResponseBodyResourceStatic001', 'success', 174770, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
      }, IT_TIMEOUT_MS)

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
        registerSetResponseBodyEvent('testSetResponseBodyArrayBufferStatic001', 'success', 174780, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webResourceResponseSetResponseBodyParamStaticButton', 10, '');
        await Utils.msSleep(6000);
      }, IT_TIMEOUT_MS)
  })
}
