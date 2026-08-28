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
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

export default function webviewControllerConstructorTest(): void {
  describe('WebviewControllerConstructorTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
    })

    /**
     * @tc.name   testWebviewControllerConstructorEmptyStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CONSTRUCTOR_0100
     * @tc.desc   test WebviewController constructor with empty webTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewControllerConstructorEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebviewControllerConstructorEmptyStatic001', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testWebviewControllerConstructorEmptyStatic001', true, 41021601, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            expect(action).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebviewControllerConstructorButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testWebviewControllerConstructorNullStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CONSTRUCTOR_0200
     * @tc.desc   test WebviewController constructor with null webTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewControllerConstructorNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebviewControllerConstructorNullStatic001', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testWebviewControllerConstructorNullStatic001', true, 41021602, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            expect(action).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebviewControllerConstructorButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })

    /**
     * @tc.name   testWebviewControllerConstructorUndefinedStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CONSTRUCTOR_0300
     * @tc.desc   test WebviewController constructor with undefined webTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewControllerConstructorUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testWebviewControllerConstructorUndefinedStatic001', 10)
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testWebviewControllerConstructorUndefinedStatic001', true, 41021603, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            const action = data['ACTION'];
            expect(action).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebviewControllerConstructorButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })
  })
}
