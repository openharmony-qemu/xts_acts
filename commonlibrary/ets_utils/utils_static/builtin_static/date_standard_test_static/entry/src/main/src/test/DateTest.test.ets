/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
// function sleep(ms: number): Promise<void> {
//   return new Promise<void>((resolve: () => void) => {
//     setTimeout(resolve, ms);
//   });
// }
export default function dateTest() {
  describe('DateTest', (): void => {
    // // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    // beforeAll(() => {
    //   // Presets an action, which is performed only once before all test cases of the test suite start.
    //   // This API supports only one parameter: preset action function.
    // })
    // beforeEach(() => {
    //   await sleep(100)
    //   // Presets an action, which is performed before each unit test case starts.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: preset action function.
    // })
    // afterEach(() => {
    //   // Presets a clear action, which is performed after each unit test case ends.
    //   // The number of execution times is the same as the number of test cases defined by **it**.
    //   // This API supports only one parameter: clear action function.
    // })
    // afterAll(() => {
    //   // Presets a clear action, which is performed after all test cases of the test suite end.
    //   // This API supports only one parameter: clear action function.
    // })
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0100
     * @tc.name       testGetDate0001
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testGetDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0001";
      try {
        const birthday = new Date();
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(String([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
          29, 30, 31])).assertContain(String(result));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0200
     * @tc.name       testGetDate0002
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0002";
      try {
        const birthday = new Date('August 1, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0300
     * @tc.name       testGetDate0003
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0003";
      try {
        const birthday = new Date('August 19, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('19');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0400
     * @tc.name       testGetDate0004
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0004";
      try {
        const birthday = new Date('August 31, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0500
     * @tc.name       testGetDate0005
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0005";
      try {
        const birthday = new Date('February 31, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0600
     * @tc.name       testGetDate0006
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0006";
      try {
        const birthday = new Date('April 31, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0700
     * @tc.name       testGetDate0007
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0007";
      try {
        const birthday = new Date('February 29, 2024 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('29');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0800
     * @tc.name       testGetDate0008
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0008";
      try {
        const birthday = new Date('August 0, 1975 23:15:30');
        const result = birthday.getDate();
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'August 0, 1975 23:15:30'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_0900
     * @tc.name       testGetDate0009
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0009";
      try {
        const birthday = new Date('August 32, 1975 23:15:30');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'August 32, 1975 23:15:30'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1000
     * @tc.name       testGetDate0010
     * @tc.desc       Test the function of the interface GetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDate0010";
      try {
        const birthday = new Date('');
        const result = birthday.getDate();
        console.log(`${TAG} result:` + result);
        hilog.info(1, TAG, '%{public}s', 'SJG_result:' + JSON.stringify(result));
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        hilog.info(2, TAG, '%{public}s', 'SJG_result error:' + JSON.stringify(err.message));
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1100
     * @tc.name       testGetDay0001
     * @tc.desc       Test the function of the interface GetDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDay0001";
      try {
        const birthday = new Date();
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(String([0, 1, 2, 3, 4, 5, 6])).assertContain(String(result));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1200
     * @tc.name       testGetDay0002
     * @tc.desc       Test the function of the interface GetDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDay0002";
      try {
        const birthday = new Date('August 17, 1975 23:15:30');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1300
     * @tc.name       testGetDay0003
     * @tc.desc       Test the function of the interface GetDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDay0003";
      try {
        const birthday = new Date('August 19, 1975 23:15:30');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1400
     * @tc.name       testGetDay0004
     * @tc.desc       Test the function of the interface GetDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDay0004";
      try {
        const birthday = new Date('August 23, 1975 23:15:30');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1500
     * @tc.name       testGetDay0005
     * @tc.desc       Test the function of the interface GetDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDay0005";
      try {
        const birthday = new Date('August 0, 1975 23:15:30');
        const result = birthday.getDay();
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'August 0, 1975 23:15:30'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1600
     * @tc.name       testGetDay0006
     * @tc.desc       Test the function of the interface GetDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDay0006";
      try {
        const birthday = new Date('August 32, 1975 23:15:30');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'August 32, 1975 23:15:30'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1700
     * @tc.name       testGetDay0007
     * @tc.desc       Test the function of the interface GetDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetDay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetDay0007";
      try {
        const birthday = new Date('');
        const result = birthday.getDay();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1800
     * @tc.name       testGetFullYear0001
     * @tc.desc       Test the function of the interface GetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetFullYear0001";
      try {
        const birthday = new Date();
        const result = birthday.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(result < 2124 && result > 1924).assertTrue();
        expect(String(result)).assertEqual(String(birthday.getFullYear()));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_1900
     * @tc.name       testGetFullYear0002
     * @tc.desc       Test the function of the interface GetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetFullYear0002";
      try {
        const moonLanding = new Date('July 20, 50 00:20:18');
        const result = moonLanding.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1950');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2000
     * @tc.name       testGetFullYear0003
     * @tc.desc       Test the function of the interface GetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetFullYear0003";
      try {
        const moonLanding = new Date('July 20, 00 00:20:18');
        const result = moonLanding.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2000');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2100
     * @tc.name       testGetFullYear0004
     * @tc.desc       Test the function of the interface GetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetFullYear0004";
      try {
        const moonLanding = new Date('July 20, 49 00:20:18');
        const result = moonLanding.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2049');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2200
     * @tc.name       testGetFullYear0005
     * @tc.desc       Test the function of the interface GetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetFullYear0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getFullYear();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2300
     * @tc.name       testGetHours0001
     * @tc.desc       Test the function of the interface GetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetHours0001";
      try {
        const birthday = new Date();
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect(String([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]))
          .assertContain(String(result));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2400
     * @tc.name       testGetHours0002
     * @tc.desc       Test the function of the interface GetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetHours0002";
      try {
        const birthday = new Date('March 13, 08 00:20');
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2500
     * @tc.name       testGetHours0003
     * @tc.desc       Test the function of the interface GetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetHours0003";
      try {
        const birthday = new Date('March 13, 08 04:20');
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2600
     * @tc.name       testGetHours0004
     * @tc.desc       Test the function of the interface GetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetHours0004";
      try {
        const birthday = new Date('March 13, 08 23:00');
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
        expect(result).assertEqual(23);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2700
     * @tc.name       testGetHours0005
     * @tc.desc       Test the function of the interface GetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetHours0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetHours0005";
      try {
        const birthday = new Date('');
        const result = birthday.getHours();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2800
     * @tc.name       testGetMilliSeconds0001
     * @tc.desc       Test the function of the interface MilliSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMilliSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMilliSeconds0001";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(0);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(result >= 0 && result <= 999).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_2900
     * @tc.name       testGetMilliSeconds0002
     * @tc.desc       Test the function of the interface MilliSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMilliSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMilliSeconds0002";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(123);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3000
     * @tc.name       testGetMilliSeconds0003
     * @tc.desc       Test the function of the interface MilliSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMilliSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMilliSeconds0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(999);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3100
     * @tc.name       testGetMilliSeconds0004
     * @tc.desc       Test the function of the interface MilliSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMilliSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMilliSeconds0004";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(1000);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3200
     * @tc.name       testGetMilliSeconds0005
     * @tc.desc       Test the function of the interface MilliSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMilliSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMilliSeconds0005";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        moonLanding.setMilliseconds(-1);
        const result = moonLanding.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3300
     * @tc.name       testGetMinutes0001
     * @tc.desc       Test the function of the interface GetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMinutes0001";
      try {
        const birthday = new Date();
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(result >= 0 && result <= 59).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3400
     * @tc.name       testGetMinutes0002
     * @tc.desc       Test the function of the interface GetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMinutes0002";
      try {
        const birthday = new Date('March 13, 08 04:00');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3500
     * @tc.name       testGetMinutes0003
     * @tc.desc       Test the function of the interface GetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMinutes0003";
      try {
        const birthday = new Date('March 13, 08 04:20');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('20');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3600
     * @tc.name       testGetMinutes0004
     * @tc.desc       Test the function of the interface GetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMinutes0004";
      try {
        const birthday = new Date('March 13, 08 04:59');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('59');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3700
     * @tc.name       testGetMinutes0005
     * @tc.desc       Test the function of the interface GetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMinutes0005";
      try {
        const birthday = new Date('March 13, 08 04:60');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'March 13, 08 04:60'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3800
     * @tc.name       testGetMinutes0006
     * @tc.desc       Test the function of the interface GetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMinutes0006";
      try {
        const birthday = new Date('');
        const result = birthday.getMinutes();
        console.log(`${TAG} result:` + result);
        hilog.info(3, TAG, '%{public}s', 'testGetMinutes0006 jzl flag1 is:' + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_3900
     * @tc.name       testGetMonth0001
     * @tc.desc       Test the function of the interface GetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMonth0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])).assertContain(String(result));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4000
     * @tc.name       testGetMonth0002
     * @tc.desc       Test the function of the interface GetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMonth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMonth0002";
      try {
        const moonLanding = new Date('January 20, 69 00:20:18');
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4100
     * @tc.name       testGetMonth0003
     * @tc.desc       Test the function of the interface GetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMonth0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4200
     * @tc.name       testGetMonth0004
     * @tc.desc       Test the function of the interface GetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMonth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMonth0004";
      try {
        const moonLanding = new Date('December 20, 69 00:20:18');
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('11');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4300
     * @tc.name       testGetMonth0005
     * @tc.desc       Test the function of the interface GetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetMonth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetMonth0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getMonth();
        console.log(`${TAG} result:` + result);
        hilog.info(3, TAG, '%{public}s', 'testGetMonth0005 jzl flag1 is:' + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4400
     * @tc.name       testGetSeconds0001
     * @tc.desc       Test the function of the interface GetSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetSeconds0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(result >= 0 && result <= 59).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4500
     * @tc.name       testGetSeconds0002
     * @tc.desc       Test the function of the interface GetSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetSeconds0002";
      try {
        const moonLanding = new Date('January 20, 69 00:20:00');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4600
     * @tc.name       testGetSeconds0003
     * @tc.desc       Test the function of the interface GetSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetSeconds0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('18');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4700
     * @tc.name       testGetSeconds0004
     * @tc.desc       Test the function of the interface GetSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetSeconds0004";
      try {
        const moonLanding = new Date('December 20, 69 00:20:59');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('59');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_4800
     * @tc.name       testGetSeconds0005
     * @tc.desc       Test the function of the interface GetSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetSeconds0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        hilog.info(4, TAG, '%{public}s', 'testGetSeconds0005 jzl flag1 is:' + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5000
     * @tc.name       testGetTime0002
     * @tc.desc       Test the function of the interface GetTime.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetTime0002";
      try {
        const moonLanding = new Date('January 20, 69 00:20:00');
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        expect(String(copy.setTime(moonLanding.getTime()))).assertEqual('-29922000000');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5100
     * @tc.name       testGetTime0003
     * @tc.desc       Test the function of the interface GetTime.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetTime0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18');
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        expect(String(copy.setTime(moonLanding.getTime()))).assertEqual('-14283582000');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5200
     * @tc.name       testGetTime0004
     * @tc.desc       Test the function of the interface GetTime.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetTime0004";
      try {
        const moonLanding = new Date('December 20, 69 00:20:59');
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        expect(String(copy.setTime(moonLanding.getTime()))).assertEqual('-1064341000');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5300
     * @tc.name       testGetTime0005
     * @tc.desc       Test the function of the interface GetTime.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetTime0005";
      try {
        const moonLanding = new Date('');
        const copy = new Date();
        console.log(`${TAG} result:` + copy.setTime(moonLanding.getTime()));
        hilog.info(5, TAG, '%{public}s', 'testGetTime0005 jzl flag1 is:' + copy);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5400
     * @tc.name       testGetTimezoneOffset0001
     * @tc.desc       Test the function of the interface GetTimezoneOffset.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetTimezoneOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetTimezoneOffset0001";
      try {
        const date1 = new Date();
        const result = date1.getTimezoneOffset();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('-480');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5500
     * @tc.name       testGetTimezoneOffset0002
     * @tc.desc       Test the function of the interface GetTimezoneOffset.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetTimezoneOffset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetTimezoneOffset0002";
      try {
        const date1 = new Date();
        const date2 = new Date('August 19, 1975 23:15:30 GMT-02:00');
        const result = date1.getTimezoneOffset() === date2.getTimezoneOffset();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5600
     * @tc.name       testGetTimezoneOffset0003
     * @tc.desc       Test the function of the interface GetTimezoneOffset.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetTimezoneOffset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetTimezoneOffset0003";
      try {
        const date1 = new Date('August 19, 1975 23:15:30 GMT+07:00');
        const date2 = new Date('August 19, 1975 23:15:30 GMT-02:00');
        const result = date1.getTimezoneOffset() === date2.getTimezoneOffset();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5700
     * @tc.name       testGetTimezoneOffset0004
     * @tc.desc       Test the function of the interface GetTimezoneOffset.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetTimezoneOffset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetTimezoneOffset0004";
      try {
        const date1 = new Date('');
        const result = date1.getTimezoneOffset();
        console.log(`${TAG} result:` + result);
        hilog.info(6, TAG, '%{public}s', 'testGetTimezoneOffset0004 jzl flag1 is:' + result);
        } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5800
     * @tc.name       testGetUTCDate0001
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0001";
      try {
        const date1 = new Date();
        const date2 = new Date();
        const result = date1.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(result >= 1 && result <= 31).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_5900
     * @tc.name       testGetUTCDate0002
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0002";
      try {
        const date1 = new Date('August 1, 1975 23:15:30 GMT+11:00');
        const result = date1.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6000
     * @tc.name       testGetUTCDate0003
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0003";
      try {
        const birthday = new Date('August 19, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('19');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6100
     * @tc.name       testGetUTCDate0004
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0004";
      try {
        const birthday = new Date('August 31, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6200
     * @tc.name       testGetUTCDate0005
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0005";
      try {
        const birthday = new Date('February 31, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6300
     * @tc.name       testGetUTCDate0006
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0006";
      try {
        const birthday = new Date('April 31, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6400
     * @tc.name       testGetUTCDate0007
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0007";
      try {
        const birthday = new Date('February 29, 2024 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('29');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6500
     * @tc.name       testGetUTCDate0008
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0008";
      try {
        const birthday = new Date('August 0, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'August 0, 1975 23:15:30'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6600
     * @tc.name       testGetUTCDate0009
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0009";
      try {
        const birthday = new Date('August 32, 1975 23:15:30');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'August 32, 1975 23:15:30'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6700
     * @tc.name       testGetUTCDate0010
     * @tc.desc       Test the function of the interface GetUTCDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDate0010";
      try {
        const birthday = new Date('');
        const result = birthday.getUTCDate();
        console.log(`${TAG} result:` + result);
        hilog.info(2, TAG, '%{public}s', 'SJG_testGetUTCDate0010_result:' + result);

      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6800
     * @tc.name       testGetUTCDay0001
     * @tc.desc       Test the function of the interface GetUTCDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDay0001";
      try {
        const birthday = new Date();
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(String([0, 1, 2, 3, 4, 5, 6])).assertContain(String(result));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_6900
     * @tc.name       testGetUTCDay0002
     * @tc.desc       Test the function of the interface GetUTCDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDay0002";
      try {
        const birthday = new Date('August 17, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7000
     * @tc.name       testGetUTCDay0003
     * @tc.desc       Test the function of the interface GetUTCDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDay0003";
      try {
        const birthday = new Date('August 19, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7100
     * @tc.name       testGetUTCDay0004
     * @tc.desc       Test the function of the interface GetUTCDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDay0004";
      try {
        const birthday = new Date('August 23, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7200
     * @tc.name       testGetUTCDay0005
     * @tc.desc       Test the function of the interface GetUTCDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDay0005";
      try {
        const birthday = new Date('August 0, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'August 0, 1975 23:15:30 GMT+11:00'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7300
     * @tc.name       testGetUTCDay0006
     * @tc.desc       Test the function of the interface GetUTCDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDay0006";
      try {
        const birthday = new Date('August 32, 1975 23:15:30 GMT+11:00');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'August 32, 1975 23:15:30 GMT+11:00'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7400
     * @tc.name       testGetUTCDay0007
     * @tc.desc       Test the function of the interface GetUTCDay.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCDay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCDay0007";
      try {
        const birthday = new Date('');
        const result = birthday.getUTCDay();
        console.log(`${TAG} result:` + result);
        hilog.info(2, TAG, '%{public}s', 'SJG_testGetUTCDay0007_result:' + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7500
     * @tc.name       testGetUTCFullYear0001
     * @tc.desc       Test the function of the interface GetUTCFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCFullYear0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(result > 1924 && result < 2124).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7600
     * @tc.name       testGetUTCFullYear0002
     * @tc.desc       Test the function of the interface GetUTCFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCFullYear0002";
      try {
        const moonLanding = new Date('July 20, 50 00:20:18 GMT+11:00');
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1950');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7700
     * @tc.name       testGetUTCFullYear0003
     * @tc.desc       Test the function of the interface GetUTCFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCFullYear0003";
      try {
        const moonLanding = new Date('July 20, 00 00:20:18 GMT+11:00');
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2000');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7800
     * @tc.name       testGetUTCFullYear0004
     * @tc.desc       Test the function of the interface GetUTCFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCFullYear0004";
      try {
        const moonLanding = new Date('July 20, 49 00:20:18 GMT+11:00');
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2049');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_7900
     * @tc.name       testGetUTCFullYear0005
     * @tc.desc       Test the function of the interface GetUTCFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCFullYear0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getUTCFullYear();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8000
     * @tc.name       testGetUTCHours0001
     * @tc.desc       Test the function of the interface GetUTCHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCHours0001";
      try {
        const birthday = new Date();
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
        expect(result > 0 && result < 23).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

  })
}
