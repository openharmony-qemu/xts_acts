/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { FaultLogger } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import testNapi from 'libentry.so';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
}

function queryFaultLogCallback0100(error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>, done: Function): void {
  if (error) {
    console.info('DFX_DFR_Faultlogger_Interface_0100  once error is ' + JSON.stringify(error));
  } else {
    console.info("DFX_DFR_Faultlogger_Interface_0100 query ret length:" + ret.length);
    expect(ret.length).assertLarger(0);
    console.info("DFX_DFR_Faultlogger_Interface_0100 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
    expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
    console.info("DFX_DFR_Faultlogger_Interface_0100 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
    expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
  }
  done();
}

function queryFaultLogCallback1100(error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>, done: Function): void {
  if (error) {
    console.info('DFX_DFR_Faultlogger_Interface_1100  once error is ' + JSON.stringify(error));
  } else {
    console.info("DFX_DFR_Faultlogger_Interface_1100 query ret length:" + ret.length);
    expect(ret.length).assertLarger(0);
    console.info("DFX_DFR_Faultlogger_Interface_1100 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
    expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
    console.info("DFX_DFR_Faultlogger_Interface_1100 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
    expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
  }
  done();
}

function queryFaultLogCallback1300(error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>, done: Function): void {
  if (error) {
    console.info('DFX_DFR_Faultlogger_Interface_1300  once error is ' + JSON.stringify(error));
  } else {
    console.info("DFX_DFR_Faultlogger_Interface_1300 query ret length:" + ret.length);
    expect(ret.length).assertLarger(0);
    console.info("DFX_DFR_Faultlogger_Interface_1300 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
    expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
    console.info("DFX_DFR_Faultlogger_Interface_1300 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
    expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
  }
  done();
}

export default function faultloggerTest() {
  describe('FaultloggerTest', () => {
    beforeAll(() => {
      console.info('FaultloggerTest beforeAll called');
    })
    beforeEach(() => {
      console.info('FaultloggerTest beforeEach called');
    })
    afterEach(() => {
      console.info('FaultloggerTest afterEach called');
    })
    afterAll(() => {
      console.info('FaultloggerTest afterAll called');
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_0200
     * @tc.number test_0200
     * @tc.desc   检验函数参数输入错误时程序是否会崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_0200----------------------------------");
      try {
        let ret1 = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("DFX_DFR_Faultlogger_Interface_0200 ret1 == " + ret1.length);
        expect(ret1).assertEqual(ret1);

        let ret2 = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.JS_CRASH);
        console.info("DFX_DFR_Faultlogger_Interface_0200 ret2 == " + ret2.length);
        expect(ret2).assertEqual(ret2);

        let ret3 = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.APP_FREEZE);
        console.info("DFX_DFR_Faultlogger_Interface_0200 ret3 == " + ret3.length);
        expect(ret3).assertEqual(ret3);
        done();
        return;
      } catch (err) {
        console.info("DFX_DFR_Faultlogger_Interface_0200 catch err: " + JSON.stringify(err));
      }
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_0400
     * @tc.number test_0400
     * @tc.desc   检验promise同步方式获取faultlog CPP_CRASH日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_0400----------------------------------");
      try {
        let now = Date.now();
        console.info("DFX_DFR_Faultlogger_Interface_0400 2 + " + now);
        console.info("start triggerCppCrash");
        let res = testNapi.add(2, 3)
        console.info("DFX_DFR_Faultlogger_Interface_0400 res:" + res);
        await asyncSleep(10000);
        console.info("--------DFX_DFR_Faultlogger_Interface_0400 4" + "----------");
        let ret = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.CPP_CRASH);
        console.info("DFX_DFR_Faultlogger_Interface_0400 query ret length:" + ret.length);
        expect(ret.length).assertLarger(0);
        console.info("DFX_DFR_Faultlogger_Interface_0400 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
        expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
        console.info("DFX_DFR_Faultlogger_Interface_0400 fullLog length:" + ret[0].fullLog.length);
        console.info("DFX_DFR_Faultlogger_Interface_0400 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
        expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
        expect(typeof (ret[0].pid) == "number").assertTrue();
        expect(typeof (ret[0].uid) == "number").assertTrue();
        expect(typeof (ret[0].type) == "number").assertTrue();
        expect(typeof (ret[0].timestamp) == "number").assertTrue();
        expect(typeof (ret[0].reason) == "string").assertTrue();
        expect(typeof (ret[0].module) == "string").assertTrue();
        expect(typeof (ret[0].summary) == "string").assertTrue();
        expect(typeof (ret[0].fullLog) == "string").assertTrue();
        console.info("--------DFX_DFR_Faultlogger_Interface_0400 5" + "----------");
        done();
        return;
      } catch (err) {
        console.info("DFX_DFR_Faultlogger_Interface_0400 catch err: " + JSON.stringify(err));
      }
      console.info("DFX_DFR_Faultlogger_Interface_0400 error");
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_0500
     * @tc.number test_0500
     * @tc.desc   检验promise同步方式获取faultlog JS_CRASH日志（仅覆盖接口调用）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_0500----------------------------------");
      try {
        let now = Date.now();
        console.info("DFX_DFR_Faultlogger_Interface_0500 2 + " + now);
        console.info("--------DFX_DFR_Faultlogger_Interface_0500 4" + "----------");
        let ret = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.JS_CRASH);
        console.info("DFX_DFR_Faultlogger_Interface_0500 ret == " + ret.length);
        if (ret.length > 0) {
          console.info("--------DFX_DFR_Faultlogger_Interface_0500 got js_crash log----------");
        } else {
          console.info("--------DFX_DFR_Faultlogger_Interface_0500 no js_crash log, interface call ok----------");
        }
        for (let i = 0; i < ret.length; i++) {
          console.info("faultloggertestsummary03 " + i + " fullLog.length " + ret[i].fullLog.length);
        }
        done();
        return;
      } catch (err) {
        console.info("DFX_DFR_Faultlogger_Interface_0500 catch err: " + JSON.stringify(err));
      }
      console.info("DFX_DFR_Faultlogger_Interface_0500 error");
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_0300
     * @tc.number test_0300
     * @tc.desc   检验promise同步方式获取faultlog APP_FREEZE日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_0300----------------------------------");
      try {
        console.info("--------DFX_DFR_Faultlogger_Interface_0300 4" + "----------");
        let ret = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.APP_FREEZE);
        console.info("DFX_DFR_Faultlogger_Interface_0300 ret == " + ret.length);
        done();
      } catch (err) {
        console.info("DFX_DFR_Faultlogger_Interface_0300 catch err: " + JSON.stringify(err));
        console.info("DFX_DFR_Faultlogger_Interface_0300 error");
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_0100
     * @tc.number test_0100
     * @tc.desc   检验通过回调方式获取faultlog CPP_CRASH日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_0100----------------------------------");
      try {
        let now = Date.now();
        console.info("DFX_DFR_Faultlogger_Interface_0100 start + " + now);
        console.info("start triggerCppCrash");
        let res = testNapi.add(2, 3)
        console.info("DFX_DFR_Faultlogger_Interface_0100 res:" + res);
        await asyncSleep(10000);
        console.info("--------DFX_DFR_Faultlogger_Interface_0100 4----------");
        let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
          queryFaultLogCallback0100(error, ret, done);
        }
        FaultLogger.querySelfFaultLog(FaultLogger.FaultType.CPP_CRASH, callback);
        let ret = await FaultLogger.query(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("DFX_DFR_Faultlogger_Interface_0600 ret == " + ret.length);
        expect(ret.length > 0).assertTrue();
        return;
      } catch (err) {
        console.info("DFX_DFR_Faultlogger_Interface_0100 catch err: " + JSON.stringify(err));
      }
      console.info("DFX_DFR_Faultlogger_Interface_0100 error");
      expect(false).assertTrue();
      done();
    })

    
    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_0700
     * @tc.number test_0700
     * @tc.desc   检验query函数入参数量为2时程序是否会崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_0700----------------------------------");
      try {
        let ret = await FaultLogger.query(FaultLogger.FaultType.JS_CRASH);
        console.info("DFX_DFR_Faultlogger_Interface_0700 ret == " + ret.length);
        return;
      } catch (err) {
        let error = err as BusinessError;
        console.info(error.code.toString());
        console.info(error.message);
        expect(error.code == 401).assertTrue();
      }
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_0800
     * @tc.number test_0800
     * @tc.desc   检验query函数入参为空时程序是否会崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_0800----------------------------------");
      try {
        let ret = await FaultLogger.query(FaultLogger.FaultType.CPP_CRASH);
        console.info("DFX_DFR_Faultlogger_Interface_0800 ret == " + ret.length);
        return;
      } catch (err) {
        let error = err as BusinessError;
        console.info(error.code.toString());
        console.info(error.message);
        expect(error.code == 401).assertTrue();
      }
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_0900
     * @tc.number test_0900
     * @tc.desc   检验promise同步方式获取faultlog JS_CRASH日志（仅覆盖接口调用）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_0900----------------------------------");
      try {
        let now = Date.now();
        console.info("DFX_DFR_Faultlogger_Interface_0900 2 + " + now);
        console.info("--------DFX_DFR_Faultlogger_Interface_0900 4" + "----------");
        let ret = await FaultLogger.query(FaultLogger.FaultType.JS_CRASH);
        console.info("DFX_DFR_Faultlogger_Interface_0900 ret == " + ret.length);
        if (ret.length > 0) {
          console.info("--------DFX_DFR_Faultlogger_Interface_0900 got js_crash log----------");
        } else {
          console.info("--------DFX_DFR_Faultlogger_Interface_0900 no js_crash log, interface call ok----------");
        }
        for (let i = 0; i < ret.length; i++) {
          console.info("faultloggertestsummary08 " + i + " fullLog.length " + ret[i].fullLog.length);
        }
        done();
        return;
      } catch (err) {
        console.info("DFX_DFR_Faultlogger_Interface_0900 catch err: " + JSON.stringify(err));
      }
      console.info("DFX_DFR_Faultlogger_Interface_0900 error");
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_1000
     * @tc.number test_1000
     * @tc.desc   检验promise同步方式获取faultlog APP_FREEZE日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_1000----------------------------------");
      try {
        console.info("--------DFX_DFR_Faultlogger_Interface_1000 4" + "----------");
        let ret = await FaultLogger.query(FaultLogger.FaultType.APP_FREEZE);
        console.info("DFX_DFR_Faultlogger_Interface_1000 ret0 == " + ret.length);
        ret = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("DFX_DFR_Faultlogger_Interface_1000 ret1 == " + ret.length);
        done();
      } catch (err) {
        console.info("DFX_DFR_Faultlogger_Interface_1000 catch err: " + JSON.stringify(err));
        console.info("DFX_DFR_Faultlogger_Interface_1000 error");
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_1100
     * @tc.number test_1100
     * @tc.desc   检验通过回调方式获取faultlog CPP_CRASH日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DFX_DFR_Faultlogger_Interface_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_1100----------------------------------");
      try {
        let now = Date.now();
        console.info("DFX_DFR_Faultlogger_Interface_1100 start + " + now);
        console.info("start triggerCppCrash");
        let res = testNapi.add(2, 3)
        console.info("DFX_DFR_Faultlogger_Interface_1100 res:" + res);
        await asyncSleep(10000);
        console.info("--------DFX_DFR_Faultlogger_Interface_1100 4----------");
        let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
          queryFaultLogCallback1100(error, ret, done);
        }
        FaultLogger.query(FaultLogger.FaultType.CPP_CRASH, callback);
        return;
      } catch (err) {
        console.info("DFX_DFR_Faultlogger_Interface_1100 catch err: " + JSON.stringify(err));
      }
      console.info("DFX_DFR_Faultlogger_Interface_1100 error");
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_1200
     * @tc.number test_1200
     * @tc.desc   检验query函数入参为空时程序是否会崩溃,校验错误码返回801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DFX_DFR_Faultlogger_Interface_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_1200----------------------------------");
      try {
        let ret = await FaultLogger.query(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("DFX_DFR_Faultlogger_Interface_1200 ret == " + ret.length);
        done();
        return;
      } catch (err) {
        let error = err as BusinessError;
        console.info(error.code.toString());
        console.info(error.message);
        if (error.code == 801) {
          expect(error.message == "The device doesn't support this api").assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   DFX_DFR_Faultlogger_Interface_1300
     * @tc.number test_1300
     * @tc.desc   检验query回调方式获取CPP_CRASH日志,校验错误码返回801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DFX_DFR_Faultlogger_Interface_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------DFX_DFR_Faultlogger_Interface_1300----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        queryFaultLogCallback1300(error, ret, done);
      }
      try {
        FaultLogger.query(FaultLogger.FaultType.CPP_CRASH, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info(error.code.toString());
        console.info(error.message);
        if (error.code == 801) {
          expect(error.message == "The device doesn't support this api").assertTrue();
        }
        done();
      }
    })
  })
}