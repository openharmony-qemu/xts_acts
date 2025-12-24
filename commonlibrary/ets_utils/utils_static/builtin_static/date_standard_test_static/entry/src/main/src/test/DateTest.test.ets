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

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8100
     * @tc.name       testGetUTCHours0002
     * @tc.desc       Test the function of the interface GetUTCHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCHours0002";
      try {
        const birthday = new Date('March 13, 08 00:20 GMT-00:00');
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8200
     * @tc.name       testGetUTCHours0003
     * @tc.desc       Test the function of the interface GetUTCHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCHours0003";
      try {
        const birthday = new Date('March 13, 08 04:20 GMT-00:00');
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('4');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8300
     * @tc.name       testGetUTCHours0004
     * @tc.desc       Test the function of the interface GetUTCHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCHours0004";
      try {
        const birthday = new Date('March 13, 08 23:00 GMT-00:00');
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('23');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8400
     * @tc.name       testGetUTCHours0005
     * @tc.desc       Test the function of the interface GetUTCHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCHours0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCHours0005";
      try {
        const birthday = new Date('');
        const result = birthday.getUTCHours();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8500
     * @tc.name       testGetUTCMilliseconds0001
     * @tc.desc       Test the function of the interface GetUTCMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMilliseconds0001";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(0);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8600
     * @tc.name       testGetUTCMilliseconds0002
     * @tc.desc       Test the function of the interface GetUTCMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMilliseconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMilliseconds0002";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(123);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8700
     * @tc.name       testGetUTCMilliseconds0003
     * @tc.desc       Test the function of the interface GetUTCMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMilliseconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMilliseconds0003";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(999);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8800
     * @tc.name       testGetUTCMilliseconds0004
     * @tc.desc       Test the function of the interface GetUTCMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMilliseconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMilliseconds0004";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(1000);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_8900
     * @tc.name       testGetUTCMilliseconds0005
     * @tc.desc       Test the function of the interface GetUTCMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMilliseconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMilliseconds0005";
      try {
        const moonLanding = new Date('July 20, 69 00:20:18 GMT+11:00');
        moonLanding.setMilliseconds(-1);
        const result = moonLanding.getUTCMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9000
     * @tc.name       testGetUTCMinutes0001
     * @tc.desc       Test the function of the interface GetUTCMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMinutes0001";
      try {
        const birthday = new Date();
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(result >= 0 && result <= 59).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9100
     * @tc.name       testGetUTCMinutes0002
     * @tc.desc       Test the function of the interface GetUTCMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMinutes0002";
      try {
        const birthday = new Date('March 13, 08 04:00 GMT+11:00');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9200
     * @tc.name       testGetUTCMinutes0003
     * @tc.desc       Test the function of the interface GetUTCMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMinutes0003";
      try {
        const birthday = new Date('March 13, 08 04:20 GMT+11:00');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('20');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9300
     * @tc.name       testGetUTCMinutes0004
     * @tc.desc       Test the function of the interface GetUTCMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMinutes0004";
      try {
        const birthday = new Date('March 13, 08 04:59 GMT+11:00');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('59');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9400
     * @tc.name       testGetUTCMinutes0005
     * @tc.desc       Test the function of the interface GetUTCMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMinutes0005";
      try {
        const birthday = new Date('March 13, 08 04:60');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: 'March 13, 08 04:60'");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9500
     * @tc.name       testGetUTCMinutes0006
     * @tc.desc       Test the function of the interface GetUTCMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMinutes0006";
      try {
        const birthday = new Date('');
        const result = birthday.getUTCMinutes();
        console.log(`${TAG} result:` + result);
        hilog.info(2, TAG, '%{public}s', 'SJG_testGetUTCMinutes0006_result:' + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9600
     * @tc.name       testGetUTCMonth0001
     * @tc.desc       Test the function of the interface GetUTCMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMonth0001";
      try {
        const moonLanding = new Date();
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]).assertContain(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9700
     * @tc.name       testGetUTCMonth0002
     * @tc.desc       Test the function of the interface GetUTCMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMonth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMonth0002";
      try {
        const moonLanding = new Date('January 31, 1975, 23:15:30 GMT+11:00');
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9800
     * @tc.name       testGetUTCMonth0003
     * @tc.desc       Test the function of the interface GetUTCMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMonth0003";
      try {
        const moonLanding = new Date('July 31, 1975, 23:15:30 GMT+11:00');
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('6');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_9900
     * @tc.name       testGetUTCMonth0004
     * @tc.desc       Test the function of the interface GetUTCMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMonth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMonth0004";
      try {
        const moonLanding = new Date('December 31, 1975, 23:15:30 GMT+11:00');
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('11');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10000
     * @tc.name       testGetUTCMonth0005
     * @tc.desc       Test the function of the interface GetUTCMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCMonth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCMonth0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getUTCMonth();
        console.log(`${TAG} result:` + result);
        hilog.info(2, TAG, '%{public}s', 'SJG_testBufferByteLength00010_result:' + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10100
     * @tc.name       testGetUTCSeconds0001
     * @tc.desc       Test the function of the interface GetUTCSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCSeconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCSeconds0001";
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10200
     * @tc.name       testGetUTCSeconds0002
     * @tc.desc       Test the function of the interface GetUTCSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCSeconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCSeconds0002";
      try {
        const moonLanding = new Date('January 20, 1969, 20:18:00 UTC');
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10300
     * @tc.name       testGetUTCSeconds0003
     * @tc.desc       Test the function of the interface GetUTCSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCSeconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCSeconds0003";
      try {
        const moonLanding = new Date('July 20, 1969, 20:18:18 UTC');
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10400
     * @tc.name       testGetUTCSeconds0004
     * @tc.desc       Test the function of the interface GetUTCSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCSeconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCSeconds0004";
      try {
        const moonLanding = new Date('December 20, 1969, 20:18:59 UTC');
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10500
     * @tc.name       testGetUTCSeconds0005
     * @tc.desc       Test the function of the interface GetUTCSeconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testGetUTCSeconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetUTCSeconds0005";
      try {
        const moonLanding = new Date('');
        const result = moonLanding.getSeconds();
        console.log(`${TAG} result:` + result);
        hilog.info(2, TAG, '%{public}s', 'SJG_testGetUTCSeconds0005_result:' + result);
      } catch (err) {
        err = err as FormatError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("Invalid time value: ''");
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10600
     * @tc.name       testSetDate0001
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(0);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10700
     * @tc.name       testSetDate0002
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(1);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10800
     * @tc.name       testSetDate0003
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(14);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('14');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_10900
     * @tc.name       testSetDate0004
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(31);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('31');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11000
     * @tc.name       testSetDate0005
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setDate(32);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11100
     * @tc.name       testSetDate0006
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0006";
      try {
        const event = new Date('February 19, 1975 23:15:30');
        event.setDate(28);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('28');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11200
     * @tc.name       testSetDate0007
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0007";
      try {
        const event = new Date('February 19, 1975 23:15:30');
        event.setDate(29);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11300
     * @tc.name       testSetDate0008
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0008";
      try {
        const event = new Date('June 19, 1975 23:15:30');
        event.setDate(30);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('30');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11400
     * @tc.name       testSetDate0009
     * @tc.desc       Test the function of the interface SetDate.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetDate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetDate0009";
      try {
        const event = new Date('June 19, 1975 23:15:30');
        event.setDate(31);
        const result = event.getDate();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11500
     * @tc.name       testSetFullYear0001
     * @tc.desc       Test the function of the interface SetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetFullYear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetFullYear0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(0);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11600
     * @tc.name       testSetFullYear0002
     * @tc.desc       Test the function of the interface SetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetFullYear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetFullYear0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(1969);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1969');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11700
     * @tc.name       testSetFullYear0003
     * @tc.desc       Test the function of the interface SetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetFullYear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetFullYear0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(9999);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('9999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11800
     * @tc.name       testSetFullYear0004
     * @tc.desc       Test the function of the interface SetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetFullYear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetFullYear0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(1999, 11, 3);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('1999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_11900
     * @tc.name       testSetFullYear0005
     * @tc.desc       Test the function of the interface SetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetFullYear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetFullYear0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(1999, 12, 30);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2000');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_12000
     * @tc.name       testSetFullYear0006
     * @tc.desc       Test the function of the interface SetFullYear.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetFullYear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetFullYear0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setFullYear(1999, 11, 32);
        const result = event.getFullYear();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('2000');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_12100
     * @tc.name       testSetHours0001
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(-1);
        const result = "Mon Aug 18 1975 23:15:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_122000
     * @tc.name       testSetHours0002
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(0);
        const result = "Tue Aug 19 1975 00:15:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_123000
     * @tc.name       testSetHours0003
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(23);
        const result = "Tue Aug 19 1975 23:15:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_124000
     * @tc.name       testSetHours0004
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(24);
        const result = "Wed Aug 20 1975 00:15:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_125000
     * @tc.name       testSetHours0005
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, -1);
        const result = "Tue Aug 19 1975 00:59:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_126000
     * @tc.name       testSetHours0006
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 0);
        const result = "Tue Aug 19 1975 01:00:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_127000
     * @tc.name       testSetHours0007
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 59);
        const result = "Tue Aug 19 1975 01:59:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_128000
     * @tc.name       testSetHours0008
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 60);
        const result = "Tue Aug 19 1975 02:00:30 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_129000
     * @tc.name       testSetHours0009
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0009";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, -1);
        const result = "Tue Aug 19 1975 01:01:59 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_130000
     * @tc.name       testSetHours0010
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0010";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 0);
        const result = "Tue Aug 19 1975 01:02:00 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_131000
     * @tc.name       testSetHours0011
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0011";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 59);
        const result = "Tue Aug 19 1975 01:02:59 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_132000
     * @tc.name       testSetHours0012
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0012";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 60);
        const result = "Tue Aug 19 1975 01:03:00 GMT+0800";
        console.log(`${TAG} event:` + event + ',result:' + result);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_133000
     * @tc.name       testSetHours0013
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0013";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 3, -1);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_134000
     * @tc.name       testSetHours0014
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0014";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 3, 0);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_135000
     * @tc.name       testSetHours0015
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0015";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 3, 999);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_136000
     * @tc.name       testSetHours0016
     * @tc.desc       Test the function of the interface SetHours.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetHours0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetHours0016";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setHours(1, 2, 3, 1000);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_137000
     * @tc.name       testSetMilliseconds0001
     * @tc.desc       Test the function of the interface SetMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMilliseconds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMilliseconds0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(-1);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_138000
     * @tc.name       testSetMilliseconds0002
     * @tc.desc       Test the function of the interface SetMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMilliseconds0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMilliseconds0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(0);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_139000
     * @tc.name       testSetMilliseconds0003
     * @tc.desc       Test the function of the interface SetMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMilliseconds0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMilliseconds0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(456);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('456');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_140000
     * @tc.name       testSetMilliseconds0004
     * @tc.desc       Test the function of the interface SetMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMilliseconds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMilliseconds0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(999);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_141000
     * @tc.name       testSetMilliseconds0005
     * @tc.desc       Test the function of the interface SetMilliseconds.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMilliseconds0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMilliseconds0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMilliseconds(1000);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_142000
     * @tc.name       testSetMinutes0001
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(-1);
        const result = "Tue Aug 19 1975 22:59:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_143000
     * @tc.name       testSetMinutes0002
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(0);
        const result = "Tue Aug 19 1975 23:00:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_144000
     * @tc.name       testSetMinutes0003
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(59);
        const result = "Tue Aug 19 1975 23:59:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_145000
     * @tc.name       testSetMinutes0004
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(60);
        const result = "Wed Aug 20 1975 00:00:30 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_146000
     * @tc.name       testSetMinutes0005
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, -1);
        const result = "Tue Aug 19 1975 23:01:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_147000
     * @tc.name       testSetMinutes0006
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 0);
        const result = "Tue Aug 19 1975 23:02:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_148000
     * @tc.name       testSetMinutes0007
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 59);
        const result = "Tue Aug 19 1975 23:02:59 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_149000
     * @tc.name       testSetMinutes0008
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0008";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 60);
        const result = "Tue Aug 19 1975 23:03:00 GMT+0800";
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_150000
     * @tc.name       testSetMinutes0009
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0009";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 3, -1);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_151000
     * @tc.name       testSetMinutes0010
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0010";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 3, 0);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_152000
     * @tc.name       testSetMinutes0011
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0011";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 3, 999);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('999');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_153000
     * @tc.name       testSetMinutes0012
     * @tc.desc       Test the function of the interface SetMinutes.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMinutes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMinutes0012";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMinutes(2, 3, 1000);
        const result = event.getMilliseconds();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_154000
     * @tc.name       testSetMonth0001
     * @tc.desc       Test the function of the interface SetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMonth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMonth0001";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(-1);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('11');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_155000
     * @tc.name       testSetMonth0002
     * @tc.desc       Test the function of the interface SetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMonth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMonth0002";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(0);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_156000
     * @tc.name       testSetMonth0003
     * @tc.desc       Test the function of the interface SetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMonth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMonth0003";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(3);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_157000
     * @tc.name       testSetMonth0004
     * @tc.desc       Test the function of the interface SetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMonth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMonth0004";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(11);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('11');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_158000
     * @tc.name       testSetMonth0005
     * @tc.desc       Test the function of the interface SetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMonth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMonth0005";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(12);
        const result = event.getMonth();
        console.log(`${TAG} result:` + result);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_159000
     * @tc.name       testSetMonth0006
     * @tc.desc       Test the function of the interface SetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMonth0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMonth0006";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(8, 0);
        const result = 'Sun Aug 31 1975 23:15:30 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_BASE_DATE_160000
     * @tc.name       testSetMonth0007
     * @tc.desc       Test the function of the interface SetMonth.
     * @tc.size       MediumTest
     * @tc.type        Function
     * @tc.level      Level 1
     */
    it('testSetMonth0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetMonth0007";
      try {
        const event = new Date('August 19, 1975 23:15:30');
        event.setMonth(8, 1);
        const result = 'Mon Sep 01 1975 23:15:30 GMT+0800';
        console.log(`${TAG} result:` + event);
        expect(event.toString()).assertEqual(result);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

  })
}
