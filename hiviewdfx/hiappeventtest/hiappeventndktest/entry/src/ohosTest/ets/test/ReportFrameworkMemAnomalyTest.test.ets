/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import hiappevent from 'libentry.so'

export default function ReportFrameworkMemAnomalyTest() {
  describe('ReportFrameworkMemAnomalyTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0100
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0100
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly1();
        hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0100 -->%{public}d', code);
        expect(code == 0 || code == -300 || code == -100).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHiAppEventReportFrameworkMemAnomaly0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0200
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0200
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly2();
        hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0200 -->%{public}d', code);
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHiAppEventReportFrameworkMemAnomaly0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0300
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0300
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly3();
        hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0300 -->%{public}d', code);
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHiAppEventReportFrameworkMemAnomaly0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0400
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0400
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly4();
        hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0400 -->%{public}d', code);
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHiAppEventReportFrameworkMemAnomaly0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0500
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0500
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly5();
        hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0500 -->%{public}d', code);
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHiAppEventReportFrameworkMemAnomaly0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0600
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0600
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0600 start')
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly6();
        hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0600 -->%{public}d', code);
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHiAppEventReportFrameworkMemAnomaly0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0700
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0700
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly7();
        hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0700 -->%{public}d', code);
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHiAppEventReportFrameworkMemAnomaly0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0800
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0800
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly8();
        hilog.info(0x0000, 'testTag', 'testHiAppEventReportFrameworkMemAnomaly0800 -->%{public}d', code);
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHiAppEventReportFrameworkMemAnomaly0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly0900
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_0900
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly9();
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHiAppEventReportFrameworkMemAnomaly0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly1000
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_1000
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly10();
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHiAppEventReportFrameworkMemAnomaly1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly1100
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_1100
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly11();
        expect(code == 0 || code == -300).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHiAppEventReportFrameworkMemAnomaly1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHiAppEventReportFrameworkMemAnomaly1200
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_ReportFrameworkMemAnomaly_1200
     * @tc.desc   test OH_HiAppEvent_ReportFrameworkMemAnomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventReportFrameworkMemAnomaly1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = hiappevent.TestHiAppEventReportFrameworkMemAnomaly12();
        expect(code == 0 || code == -300 || code == -9 || code == -100).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHiAppEventReportFrameworkMemAnomaly1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

  })
}