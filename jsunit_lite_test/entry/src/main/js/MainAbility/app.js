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

import Core from 'jsunit_lite/src/core';
import liteReport from 'jsunit_lite/src/module/report/liteReport';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll,
    beforeItSpecified, afterItSpecified, xdescribe, xit, beforeEachIt, afterEachIt,
    TestType, Size, Level, DEFAULT, PrintTag, SkipError } from 'jsunit_lite/index';

export default {
    data: {
        __hypium: null,
        testPages: []
    },
    onCreate: function() {
        console.info('[JsunitLiteTest] onCreate start');
        try {
            var core = Core.getInstance();
            var reportInstance = new liteReport({ id: 'default' });
            core.addService('report', reportInstance);
            core.init();
            console.info('[Hypium] init done');

            var self = this;
            self.__hypium = {
                describe: describe,
                it: it,
                expect: expect,
                beforeAll: beforeAll,
                beforeEach: beforeEach,
                afterEach: afterEach,
                afterAll: afterAll,
                beforeItSpecified: beforeItSpecified,
                afterItSpecified: afterItSpecified,
                beforeEachIt: beforeEachIt,
                afterEachIt: afterEachIt,
                xdescribe: xdescribe,
                xit: xit,
                TestType: TestType,
                Size: Size,
                Level: Level,
                DEFAULT: DEFAULT,
                PrintTag: PrintTag,
                SkipError: SkipError,
                execute: function () {
                    console.info('[Hypium] execute');
                    core.execute();
                    console.info('[Hypium] execute done');
                }
            };

            self.testPages = [
                'pages/test/assert/index',
                'pages/test/lifecycle/index',
                'pages/test/skipError/index',
                'pages/test/core/index',
                'pages/test/report/index'
            ];

            console.info('[Hypium] __hypium set done, no router.replace');

            var _now = new Date();
            var _exit = _now.getTime() + 200;
            while (true) { _now = new Date(); if (_now.getTime() > _exit) { break; } }
        } catch (e) {
            console.info('[JsunitLiteTest] onCreate error: ' + e);
            console.info('[JsunitLiteTest] stack: ' + (e && e.stack ? e.stack : 'no stack'));
        }
    },
    onDestroy: function() {
        console.info('[JsunitLiteTest] onDestroy');
    }
};
