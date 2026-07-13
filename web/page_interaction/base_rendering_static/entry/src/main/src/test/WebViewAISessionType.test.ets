'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, describe, it, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';

export default function webViewAISessionTypeJsunit() {
  describe('WebViewAISessionTypeTest', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("emitSwitchToWebViewAISessionTypePage", 10)
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlankScreenDetectionMethodButton', 10, '');
      await Utils.msSleep(2000)
    });

    /**
     * @tc.name   testAiSessionOptionsStatic00
     * @tc.number SUB_WEB_AISESSIONOPTIONS_STATIC_0000
     * @tc.desc   test aiSessionOptions.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionOptionsStatic00', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionOptionsStatic00", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionOptionsStatic00", true, 2026060100, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionTypeStatic01
     * @tc.number SUB_WEB_AISESSIONTYPE_STATIC_0100
     * @tc.desc   test AISessionType.LANGUAGE_DETECTOR.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionTypeStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionTypeStatic01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionTypeStatic01", 2, 2026060101, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionTypeStatic02
     * @tc.number SUB_WEB_AISESSIONTYPE_STATIC_0200
     * @tc.desc   test AISessionType.SUMMARIZER.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionTypeStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionTypeStatic02", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionTypeStatic02", 3, 2026060102, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionTypeStatic03
     * @tc.number SUB_WEB_AISESSIONTYPE_STATIC_0300
     * @tc.desc   test AISessionType.WRITER.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionTypeStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionTypeStatic03", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionTypeStatic03", 4, 2026060103, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionTypeStatic04
     * @tc.number SUB_WEB_AISESSIONTYPE_STATIC_0400
     * @tc.desc   test AISessionType.REWRITER.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionTypeStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionTypeStatic04", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionTypeStatic04", 5, 2026060104, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionTypeStatic05
     * @tc.number SUB_WEB_AISESSIONTYPE_STATIC_0500
     * @tc.desc   test AISessionType.PROMPT.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionTypeStatic05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionTypeStatic05", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionTypeStatic05", 6, 2026060105, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionTypeStatic06
     * @tc.number SUB_WEB_AISESSIONTYPE_STATIC_0600
     * @tc.desc   test AISessionType.PROOFREADER.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionTypeStatic06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionTypeStatic06", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionTypeStatic06", 7, 2026060106, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionResultTypeStatic07
     * @tc.number SUB_WEB_AISESSIONRESULTTYPE_STATIC_0700
     * @tc.desc   test AISessionResultType.SUCCESS.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionResultTypeStatic07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionResultTypeStatic07", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionResultTypeStatic07", 0, 2026060107, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionResultTypeStatic08
     * @tc.number SUB_WEB_AISESSIONRESULTTYPE_STATIC_0800
     * @tc.desc   test AISessionResultType.FAILURE.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionResultTypeStatic08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionResultTypeStatic08", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionResultTypeStatic08", 1, 2026060108, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionResultTypeStatic09
     * @tc.number SUB_WEB_AISESSIONRESULTTYPE_STATIC_0900
     * @tc.desc   test AISessionResultType.RUNNING.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionResultTypeStatic09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionResultTypeStatic09", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionResultTypeStatic09", 2, 2026060109, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionEventStatic10
     * @tc.number SUB_WEB_AISESSIONEVENT_STATIC_1000
     * @tc.desc   test AISessionEvent.aiSessionType.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionEventStatic10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionEventStatic10", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionEventStatic10", true, 2026060110, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionEventStatic11
     * @tc.number SUB_WEB_AISESSIONEVENT_STATIC_1100
     * @tc.desc   test AISessionEvent.onCreateAISession.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionEventStatic11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionEventStatic11", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionEventStatic11", true, 2026060111, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionEventStatic12
     * @tc.number SUB_WEB_AISESSIONEVENT_STATIC_1200
     * @tc.desc   test AISessionEvent.onExecuteAIAction.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionEventStatic12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionEventStatic12", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionEventStatic12", true, 2026060112, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionEventStatic13
     * @tc.number SUB_WEB_AISESSIONEVENT_STATIC_1300
     * @tc.desc   test AISessionEvent.onDestroyAISession.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionEventStatic13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionEventStatic13", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionEventStatic13", true, 2026060113, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAiSessionTypeStatic25
     * @tc.number SUB_WEB_AISESSIONTYPE_STATIC_2500
     * @tc.desc   test AISessionType.TRANSLATOR.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testAiSessionTypeStatic25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testAiSessionTypeStatic25", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testAiSessionTypeStatic25", true, 2026060125, done);
      inspector.sendEventByKey('WebViewAISessionTypeButton', 10, '');
      await Utils.msSleep(6000);
      done();
    })
  })
}
