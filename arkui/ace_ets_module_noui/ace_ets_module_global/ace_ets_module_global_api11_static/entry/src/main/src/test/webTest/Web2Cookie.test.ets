'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, it, TestType, Size, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import { RecordData } from '@ohos.base';

export default function web2CookieTest(): void {
    describe('web2CookieTest', () => {
        beforeAll(async (): Promise<void> => {
            console.info("web2CookieTest beforeAll start");
            await UtilsTest.msSleep(4000);
            await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility");
            await UtilsTest.msSleep(4000);
        });

        beforeEach(async (): Promise<void> => {
            console.info("web2CookieTest beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/web/web2',
            }
            try {
                const routerInstance = AppStorage.get<Router>("router") as Router;
                routerInstance.clear();
                let pages = routerInstance.getState();
                console.info("get web2CookieTest state pages:" + JSON.stringify(pages));
                if (!("web2" == pages.name)) {
                    console.info("get web2CookieTest pages.name:" + JSON.stringify(pages.name));
                    routerInstance.pushUrl(options);
                    await UtilsTest.msSleep(2000);
                }
            } catch (err) {
                console.error("push web2CookieTest page error:" + err);
            }
            console.info("web2CookieTest beforeEach end");
        });

        /**
         * @tc.name   testPutAcceptCookieEnabled001
         * @tc.number SUB_WEB_PUTACCEPTCOOKIEENABLED_0100
         * @tc.desc   test putAcceptCookieEnabled with null parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level   Level.LEVEL3
         */
        it('testPutAcceptCookieEnabled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.info("testPutAcceptCookieEnabled001 START");
            let testResult: number = -1;
            Utils.emitEvent('testPutAcceptCookieEnabled001', 10);
            await UtilsTest.msSleep(2000);
            let innerEvent: emitter.InnerEvent = {
                eventId: 90300,
                priority: emitter.EventPriority.LOW
            }
            emitter.once(innerEvent, (backData: emitter.EventData) => {
                try {
                    const data=backData.data as Record<string,RecordData>;
                    testResult=data['ACTION'] as number;
                    expect(testResult).assertEqual(401);
                    console.info('testPutAcceptCookieEnabled001 result: ' + testResult);
                } catch (err) {
                    console.info('testPutAcceptCookieEnabled001 err: ' + JSON.stringify(err));
                }
            });
            await UtilsTest.msSleep(1000);
            try {
                inspector.sendEventByKey('web2_cookie_test', 10, '');
            } catch (err) {
                console.info('testPutAcceptCookieEnabled001 click err: ' + JSON.stringify(err));
            }
            await UtilsTest.msSleep(5000);
            console.info('testPutAcceptCookieEnabled001 final result: ' + testResult);

        });

        /**
         * @tc.name   testPutAcceptCookieEnabled002
         * @tc.number SUB_WEB_PUTACCEPTCOOKIEENABLED_0200
         * @tc.desc   test putAcceptCookieEnabled with undefined parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level   Level.LEVEL3
         */
        it('testPutAcceptCookieEnabled002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            console.info("testPutAcceptCookieEnabled002 START");
            let testResult: number = -1;
            Utils.emitEvent('testPutAcceptCookieEnabled002', 10);
            await UtilsTest.msSleep(2000);
            let innerEvent: emitter.InnerEvent = {
                eventId: 90301,
                priority: emitter.EventPriority.LOW
            }
            emitter.once(innerEvent, (backData: emitter.EventData) => {
                try {
                    const data=backData.data as Record<string,RecordData>
                    testResult=data['ACTION'] as number;
                    expect(testResult).assertEqual(401);
                    console.info('testPutAcceptCookieEnabled002 result: ' + testResult);
                } catch (err) {
                    console.info('testPutAcceptCookieEnabled002 err: ' + JSON.stringify(err));
                }
            });
            await UtilsTest.msSleep(1000);
            try {
                inspector.sendEventByKey('web2_cookie_test', 10, '');
            } catch (err) {
                console.info('testPutAcceptCookieEnabled002 click err: ' + JSON.stringify(err));
            }
            await UtilsTest.msSleep(5000);
            console.info('testPutAcceptCookieEnabled002 final result: ' + testResult);
        });
    })
}
