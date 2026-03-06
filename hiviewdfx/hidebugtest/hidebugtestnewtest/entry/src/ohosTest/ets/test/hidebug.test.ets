/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import hidebug from '@ohos.hidebug'
import featureAbility from '@ohos.ability.featureAbility';
import fileIo from '@ohos.file.fs';
import fs from '@ohos.file.fs';
export default function HidebugTest() {
  describe('HidebugTest', () => {
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0001
     * @tc.desc   startProfiling函数的异常值覆盖,""//null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0001 start");
      try{
        hidebug.startProfiling(undefined);
        console.info("====> HidebugTest_0001 startProfiling undefined ");
        hidebug.stopProfiling();
        console.info("====> HidebugTest_0001 startProfiling undefined end");
        hidebug.startProfiling(null);
        console.info("====> HidebugTest_0001 startProfiling null ");
        hidebug.stopProfiling();
        console.info("====> HidebugTest_0001 startProfiling null end");
        hidebug.startProfiling("");
        console.info("====> HidebugTest_0001 startProfiling empty ");
        hidebug.stopProfiling();
        console.info("====> HidebugTest_0001 startProfiling empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0001 startProfiling catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0001 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0002
     * @tc.desc   dumpHeapData函数的异常值覆盖,""//null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0002 start");
      try{
        hidebug.dumpHeapData(undefined);
        console.info("====> HidebugTest_0002 dumpHeapData undefined");
        hidebug.dumpHeapData(null);
        console.info("====> HidebugTest_0002 dumpHeapData null end");
        hidebug.dumpHeapData("");
        console.info("====> HidebugTest_0002 dumpHeapData empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0002 dumpHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0002 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0003
     * @tc.desc   startJsCpuProfiling函数的异常值覆盖,""//null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0003 start");
      try{
        hidebug.startJsCpuProfiling(undefined);
        console.info("====> HidebugTest_0003 startJsCpuProfiling undefined ");
        hidebug.stopJsCpuProfiling();
        console.info("====> HidebugTest_0003 startJsCpuProfiling undefined end");
        hidebug.startJsCpuProfiling(null);
        console.info("====> HidebugTest_0003 startJsCpuProfiling null ");
        hidebug.stopJsCpuProfiling();
        console.info("====> HidebugTest_0003 startJsCpuProfiling null end");
        hidebug.startJsCpuProfiling("");
        console.info("====> HidebugTest_0003 startJsCpuProfiling empty ");
        hidebug.stopJsCpuProfiling();
        console.info("====> HidebugTest_0003 startJsCpuProfiling empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0003 startJsCpuProfiling catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0003 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0004
     * @tc.desc   dumpJsHeapData函数的异常值覆盖,""//null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0004 start");
      try{
        hidebug.dumpJsHeapData(undefined);
        console.info("====> HidebugTest_0004 dumpJsHeapData undefined");
        hidebug.dumpJsHeapData(null);
        console.info("====> HidebugTest_0004 dumpJsHeapData null end");
        hidebug.dumpJsHeapData("");
        console.info("====> HidebugTest_0004 dumpJsHeapData empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0004 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0004 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0014
     * @tc.desc   getServiceDump函数的异常值覆盖,第1个参数的null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0014 start");
      let path: string = "/data/storage/el2/base/files/serviceInfo1.txt";
      let file = fileIo.openSync(path, 0o102);
      let args: Array<string> = new Array("allInfo");
      try {
        hidebug.getServiceDump(null, file.fd, args);
        console.info("====> HidebugTest_0014 getServiceDump null");
        hidebug.getServiceDump(undefined, file.fd, args);
        console.info("====> HidebugTest_0014 getServiceDump undefined");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0014 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        done();
      }
      console.info("HidebugTest_0014 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0005
     * @tc.desc   getServiceDump函数的异常值覆盖,第2个参数的null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0005 start");
      let serviceId: number = 10;
      let args: Array<string> = new Array("allInfo");
      try {
        hidebug.getServiceDump(serviceId, null, args);
        console.info("====> HidebugTest_0005 getServiceDump null");
        hidebug.getServiceDump(serviceId, undefined, args);
        console.info("====> HidebugTest_0005 getServiceDump undefined");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0005 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        done();
      }
      console.info("HidebugTest_0005 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0015
     * @tc.desc   getServiceDump函数的异常值覆盖,第3个参数的null/undefined覆盖,空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0015 start");
      let path: string = "/data/storage/el2/base/files/serviceInfo1.txt";
      let file = fileIo.openSync(path, 0o102);
      let serviceId: number = 10;
      let args = [];
      try {
        hidebug.getServiceDump(serviceId, file.fd, null);
        console.info("====> HidebugTest_0015 getServiceDump null");
        hidebug.getServiceDump(serviceId, file.fd, undefined);
        console.info("====> HidebugTest_0015 getServiceDump undefined");
        hidebug.getServiceDump(serviceId, file.fd, args);
        console.info("====> HidebugTest_0015 getServiceDump empty");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0015 getServiceDump catch > error code: ${error.code}, error msg: ${error.message}`)
        done();
      }
      console.info("HidebugTest_0015 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0006
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第一个参数的null/undefined/空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HidebugTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        let flag = hidebug.TraceFlag.ALL_THREADS;
        let limit_size = 1024 * 1024;
        let path1 = hidebug.startAppTraceCapture(undefined, flag, limit_size);
        console.info("====> HidebugTest_0006 startAppTraceCapture undefined ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0006 startAppTraceCapture undefined end");
        let path2 = hidebug.startAppTraceCapture(null, flag, limit_size);
        console.info("====> HidebugTest_0006 startAppTraceCapture null ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0006 startAppTraceCapture null end");
        let tag = [];
        let path3 = hidebug.startAppTraceCapture(tag, flag, limit_size);
        console.info("====> HidebugTest_0006 startAppTraceCapture empty ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0006 startAppTraceCapture empty end");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0006 startAppTraceCapture catch > error code: ${error.code}, error msg: ${error.message}`)
        done();
      }
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0007
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第3个参数的null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HidebugTest_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      try {
        let flag = hidebug.TraceFlag.ALL_THREADS;
        let tag = [hidebug.tags.ABILITY_MANAGER];
        let path1 = hidebug.startAppTraceCapture(tag, flag, undefined);
        console.info("====> HidebugTest_0007 startAppTraceCapture undefined ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0007 startAppTraceCapture undefined end");
        let path2 = hidebug.startAppTraceCapture(tag, flag, null);
        console.info("====> HidebugTest_0007 startAppTraceCapture null ");
        hidebug.stopAppTraceCapture();
        console.info("====> HidebugTest_0007 startAppTraceCapture null end");
        done();
      } catch (error) {
        console.error(`====>HidebugTest_0007 startAppTraceCapture catch > error code: ${error.code}, error msg: ${error.message}`)
        done();
      }
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0008
     * @tc.desc   getVMRuntimeStat函数的异常值覆盖,""//null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0008 start");
      try{
        hidebug.getVMRuntimeStat(undefined);
        console.info("====> HidebugTest_0008 getVMRuntimeStat undefined");
        hidebug.getVMRuntimeStat(null);
        console.info("====> HidebugTest_0008 getVMRuntimeStat null end");
        hidebug.getVMRuntimeStat("");
        console.info("====> HidebugTest_0008 getVMRuntimeStat empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0008 getVMRuntimeStat catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0008 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0009
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第1个参数的""//null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0009 start");
      try{
        let value = 85;
        let enabledDebugLog = true;
        hidebug.setAppResourceLimit(undefined, value, enabledDebugLog);
        console.info("====> HidebugTest_0009 setAppResourceLimit undefined");
        hidebug.setAppResourceLimit(null, value, enabledDebugLog);
        console.info("====> HidebugTest_0009 setAppResourceLimit null end");
        hidebug.setAppResourceLimit("", value, enabledDebugLog);
        console.info("====> HidebugTest_0009 setAppResourceLimit empty end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0009 setAppResourceLimit catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0009 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0010
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第2个参数的/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0010 start");
      try{
        let type = 'js_heap';
        let enabledDebugLog = true;
        hidebug.setAppResourceLimit(type, undefined, enabledDebugLog);
        console.info("====> HidebugTest_0010 dumpJsHeapData undefined");
        hidebug.setAppResourceLimit(type, null, enabledDebugLog);
        console.info("====> HidebugTest_0010 dumpJsHeapData null end");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0010 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0010 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0011
     * @tc.desc   dumpJsRawHeapData函数的值覆盖,第1个参数的/true/false覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0011 start");
      try{
        hidebug.dumpJsRawHeapData(true);
        console.info("====> HidebugTest_0011 dumpJsHeapData true");
        hidebug.dumpJsRawHeapData(false);
        console.info("====> HidebugTest_0011 dumpJsHeapData false");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0011 dumpJsHeapData catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0011 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0012
     * @tc.desc   enableGwpAsanGrayscale函数的值覆盖,第1个参数的/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0012 start");
      try{
        hidebug.enableGwpAsanGrayscale(null, 10);
        console.info("====> HidebugTest_0012 enableGwpAsanGrayscale null");
        hidebug.enableGwpAsanGrayscale(undefined, 10);
        console.info("====> HidebugTest_0012 enableGwpAsanGrayscale undefined");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0012 enableGwpAsanGrayscale catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0012 end");
    });
    /**
     * @tc.name   HidebugTest
     * @tc.number HidebugTest_0013
     * @tc.desc   enableGwpAsanGrayscale函数的值覆盖,第2个参数的/null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("HidebugTest_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("HidebugTest_0013 start");
      try{
        let options1: hidebug.GwpAsanOptions = {
          alwaysEnabled: true,
          sampleRate: 5000,
          maxSimutaneousAllocations: 5000,
        };
        hidebug.enableGwpAsanGrayscale(options1, null);
        console.info("====> HidebugTest_0013 enableGwpAsanGrayscale null");
        hidebug.enableGwpAsanGrayscale(options1, undefined);
        console.info("====> HidebugTest_0013 enableGwpAsanGrayscale undefined");
        done();
      }catch(err){
        console.error(`====>HidebugTest_0013 enableGwpAsanGrayscale catch > error code: ${err.code}, error msg: ${err.message}`)
        done();
      }
      console.info("HidebugTest_0013 end");
    });
  })
}
