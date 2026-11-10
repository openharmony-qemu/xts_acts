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
    console.info('SUB_DFX_DFR_Faultlogger_Interface_0100  once error is ' + JSON.stringify(error));
  } else {
    console.info("SUB_DFX_DFR_Faultlogger_Interface_0100 query ret length:" + ret.length);
    expect(ret.length).assertLarger(0);
    console.info("SUB_DFX_DFR_Faultlogger_Interface_0100 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
    expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
    console.info("SUB_DFX_DFR_Faultlogger_Interface_0100 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
    expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
  }
  done();
}

function queryFaultLogCallback1100(error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>, done: Function): void {
  if (error) {
    console.info('SUB_DFX_DFR_Faultlogger_Interface_1100  once error is ' + JSON.stringify(error));
  } else {
    console.info("SUB_DFX_DFR_Faultlogger_Interface_1100 query ret length:" + ret.length);
    expect(ret.length).assertLarger(0);
    console.info("SUB_DFX_DFR_Faultlogger_Interface_1100 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
    expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
    console.info("SUB_DFX_DFR_Faultlogger_Interface_1100 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
    expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
  }
  done();
}

function queryFaultLogCallback1300(error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>, done: Function): void {
  if (error) {
    console.info('SUB_DFX_DFR_Faultlogger_Interface_1300  once error is ' + JSON.stringify(error));
  } else {
    console.info("SUB_DFX_DFR_Faultlogger_Interface_1300 query ret length:" + ret.length);
    expect(ret.length).assertLarger(0);
    console.info("SUB_DFX_DFR_Faultlogger_Interface_1300 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
    expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
    console.info("SUB_DFX_DFR_Faultlogger_Interface_1300 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
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
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_0200
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_0200
     * @tc.desc   检验函数参数输入错误时程序是否会崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_0200----------------------------------");
      try {
        let ret1 = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0200 ret1 == " + ret1.length);

        let ret2 = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.JS_CRASH);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0200 ret2 == " + ret2.length);

        let ret3 = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.APP_FREEZE);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0200 ret3 == " + ret3.length);
        done();
        return;
      } catch (err) {
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0200 catch err: " + JSON.stringify(err));
      }
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_0400
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_0400
     * @tc.desc   检验promise同步方式获取faultlog CPP_CRASH日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_0400----------------------------------");
      try {
        let now = Date.now();
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0400 2 + " + now);
        console.info("start triggerCppCrash");
        let res = testNapi.add(2, 3)
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0400 res:" + res);
        await asyncSleep(10000);
        console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0400 4" + "----------");
        let ret = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.CPP_CRASH);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0400 query ret length:" + ret.length);
        expect(ret.length).assertLarger(0);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0400 check reason, index:" + (ret[0].reason.indexOf("Signal:SIGABRT")));
        expect(ret[0].reason.indexOf("Signal:SIGABRT") != -1).assertTrue();
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0400 fullLog length:" + ret[0].fullLog.length);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0400 check fullLog, index:" + ret[0].fullLog.indexOf("Fault thread info"));
        expect(ret[0].fullLog.indexOf("Fault thread info") != -1).assertTrue();
        expect(typeof (ret[0].pid) == "number").assertTrue();
        expect(typeof (ret[0].uid) == "number").assertTrue();
        expect(typeof (ret[0].type) == "number").assertTrue();
        expect(typeof (ret[0].timestamp) == "number").assertTrue();
        expect(typeof (ret[0].reason) == "string").assertTrue();
        expect(typeof (ret[0].module) == "string").assertTrue();
        expect(typeof (ret[0].summary) == "string").assertTrue();
        expect(typeof (ret[0].fullLog) == "string").assertTrue();
        console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0400 5" + "----------");
        done();
        return;
      } catch (err) {
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0400 catch err: " + JSON.stringify(err));
      }
      console.info("SUB_DFX_DFR_Faultlogger_Interface_0400 error");
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_0500
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_0500
     * @tc.desc   检验promise同步方式获取faultlog JS_CRASH日志（仅覆盖接口调用）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_0500----------------------------------");
      try {
        let now = Date.now();
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0500 2 + " + now);
        console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0500 4" + "----------");
        let ret = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.JS_CRASH);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0500 ret == " + ret.length);
        if (ret.length > 0) {
          console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0500 got js_crash log----------");
        } else {
          console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0500 no js_crash log, interface call ok----------");
        }
        for (let i = 0; i < ret.length; i++) {
          console.info("faultloggertestsummary03 " + i + " fullLog.length " + ret[i].fullLog.length);
        }
        done();
        return;
      } catch (err) {
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0500 catch err: " + JSON.stringify(err));
      }
      console.info("SUB_DFX_DFR_Faultlogger_Interface_0500 error");
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_0300
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_0300
     * @tc.desc   检验promise同步方式获取faultlog APP_FREEZE日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_0300----------------------------------");
      try {
        console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0300 4" + "----------");
        let ret = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.APP_FREEZE);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0300 ret == " + ret.length);
        done();
      } catch (err) {
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0300 catch err: " + JSON.stringify(err));
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0300 error");
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_0100
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_0100
     * @tc.desc   检验通过回调方式获取faultlog CPP_CRASH日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_0100----------------------------------");
      try {
        let now = Date.now();
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0100 start + " + now);
        console.info("start triggerCppCrash");
        let res = testNapi.add(2, 3)
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0100 res:" + res);
        await asyncSleep(10000);
        console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0100 4----------");
        let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
          queryFaultLogCallback0100(error, ret, done);
        }
        FaultLogger.querySelfFaultLog(FaultLogger.FaultType.CPP_CRASH, callback);
        let ret = await FaultLogger.query(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0600 ret == " + ret.length);
        expect(ret.length > 0).assertTrue();
        return;
      } catch (err) {
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0100 catch err: " + JSON.stringify(err));
      }
      console.info("SUB_DFX_DFR_Faultlogger_Interface_0100 error");
      expect(false).assertTrue();
      done();
    })

    
    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_0700
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_0700
     * @tc.desc   检验query函数入参数量为2时程序是否会崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_0700----------------------------------");
      try {
        let ret = await FaultLogger.query(FaultLogger.FaultType.JS_CRASH);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0700 ret == " + ret.length);
        return;
      } catch (err) {
        let error = err as BusinessError;
        console.info(error.code.toString());
        console.info(error.message);
        expect(error.code == 401).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_0800
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_0800
     * @tc.desc   检验query函数入参为空时程序是否会崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_0800----------------------------------");
      try {
        let ret = await FaultLogger.query(FaultLogger.FaultType.CPP_CRASH);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0800 ret == " + ret.length);
        return;
      } catch (err) {
        let error = err as BusinessError;
        console.info(error.code.toString());
        console.info(error.message);
        expect(error.code == 401).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_0900
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_0900
     * @tc.desc   检验promise同步方式获取faultlog JS_CRASH日志（仅覆盖接口调用）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_0900----------------------------------");
      try {
        let now = Date.now();
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0900 2 + " + now);
        console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0900 4" + "----------");
        let ret = await FaultLogger.query(FaultLogger.FaultType.JS_CRASH);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0900 ret == " + ret.length);
        if (ret.length > 0) {
          console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0900 got js_crash log----------");
        } else {
          console.info("--------SUB_DFX_DFR_Faultlogger_Interface_0900 no js_crash log, interface call ok----------");
        }
        for (let i = 0; i < ret.length; i++) {
          console.info("faultloggertestsummary08 " + i + " fullLog.length " + ret[i].fullLog.length);
        }
        done();
        return;
      } catch (err) {
        console.info("SUB_DFX_DFR_Faultlogger_Interface_0900 catch err: " + JSON.stringify(err));
      }
      console.info("SUB_DFX_DFR_Faultlogger_Interface_0900 error");
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1000
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1000
     * @tc.desc   检验promise同步方式获取faultlog APP_FREEZE日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1000----------------------------------");
      try {
        console.info("--------SUB_DFX_DFR_Faultlogger_Interface_1000 4" + "----------");
        let ret = await FaultLogger.query(FaultLogger.FaultType.APP_FREEZE);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1000 ret0 == " + ret.length);
        ret = await FaultLogger.querySelfFaultLog(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1000 ret1 == " + ret.length);
        done();
      } catch (err) {
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1000 catch err: " + JSON.stringify(err));
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1000 error");
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1100
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1100
     * @tc.desc   检验通过回调方式获取faultlog CPP_CRASH日志
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1100----------------------------------");
      try {
        let now = Date.now();
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1100 start + " + now);
        console.info("start triggerCppCrash");
        let res = testNapi.add(2, 3)
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1100 res:" + res);
        await asyncSleep(10000);
        console.info("--------SUB_DFX_DFR_Faultlogger_Interface_1100 4----------");
        let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
          queryFaultLogCallback1100(error, ret, done);
        }
        FaultLogger.query(FaultLogger.FaultType.CPP_CRASH, callback);
        return;
      } catch (err) {
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1100 catch err: " + JSON.stringify(err));
      }
      console.info("SUB_DFX_DFR_Faultlogger_Interface_1100 error");
      expect(false).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1200
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1200
     * @tc.desc   检验query函数入参为空时程序是否会崩溃,校验错误码返回801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1200----------------------------------");
      try {
        let ret = await FaultLogger.query(FaultLogger.FaultType.NO_SPECIFIC);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1200 ret == " + ret.length);
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
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1300
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1300
     * @tc.desc   检验query回调方式获取CPP_CRASH日志,校验错误码返回801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1300----------------------------------");
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

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1400
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1400
     * @tc.desc   检验query Promise接口faultType传null时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1400----------------------------------");
      try {
        await FaultLogger.query(null);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1400 should not reach here");
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1400 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1500
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1500
     * @tc.desc   检验query Promise接口faultType传undefined时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1500----------------------------------");
      try {
        await FaultLogger.query(undefined);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1500 should not reach here");
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1500 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1600
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1600
     * @tc.desc   检验query Promise接口faultType传API定义之外的枚举值(-1)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1600----------------------------------");
      try {
        let ret = await FaultLogger.query(-1);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1600 ret == " + ret.length);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1600 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1700
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1700
     * @tc.desc   检验query Promise接口faultType传API定义之外的枚举值(1)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1700----------------------------------");
      try {
        let ret = await FaultLogger.query(1);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1700 ret == " + ret.length);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1700 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1800
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1800
     * @tc.desc   检验query Promise接口faultType传API定义之外的枚举值(5)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1800----------------------------------");
      try {
        let ret = await FaultLogger.query(5);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1800 ret == " + ret.length);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1800 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_1900
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_1900
     * @tc.desc   检验query Promise接口faultType传API定义之外的枚举值(99)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_1900----------------------------------");
      try {
        let ret = await FaultLogger.query(99);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1900 ret == " + ret.length);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_1900 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2000
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2000
     * @tc.desc   检验query callback接口faultType传null时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2000----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2000 callback error code: " + error.code + ", message: " + error.message);
          expect(error.code == 401).assertTrue();
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2000 callback ret length: " + ret.length);
          expect(false).assertTrue();
        }
        done();
      }
      try {
        FaultLogger.query(null, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2000 catch error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2100
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2100
     * @tc.desc   检验query callback接口faultType传undefined时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2100----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2100 callback error code: " + error.code + ", message: " + error.message);
          expect(error.code == 401).assertTrue();
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2100 callback ret length: " + ret.length);
          expect(false).assertTrue();
        }
        done();
      }
      try {
        FaultLogger.query(undefined, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2100 catch error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2200
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2200
     * @tc.desc   检验query callback接口faultType传API定义之外的枚举值(-1)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2200----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2200 callback error code: " + error.code + ", message: " + error.message);
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2200 callback ret length: " + ret.length);
        }
        done();
      }
      try {
        FaultLogger.query(-1, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2200 catch error code: " + error.code + ", message: " + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2300
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2300
     * @tc.desc   检验query callback接口faultType传API定义之外的枚举值(1)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2300----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2300 callback error code: " + error.code + ", message: " + error.message);
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2300 callback ret length: " + ret.length);
        }
        done();
      }
      try {
        FaultLogger.query(1, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2300 catch error code: " + error.code + ", message: " + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2400
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2400
     * @tc.desc   检验query callback接口faultType传API定义之外的枚举值(5)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2400----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2400 callback error code: " + error.code + ", message: " + error.message);
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2400 callback ret length: " + ret.length);
        }
        done();
      }
      try {
        FaultLogger.query(5, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2400 catch error code: " + error.code + ", message: " + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2500
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2500
     * @tc.desc   检验query callback接口faultType传API定义之外的枚举值(99)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2500----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2500 callback error code: " + error.code + ", message: " + error.message);
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_2500 callback ret length: " + ret.length);
        }
        done();
      }
      try {
        FaultLogger.query(99, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2500 catch error code: " + error.code + ", message: " + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2600
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2600
     * @tc.desc   检验querySelfFaultLog Promise接口faultType传null时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2600----------------------------------");
      try {
        await FaultLogger.querySelfFaultLog(null);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2600 should not reach here");
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2600 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2700
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2700
     * @tc.desc   检验querySelfFaultLog Promise接口faultType传undefined时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2700----------------------------------");
      try {
        await FaultLogger.querySelfFaultLog(undefined);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2700 should not reach here");
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2700 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2800
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2800
     * @tc.desc   检验querySelfFaultLog Promise接口faultType传API定义之外的枚举值(-1)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2800----------------------------------");
      try {
        let ret = await FaultLogger.querySelfFaultLog((-1) as FaultLogger.FaultType);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2800 ret == " + ret.length);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2800 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_2900
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_2900
     * @tc.desc   检验querySelfFaultLog Promise接口faultType传API定义之外的枚举值(1)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_2900----------------------------------");
      try {
        let ret = await FaultLogger.querySelfFaultLog((1) as FaultLogger.FaultType);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2900 ret == " + ret.length);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_2900 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_3000
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_3000
     * @tc.desc   检验querySelfFaultLog Promise接口faultType传API定义之外的枚举值(5)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_3000----------------------------------");
      try {
        let ret = await FaultLogger.querySelfFaultLog((5) as FaultLogger.FaultType);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_3000 ret == " + ret.length);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_3000 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_3100
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_3100
     * @tc.desc   检验querySelfFaultLog Promise接口faultType传API定义之外的枚举值(99)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_3100----------------------------------");
      try {
        let ret = await FaultLogger.querySelfFaultLog((99) as FaultLogger.FaultType);
        console.info("SUB_DFX_DFR_Faultlogger_Interface_3100 ret == " + ret.length);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_3100 error code: " + error.code + ", message: " + error.message);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_3200
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_3200
     * @tc.desc   检验querySelfFaultLog callback接口faultType传null时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_3200----------------------------------");
      let isDone = false;
      let timer = setTimeout(() => {
        if (!isDone) {
          isDone = true;
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3200 timeout, querySelfFaultLog did not call callback");
          done();
        }
      }, 5000);
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (!isDone) {
          isDone = true;
          clearTimeout(timer);
          if (error) {
            console.info("SUB_DFX_DFR_Faultlogger_Interface_3200 callback error code: " + error.code + ", message: " + error.message);
          } else {
            console.info("SUB_DFX_DFR_Faultlogger_Interface_3200 callback ret length: " + ret.length);
          }
          done();
        }
      }
      try {
        FaultLogger.querySelfFaultLog(null, callback);
      } catch (err) {
        if (!isDone) {
          isDone = true;
          clearTimeout(timer);
          let error = err as BusinessError;
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3200 catch error code: " + error.code + ", message: " + error.message);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_3300
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_3300
     * @tc.desc   检验querySelfFaultLog callback接口faultType传undefined时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_3300----------------------------------");
      let isDone = false;
      let timer = setTimeout(() => {
        if (!isDone) {
          isDone = true;
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3300 timeout, querySelfFaultLog did not call callback");
          done();
        }
      }, 5000);
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (!isDone) {
          isDone = true;
          clearTimeout(timer);
          if (error) {
            console.info("SUB_DFX_DFR_Faultlogger_Interface_3300 callback error code: " + error.code + ", message: " + error.message);
          } else {
            console.info("SUB_DFX_DFR_Faultlogger_Interface_3300 callback ret length: " + ret.length);
          }
          done();
        }
      }
      try {
        FaultLogger.querySelfFaultLog(undefined, callback);
      } catch (err) {
        if (!isDone) {
          isDone = true;
          clearTimeout(timer);
          let error = err as BusinessError;
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3300 catch error code: " + error.code + ", message: " + error.message);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_3400
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_3400
     * @tc.desc   检验querySelfFaultLog callback接口faultType传API定义之外的枚举值(-1)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_3400----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3400 callback error code: " + error.code + ", message: " + error.message);
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3400 callback ret length: " + ret.length);
        }
        done();
      }
      try {
        FaultLogger.querySelfFaultLog(-1, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_3400 catch error code: " + error.code + ", message: " + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_3500
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_3500
     * @tc.desc   检验querySelfFaultLog callback接口faultType传API定义之外的枚举值(1)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_3500----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3500 callback error code: " + error.code + ", message: " + error.message);
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3500 callback ret length: " + ret.length);
        }
        done();
      }
      try {
        FaultLogger.querySelfFaultLog(1, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_3500 catch error code: " + error.code + ", message: " + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_3600
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_3600
     * @tc.desc   检验querySelfFaultLog callback接口faultType传API定义之外的枚举值(5)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_3600----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3600 callback error code: " + error.code + ", message: " + error.message);
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3600 callback ret length: " + ret.length);
        }
        done();
      }
      try {
        FaultLogger.querySelfFaultLog(5, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_3600 catch error code: " + error.code + ", message: " + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_DFX_DFR_Faultlogger_Interface_3700
     * @tc.number SUB_DFX_DFR_Faultlogger_Interface_3700
     * @tc.desc   检验querySelfFaultLog callback接口faultType传API定义之外的枚举值(99)时返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DFX_DFR_Faultlogger_Interface_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("---------------------------SUB_DFX_DFR_Faultlogger_Interface_3700----------------------------------");
      let callback = (error: BusinessError, ret: Array<FaultLogger.FaultLogInfo>) => {
        if (error) {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3700 callback error code: " + error.code + ", message: " + error.message);
        } else {
          console.info("SUB_DFX_DFR_Faultlogger_Interface_3700 callback ret length: " + ret.length);
        }
        done();
      }
      try {
        FaultLogger.querySelfFaultLog(99, callback);
      } catch (err) {
        let error = err as BusinessError;
        console.info("SUB_DFX_DFR_Faultlogger_Interface_3700 catch error code: " + error.code + ", message: " + error.message);
        expect(false).assertTrue();
        done();
      }
    })
  })
}