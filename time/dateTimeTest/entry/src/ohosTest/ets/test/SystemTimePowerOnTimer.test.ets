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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import systemTimer from "@ohos.systemTimer";
import { BusinessError } from '@ohos.base';

class PowerOnTimerOptionsRaw {
  timerName: Object | null = '';
  enable: Object | null = true;

  constructor(timerName: Object | null, enable: Object | null) {
    this.timerName = timerName;
    this.enable = enable;
  }
}

export default function systemTimePowerOnTimerTest() {
  describe('systemTimePowerOnTimerTest', () => {
    console.info('====>---------------systemTimePowerOnTimerTest start-----------------------');

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0100
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0100
     * @tc.desc   Test setPowerOnTimerEnabled with no options, all power-on timers are enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0100", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0100 start----------------");
      try {
        await systemTimer.setPowerOnTimerEnabled();
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0100 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0100 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0100 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0200
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0200
     * @tc.desc   Test setPowerOnTimerEnabled with undefined options, all power-on timers are enabled.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0200", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0200 start----------------");
      try {
        await systemTimer.setPowerOnTimerEnabled(undefined);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0200 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0200 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0200 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0300
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0300
     * @tc.desc   Test setPowerOnTimerEnabled with timerName and enable true, enable specific timer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0300", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0300 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: "test_timer_0300",
        enable: true
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0300 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0300 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0300 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0400
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0400
     * @tc.desc   Test setPowerOnTimerEnabled with timerName and enable false, disable specific timer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0400", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0400 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: "test_timer_0400",
        enable: false
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0400 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0400 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0400 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0500
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0500
     * @tc.desc   Test setPowerOnTimerEnabled with only timerName, enable defaults to true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0500", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0500 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: "test_timer_0500"
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0500 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0500 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0500 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0600
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0600
     * @tc.desc   Test setPowerOnTimerEnabled with only enable true, applies to all power-on timers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0600", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0600 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        enable: true
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0600 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0600 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0600 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0700
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0700
     * @tc.desc   Test setPowerOnTimerEnabled with only enable false, applies to all power-on timers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0700", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0700 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        enable: false
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0700 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0700 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0700 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0800
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0800
     * @tc.desc   Test setPowerOnTimerEnabled with empty object, both fields default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0800", Level.LEVEL0, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0800 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {};
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0800 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0800 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0800 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_0900
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_0900
     * @tc.desc   Test setPowerOnTimerEnabled with empty string timerName, expect error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_0900", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0900 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: "",
        enable: true
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0900 success");
        expect().assertFail();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_0900 err: " + JSON.stringify(e));
        expect(e.code === 401 || e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_0900 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1000
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1000
     * @tc.desc   Test setPowerOnTimerEnabled with timerName of max length 64 bytes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1000", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1000 start----------------");
      let maxName = "a".repeat(64);
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: maxName,
        enable: true
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1000 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1000 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1000 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1100
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1100
     * @tc.desc   Test setPowerOnTimerEnabled with timerName exceeding max length 64 bytes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1100", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1100 start----------------");
      let overMaxName = "a".repeat(65);
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: overMaxName,
        enable: true
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1100 success");
        expect().assertFail();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1100 err: " + JSON.stringify(e));
        expect(e.code === 401 || e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1100 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1200
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1200
     * @tc.desc   Test setPowerOnTimerEnabled with timerName null, expect error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1200", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1200 start----------------");
      let raw = new PowerOnTimerOptionsRaw(null, true);
      let options: systemTimer.PowerOnTimerEnabledOptions = raw as systemTimer.PowerOnTimerEnabledOptions;
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1200 success");
        expect().assertFail();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1200 err: " + JSON.stringify(e));
        expect(e.code === 401 || e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1200 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1300
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1300
     * @tc.desc   Test setPowerOnTimerEnabled with enable null, expect error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1300", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1300 start----------------");
      let raw = new PowerOnTimerOptionsRaw("test_timer_1300", null);
      let options: systemTimer.PowerOnTimerEnabledOptions = raw as systemTimer.PowerOnTimerEnabledOptions;
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1300 success");
        expect().assertFail();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1300 err: " + JSON.stringify(e));
        expect(e.code === 401 || e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1300 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1400
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1400
     * @tc.desc   Test setPowerOnTimerEnabled with timerName as number type, expect error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1400", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1400 start----------------");
      let raw = new PowerOnTimerOptionsRaw(123, true);
      let options: systemTimer.PowerOnTimerEnabledOptions = raw as systemTimer.PowerOnTimerEnabledOptions;
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1400 success");
        expect().assertFail();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1400 err: " + JSON.stringify(e));
        expect(e.code === 401 || e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1400 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1500
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1500
     * @tc.desc   Test setPowerOnTimerEnabled with enable as string type, expect error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1500", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1500 start----------------");
      let raw = new PowerOnTimerOptionsRaw("test_timer_1500", "true");
      let options: systemTimer.PowerOnTimerEnabledOptions = raw as systemTimer.PowerOnTimerEnabledOptions;
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1500 success");
        expect().assertFail();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1500 err: " + JSON.stringify(e));
        expect(e.code === 401 || e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1500 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1600
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1600
     * @tc.desc   Test setPowerOnTimerEnabled with enable as number type, expect error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1600", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1600 start----------------");
      let raw = new PowerOnTimerOptionsRaw("test_timer_1600", 1);
      let options: systemTimer.PowerOnTimerEnabledOptions = raw as systemTimer.PowerOnTimerEnabledOptions;
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1600 success");
        expect().assertFail();
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1600 err: " + JSON.stringify(e));
        expect(e.code === 401 || e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1600 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1700
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1700
     * @tc.desc   Test setPowerOnTimerEnabled with null options cast to options type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1700", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1700 start----------------");
      try {
        let raw = new PowerOnTimerOptionsRaw(null, true);
        let options: systemTimer.PowerOnTimerEnabledOptions = raw as systemTimer.PowerOnTimerEnabledOptions;
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1700 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1700 err: " + JSON.stringify(e));
        expect(e.code === 401 || e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1700 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1800
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1800
     * @tc.desc   Test setPowerOnTimerEnabled with timerName containing special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1800", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1800 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: "test-timer_001@special",
        enable: true
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1800 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1800 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1800 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_1900
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_1900
     * @tc.desc   Test setPowerOnTimerEnabled with timerName containing unicode characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_1900", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1900 start----------------");
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: "测试定时器_001",
        enable: false
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1900 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_1900 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_1900 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_2000
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_2000
     * @tc.desc   Test setPowerOnTimerEnabled with timerName of 63 bytes (just under max length).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_2000", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_2000 start----------------");
      let underMaxName = "b".repeat(63);
      let options: systemTimer.PowerOnTimerEnabledOptions = {
        timerName: underMaxName,
        enable: true
      };
      try {
        await systemTimer.setPowerOnTimerEnabled(options);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_2000 success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_2000 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_2000 end-----------------");
    });

    /**
     * @tc.name   SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100
     * @tc.number SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100
     * @tc.desc   Test setPowerOnTimerEnabled called multiple times with different options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100", Level.LEVEL2, async (done: Function) => {
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100 start----------------");
      try {
        let options1: systemTimer.PowerOnTimerEnabledOptions = {
          timerName: "multi_timer_1",
          enable: false
        };
        await systemTimer.setPowerOnTimerEnabled(options1);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100 first call success");
        let options2: systemTimer.PowerOnTimerEnabledOptions = {
          timerName: "multi_timer_1",
          enable: true
        };
        await systemTimer.setPowerOnTimerEnabled(options2);
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100 second call success");
        await systemTimer.setPowerOnTimerEnabled();
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100 third call success");
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info("====>SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100 err: " + JSON.stringify(e));
        expect(e.code === 202).assertTrue();
        done();
      }
      console.info("====>----------SUB_systemTime_setPowerOnTimerEnabled_JS_API_2100 end-----------------");
    });

  });
}
