/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';
import { hidebug } from '@kit.PerformanceAnalysisKit';
import { fileIo as fs, statfs } from '@kit.CoreFileKit';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};

export default function HidebugrawTest() {
  describe('HidebugrawTest', () => {
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
     * @tc.name   testHidebugraw_0100
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_0100
     * @tc.desc   验证dumpJsRawHeapData()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugraw_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          let filename = await hidebug.dumpJsRawHeapData()
          console.info(`TestTag success and generated file path is ${filename}`)
          let filename1 = await hidebug.dumpJsRawHeapData()
          console.info(`TestTag success and generated file path is ${filename1}`)
          done();
        }
        done();
      }catch (error) {
        console.error(`TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.name   testHidebugraw_0200
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_0200
     * @tc.desc   验证同步dumpJsRawHeapData()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugraw_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          let filename = await hidebug.dumpJsRawHeapData()
          console.info(`TestTag success and generated file path is ${filename}`)
          let filename1 = await hidebug.dumpJsRawHeapData()
          console.info(`TestTag success and generated file path is ${filename1}`)
          done();
        }
        done();
      }catch (error) {
        console.error(`TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHidebugraw_0300
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_0300
     * @tc.desc   连续dumpJsRawHeapData() 捕获11400112错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugraw_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          hidebug.dumpJsRawHeapData().then((filePath: string) => {
            console.info(`TestTag success and generated file path is ${filePath}`)
          })
          let filename = await hidebug.dumpJsRawHeapData()
          console.info(`TestTag success and generated file path is ${filename}`)
          expect(false).assertTrue();
        }
        done();
      }catch (error) {
        console.error(`TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect((error as BusinessError).code==11400112).assertTrue();
        await asyncSleep(5000);
        done();
      }
    })

    /**
     * @tc.name   testHidebugraw_0400
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_0400
     * @tc.desc   验证 setJsRawHeapTrimLevel(1) 和 不设置setJsRawHeapTrimLevel 时候比较文件大小
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugraw_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(`testHidebugraw_0400 success start`)
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          let filename1 = await hidebug.dumpJsRawHeapData();
          console.info(`testHidebugraw_0400 success filename1 is ${filename1}`)
          let stat1 = fs.statSync(filename1);
          let filesize1 = stat1.size
          console.info("testHidebugraw_0400 success filezize1 is " + filesize1);
          hidebug.setJsRawHeapTrimLevel(1);
          let filename2 = await hidebug.dumpJsRawHeapData();
          console.info(`testHidebugraw_0400 success filename2 is ${filename2}`)
          let stat2 = fs.statSync(filename2);
          let filesize2 = stat2.size
          console.info("testHidebugraw_0400 success filezize2 is " + filesize2);
          console.info("testHidebugraw_0400 success filezize2 - filesize2 is " + Math.abs(filesize1-filesize2));
          console.info("testHidebugraw_0400 success 1/4 filezize2 is " + 1/4 * filesize1);
          expect(Math.abs(filesize2-filesize1) > 1/4 * filesize2 ).assertTrue();
          hidebug.setJsRawHeapTrimLevel(0)
          done();
        }
        done();
      }catch (err) {
        console.info(`testHidebugraw_0400 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
      console.info(`testHidebugraw_0400 success end`)
    })

    /**
     * @tc.name   testHidebugraw_0500
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_0500
     * @tc.desc   验证 setJsRawHeapTrimLevel(1) 和 setJsRawHeapTrimLevel(0) 时候比较文件大小
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugraw_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(`testHidebugraw_0500 success start`)
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          hidebug.setJsRawHeapTrimLevel(1);
          let filename1 = await hidebug.dumpJsRawHeapData()
          console.info(`testHidebugraw_0500 success filename1 is ${filename1}`)
          let stat1 = fs.statSync(filename1);
          let filesize1 = stat1.size
          console.info("testHidebugraw_0500 success filezize1 is " + filesize1);
          hidebug.setJsRawHeapTrimLevel(0);
          let filename2 = await hidebug.dumpJsRawHeapData()
          console.info(`testHidebugraw_0500 success filename2 is ${filename2}`)
          let stat2 = fs.statSync(filename2);
          let filesize2 = stat2.size
          console.info("testHidebugraw_0500 success filezize2 is " + filesize2);
          console.info("testHidebugraw_0500 success filezize2 - filesize2 is " + Math.abs(filesize1-filesize2));
          console.info("testHidebugraw_0500 success 1/4 filezize2 is " + 1/4 * filesize2);
          expect(Math.abs(filesize1-filesize2) > 1/4 * filesize2 ).assertTrue();
          done();
        }
        done();
      }catch (err) {
        console.info(`testHidebugraw_0500 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
      console.info(`testHidebugraw_0500 success end`)
    })


    /**
     * @tc.name   testHidebugraw_0600
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_0600
     * @tc.desc   setJsRawHeapTrimLevel 传入异常值返回 401 错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugraw_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(`testHidebugraw_0600 success start`)
        hidebug.setJsRawHeapTrimLevel(undefined)
        expect(false).assertTrue()
      }catch (err) {
        console.info(`testHidebugraw_0600 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(`testHidebugraw_0600 success end`)
    })

    /**
     * @tc.name   testHidebugraw_0700
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_0700
     * @tc.desc   hidebug.setJsRawHeapTrimLevel 传入枚举类型 TRIM_LEVEL_1 和 TRIM_LEVEL_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugraw_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(`testHidebugraw_0700 success start`)
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          hidebug.setJsRawHeapTrimLevel(hidebug.JsRawHeapTrimLevel.TRIM_LEVEL_1);
          let filename1 = await hidebug.dumpJsRawHeapData()
          console.info(`testHidebugraw_0700 success filename1 is ${filename1}`)
          let stat1 = fs.statSync(filename1);
          let filesize1 = stat1.size
          console.info("testHidebugraw_0700 success filezize1 is " + filesize1);
          hidebug.setJsRawHeapTrimLevel(hidebug.JsRawHeapTrimLevel.TRIM_LEVEL_2);
          let filename2 = await hidebug.dumpJsRawHeapData()
          console.info(`testHidebugraw_0700 success filename2 is ${filename2}`)
          let stat2 = fs.statSync(filename2);
          let filesize2 = stat2.size
          console.info("testHidebugraw_0700 success filezize2 is " + filesize2);
          console.info("testHidebugraw_0700 success filezize2 - filesize2 is " + Math.abs(filesize1-filesize2));
          console.info("testHidebugraw_0700 success 1/4 filezize2 is " + 1/5 * filesize1);
          expect(Math.abs(filesize2-filesize1) > 1/5 * filesize2 ).assertTrue();
          hidebug.setJsRawHeapTrimLevel(hidebug.JsRawHeapTrimLevel.TRIM_LEVEL_1);
          done();
        }
        done();
      }catch (err) {
        console.info(`testHidebugraw_0700 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
      console.info(`testHidebugraw_0700 success end`)
    })


    /**
     * @tc.name   testHidebugraw_0800
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_0800
     * @tc.desc   setJsRawHeapTrimLevel 传入异常值返回 401 错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugraw_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(`testHidebugraw_0800 success start`)
        hidebug.setJsRawHeapTrimLevel(3);
        expect(false).assertTrue()
      }catch (err) {
        console.info(`testHidebugraw_0800 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(`testHidebugraw_0800 success end`)
    })

    /**
     * @tc.name   testHidebugrawprocess_0100
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0100
     * @tc.desc   Test dumpJsRawHeapData(false, false, false) - No GC, No Clean, Thread Only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrawprocess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/';
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          // needGC=false, needClean=false, processDump=false
          let filenameArray = await hidebug.dumpJsRawHeapData(false, false, false);
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0100 success and generated file path is ${filenameArray}`)
          expect(filenameArray.length).assertLarger(0);
          expect(filenameArray[0].length).assertLarger(0);
        }
        done();
      } catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0100 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testHidebugrawprocess_0200
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0200
     * @tc.desc   Test dumpJsRawHeapData(true, true, true) - GC, Clean, Process Dump
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrawprocess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/';
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          // needGC=true, needClean=true, processDump=true
          let filenameArray = await hidebug.dumpJsRawHeapData(true, true, true);
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0200 success and generated file path is ${filenameArray}`)
          expect(filenameArray.length).assertLarger(0);
          expect(filenameArray[0].length).assertLarger(0);
        }
        done();
      } catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0200 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testHidebugrawprocess_0300
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0300
     * @tc.desc   Test dumpJsRawHeapData(true, false, true) - GC, No Clean, Process Dump
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrawprocess_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/';
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          // needGC=true, needClean=false, processDump=true
          let filenameArray = await hidebug.dumpJsRawHeapData(true, false, true);
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0300 success and generated file path is ${filenameArray}`)
          expect(filenameArray.length).assertLarger(0);
          expect(filenameArray[0].length).assertLarger(0);
        }
        done();
      } catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0300 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testHidebugrawprocess_0400
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0400
     * @tc.desc   Test dumpJsRawHeapData(false, true, false) - No GC, Clean, Thread Only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrawprocess_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/';
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          // needGC=false, needClean=true, processDump=false
          let filenameArray = await hidebug.dumpJsRawHeapData(false, true, false);
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0400 success and generated file path is ${filenameArray}`)
          expect(filenameArray.length).assertLarger(0);
          expect(filenameArray[0].length).assertLarger(0);
        }
        done();
      } catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0400 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testHidebugrawprocess_0500
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0500
     * @tc.desc   Test dumpJsRawHeapData(true, false, false) - GC, No Clean, Thread Only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrawprocess_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/';
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          // needGC=true, needClean=false, processDump=false
          let filenameArray = await hidebug.dumpJsRawHeapData(true, false, false);
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0500 success and generated file path is ${filenameArray}`)
          expect(filenameArray.length).assertLarger(0);
          expect(filenameArray[0].length).assertLarger(0);
        }
        done();
      } catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0500 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testHidebugrawprocess_0600
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0600
     * @tc.desc   Test dumpJsRawHeapData(false, false, true) - No GC, No Clean, Process Dump
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrawprocess_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/';
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          // needGC=false, needClean=false, processDump=true
          let filenameArray = await hidebug.dumpJsRawHeapData(false, false, true);
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0600 success and generated file path is ${filenameArray}`)
          expect(filenameArray.length).assertLarger(0);
          expect(filenameArray[0].length).assertLarger(0);
        }
        done();
      } catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0600 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testHidebugrawprocess_0700
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0700
     * @tc.desc   Test error code 11400112 (Repeated data dump)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugrawprocess_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/';
        let freeSize = await statfs.getFreeSize(path);
        let options13: hidebug.GwpAsanOptions = {
          alwaysEnabled: true,
          isRecover: undefined
        };
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          hidebug.dumpJsRawHeapData(true, true, false).then((filePath: string[]) => {
            console.info(`Fire first dump success`)
          })
          await asyncSleep(200);
          let filename = await hidebug.dumpJsRawHeapData(true, true, false);
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0700 success (Repetition allowed or handled). Path: ${filename}`)
          done();
        }
        done();
      } catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0700 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        // 验证错误码 11400112
        expect((error as BusinessError).code == 11400112).assertTrue();
        await asyncSleep(5000); // 等待资源释放
        done();
      }
    })

    /**
     * @tc.name   testHidebugrawprocess_0800
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0800
     * @tc.desc   Test dumpJsRawHeapData(undefined, false, false) - undefined GC parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugrawprocess_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=undefined, needClean=false, processDump=false
       let filenameArray = await hidebug.dumpJsRawHeapData(undefined, false, false);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0800 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0800 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_0900
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_0900
     * @tc.desc   Test dumpJsRawHeapData(false, undefined, false) - undefined Clean parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=false, needClean=undefined, processDump=false
       let filenameArray = await hidebug.dumpJsRawHeapData(false, undefined, false);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_0900 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_0900 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_1000
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_1000
     * @tc.desc   Test dumpJsRawHeapData(false, false, undefined) - undefined Process parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=false, needClean=false, processDump=undefined
       let filenameArray = await hidebug.dumpJsRawHeapData(false, false, undefined);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_1000 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_1000 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_1100
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_1100
     * @tc.desc   Test dumpJsRawHeapData(null, false, false) - null GC parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=null, needClean=false, processDump=false
       let filenameArray = await hidebug.dumpJsRawHeapData(null, false, false);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_1100 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_1100 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_1200
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_1200
     * @tc.desc   Test dumpJsRawHeapData(false, null, false) - null Clean parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=false, needClean=null, processDump=false
       let filenameArray = await hidebug.dumpJsRawHeapData(false, null, false);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_1200 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_1200 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_1300
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_1300
     * @tc.desc   Test dumpJsRawHeapData(false, false, null) - null Process parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=false, needClean=false, processDump=null
       let filenameArray = await hidebug.dumpJsRawHeapData(false, false, null);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_1300 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_1300 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_1400
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_1400
     * @tc.desc   Test dumpJsRawHeapData(undefined, undefined, false) - Both undefined GC and Clean parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=undefined, needClean=undefined, processDump=false
       let filenameArray = await hidebug.dumpJsRawHeapData(undefined, undefined, false);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_1400 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_1400 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_1500
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_1500
     * @tc.desc   Test dumpJsRawHeapData(false, false, undefined) - Undefined Process parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=false, needClean=false, processDump=undefined
       let filenameArray = await hidebug.dumpJsRawHeapData(false, false, undefined);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_1500 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_1500 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_1600
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_1600
     * @tc.desc   Test dumpJsRawHeapData(null, null, false) - Both null GC and Clean parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=null, needClean=null, processDump=false
       let filenameArray = await hidebug.dumpJsRawHeapData(null, null, false);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_1600 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_1600 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

    /**
     * @tc.name   testHidebugrawprocess_1700
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Raw_1700
     * @tc.desc   Test dumpJsRawHeapData(false, false, null) - Null Process parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testHidebugrawprocess_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    try {
     let path: string = '/data/storage/el2/base/files/';
     let freeSize = await statfs.getFreeSize(path);
     if (freeSize > 30 * 1024 * 1024 * 1024) {
       // needGC=false, needClean=false, processDump=null
       let filenameArray = await hidebug.dumpJsRawHeapData(false, false, null);
       console.info(`SUB_DFX_DFR_Hidebug_Ets_Raw_1700 success and generated file path is ${filenameArray}`);
       expect(filenameArray.length).assertLarger(0);
     }
     done();
    } catch (error) {
     console.error(`SUB_DFX_DFR_Hidebug_Ets_Raw_1700 error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
     expect((error as BusinessError).code == 401).assertTrue(); // Expect INVALID_PARAM error code
     done();
    }
    })

  })
}
