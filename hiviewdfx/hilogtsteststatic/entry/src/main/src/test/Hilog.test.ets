'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "@ohos/hypium-binary/src/main/indexStatic";
import hilog from '@ohos.hilog'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HILOG_ANI_TEST'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function HilogTsTest() {
  describe('HilogTsTest', (): void => {
    beforeAll(():void => {
      hilog.info(domain, tag, 'beforeAll called');
    })

    afterAll(():void => {
      hilog.setMinLogLevel(hilog.LogLevel.INFO);
      hilog.info(domain, tag, 'afterAll called');
    })

    /**
     * @tc.name   testHilogTsApiStatic01
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic01 start');
      try{
        hilog.debug(0x0000, tag, "%{public}s", 'testHilogTsApiStatic01');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic01 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic01 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic02
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic02 start');
      try{
        hilog.info(0x3200, tag, "%{public}s", 'testHilogTsApiStatic02');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic02 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic02 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic03
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic03 start');
      try{
        hilog.warn(0x3200, tag, "%{public}s", 'testHilogTsApiStatic03');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic03 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic03 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic04
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic04 start');
      try{
        hilog.error(0x3200, tag, "%{public}s", 'testHilogTsApiStatic04');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic04 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic04 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic05
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic05 start');
      try{
        hilog.fatal(0x3200, tag, "%{public}s", 'testHilogTsApiStatic05');
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic05 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic05 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic06
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic06 start');
      try{
        hilog.info(0x3200, tag, "testHilogTsApiStatic06");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic06 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic06 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic07
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0700
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic07 start');
      try{
        hilog.info(0x3200, tag, "%{public}s", undefined);
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic07 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic07 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic08
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic08 start');
      try{
        let str: string = "a".repeat(4001) as string;
        hilog.info(0x3200, tag, "%{public}s", str);
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic08 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic08 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic09
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_0900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic09 start');
      try{
        hilog.info(0, tag, "%{public}s", "testHilogTsApiStatic09");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic09 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic09 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic10
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1000
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic10 start');
      try{
        hilog.info(0xffff, tag, "%{public}s", "testHilogTsApiStatic10");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic10 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic10 end');
    })


    /**
     * @tc.name   testHilogTsApiStatic11
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic11 start');
      try{
        hilog.info(0x3200, "中文测试", "%{public}s", "testHilogTsApiStatic11");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic11 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic11 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic12
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic12 start');
      try{
        hilog.info(0x3200, "1234", "%{public}s", "testHilogTsApiStatic12");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic12 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic12 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic13
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic13 start');
      try{
        let str: string = "a".repeat(33) as string;
        hilog.info(0x3200, tag + str, "%{public}s", "testHilogTsApiStatic13");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic13 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic13 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic14
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic14 start');
      const res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      hilog.info(domain, tag, 'testHilogTsApiStatic14 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic15
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic15 start');
      const res = hilog.isLoggable(0x3200, "", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      hilog.info(domain, tag, 'testHilogTsApiStatic15 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic16
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic16 start');
      const res = hilog.isLoggable(0x3200, "", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      hilog.info(domain, tag, 'testHilogTsApiStatic16 end');
    })

    /**
      * @tc.name   testHilogTsApiStatic17
      * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_Static_1700
      * @tc.desc   hilog begin interface test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('testHilogTsApiStatic17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic16 start');
      try{
        hilog.debug(0x0000, tag, "test hilog.debug() without parameter args");
        hilog.info(0x0000, tag, "test hilog.info() without parameter args");
        hilog.error(0x0000, tag, "test hilog.error() without parameter args");
        hilog.warn(0x0000, tag, "test hilog.warn() without parameter args");
        hilog.fatal(0x0000, tag, "test hilog.fatal() without parameter args");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic17 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic16 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic18
     * @tc.number SUB_DFX_DFT_Hiview_Libhilog_Hilog_Static_1800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic18 start');
      try{
        hilog.debug(domain, tag, "%{public}s World %{private}d",);
        hilog.info(domain, tag, "%{public}s World %{private}d", );
        hilog.error(domain, tag, "%{public}s World %{private}d",);
        hilog.warn(domain, tag, "%{public}s World %{private}d", );
        hilog.fatal(domain, tag,"%{public}s World %{private}d", );
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic18 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic18 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic19
     * @tc.number SUB_DFX_DFT_Hiview_Libhilog_Hilog_Static_1900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic19 start');
      try{
        hilog.debug(domain, tag, "%{public}s World %{private}d", undefined);
        hilog.info(domain, tag, "%{public}s World %{private}d", undefined);
        hilog.error(domain, tag, "%{public}s World %{private}d", undefined);
        hilog.warn(domain, tag, "%{public}s World %{private}d", undefined);
        hilog.fatal(domain, tag,"%{public}s World %{private}d", undefined);
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic19 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic19 end');
    })
    
    /**
     * @tc.name   testHilogTsApiStatic20
     * @tc.number SUB_DFX_DFT_Hiview_Libhilog_Hilog_Static_2000
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic20 start');
      try{
        hilog.debug(domain, "", "%{public}s World ", "testHilogTsApiStatic20");
        hilog.info(domain, "", "%{public}s World ", "testHilogTsApiStatic20");
        hilog.error(domain, "", "%{public}s World ", "testHilogTsApiStatic20");
        hilog.warn(domain, "", "%{public}s World ", "testHilogTsApiStatic20");
        hilog.fatal(domain, "","%{public}s World ", "testHilogTsApiStatic20");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic20 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic20 end');
    })

    /**
     * @tc.name   testHilogTsApiStatic21
     * @tc.number SUB_DFX_DFT_Hiview_Libhilog_Hilog_Static_2100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogTsApiStatic21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      hilog.info(domain, tag, 'testHilogTsApiStatic21 start');
      try{
        hilog.debug(domain, tag, "", "testHilogTsApiStatic21");
        hilog.info(domain, tag, "", "testHilogTsApiStatic21");
        hilog.error(domain, tag, "", "testHilogTsApiStatic21");
        hilog.warn(domain, tag, "", "testHilogTsApiStatic21");
        hilog.fatal(domain, tag,"", "testHilogTsApiStatic21");
      } catch (error){
        hilog.error(domain, tag, `testHilogTsApiStatic21 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      hilog.info(domain, tag, 'testHilogTsApiStatic21 end');
    })
    
    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0100
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.INFO);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.DEBUG);
      let res1 = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0200
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.WARN);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, tag, hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0300
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.ERROR);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, tag, hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0400
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.FATAL);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.ERROR);
      let res1 = hilog.isLoggable(0x3200, tag, hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0500
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.FATAL);
      let res = hilog.isLoggable(0x3200, tag, hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_Static_0600
     * @tc.number SUB_DFX_DFT_DefaultLevel_Static_0600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.ERROR);
      try{
        for (let index = 0; index < 1000; index++) {
          hilog.info(0x3200, tag, "%{public}s", 'hilogJs0100')
          hilog.error(0x3200, tag, "%{public}s", 'hilogJs0100')
        }
      } catch (error){
        hilog.error(domain, tag, `SUB_DFX_DFT_DefaultLevel_Static_0600 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_1700
     * @tc.number SUB_DFX_DFT_DefaultLevel_1700
     * @tc.desc   hilog新增向下调整日志级别接口-使用默认日志级别setLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.setLogLevel(hilog.LogLevel.WARN, hilog.PreferStrategy.UNSET_LOGLEVEL)
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(true);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_1800
     * @tc.number SUB_DFX_DFT_DefaultLevel_1800
     * @tc.desc   hilog新增向下调整日志级别接口-比较默认值和设置值后取较大值setLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.setLogLevel(hilog.LogLevel.WARN, hilog.PreferStrategy.PREFER_CLOSE_LOG)
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_1900
     * @tc.number SUB_DFX_DFT_DefaultLevel_1900
     * @tc.desc   hilog新增向下调整日志级别接口-比较默认值和设置值后取较小值setLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.setLogLevel(hilog.LogLevel.WARN, hilog.PreferStrategy.PREFER_OPEN_LOG)
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(true);
      expect(res1).assertEqual(true);
    })
    
    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_2400
     * @tc.number SUB_DFX_DFT_DefaultLevel_2400
     * @tc.desc   hilog调整日志级别接口后执行setMinLogLevel方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.setLogLevel(hilog.LogLevel.ERROR, hilog.PreferStrategy.PREFER_CLOSE_LOG)
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
      hilog.setMinLogLevel(hilog.LogLevel.WARN)
      let res2 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
      let res3 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res2).assertEqual(true);
      expect(res3).assertEqual(true);
    })

    /**
     * @tc.name   testHilogSetOutputType0100
     * @tc.number SUB_DFX_DFT_SetOutputType_0100
     * @tc.desc   hilog的SetOutputType方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.DEFAULT);
        hilog.info(0x0001, "testTag", 'set output type result:%{public}d', lastType);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputType0200
     * @tc.number SUB_DFX_DFT_SetOutputType_0200
     * @tc.desc   hilog的SetOutputType方法2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'private sandbox log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputType0300
     * @tc.number SUB_DFX_DFT_SetOutputType_0300
     * @tc.desc   hilog的SetOutputType方法3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'share sandbox log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputType0400
     * @tc.number SUB_DFX_DFT_SetOutputType_0400
     * @tc.desc   hilog的SetOutputType方法4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_WITH_CONSOLE);
        hilog.info(0x0001, "testTag", 'private sandbox with console log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputType0500
     * @tc.number SUB_DFX_DFT_SetOutputType_0500
     * @tc.desc   hilog的SetOutputType方法5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_WITH_CONSOLE);
        hilog.info(0x0001, "testTag", 'share sandbox with console log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputType0600
     * @tc.number SUB_DFX_DFT_SetOutputType_0600
     * @tc.desc   setOutputType接口-测试CONSOLE_ONLY枚举值（等于DEFAULT）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.CONSOLE_ONLY);
        hilog.info(0x3200, "testTag", 'console only log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        expect(hilog.OutputType.CONSOLE_ONLY).assertEqual(0);
      } catch (err) {
        console.error(`====> testHilogSetOutputType0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputType0900
     * @tc.number SUB_DFX_DFT_SetOutputType_0900
     * @tc.desc   setOutputType接口-参数规格覆盖：连续调用测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () =>{
      try {
        let lastType1 = hilog.setOutputType(hilog.OutputType.DEFAULT);
        let lastType2 = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        let lastType3 = hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.setOutputType(hilog.OutputType.DEFAULT);
        hilog.info(0x3200, "testTag", 'set output type result:%{public}d', lastType1);
        hilog.info(0x3200, "testTag", 'set output type result:%{public}d', lastType2);
        hilog.info(0x3200, "testTag", 'set output type result:%{public}d', lastType3);
        expect(lastType1 >= 0 && lastType1 <= 4).assertTrue();
        expect(lastType2 >= 0 && lastType2 <= 4).assertTrue();
        expect(lastType3 >= 0 && lastType3 <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0900 testTag > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })
    
    /**
     * @tc.name   testHilogSetOutputType1100
     * @tc.number SUB_DFX_DFT_SetOutputType_1100
     * @tc.desc   setOutputType接口-返回值覆盖：验证每个枚举值的返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () =>{
      try {
        // 设置为DEFAULT，应返回之前的类型
        hilog.setOutputType(hilog.OutputType.DEFAULT);
        let lastType1 = hilog.setOutputType(hilog.OutputType.DEFAULT);
        expect(lastType1).assertEqual(0);
        
        // 设置为PRIVATE_SANDBOX_ONLY，应返回DEFAULT
        let lastType2 = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        expect(lastType2).assertEqual(0);
        
        // 设置为SHARE_SANDBOX_ONLY，应返回PRIVATE_SANDBOX_ONLY
        let lastType3 = hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        expect(lastType3).assertEqual(1);
        
        // 设置为PRIVATE_SANDBOX_WITH_CONSOLE，应返回SHARE_SANDBOX_ONLY
        let lastType4 = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_WITH_CONSOLE);
        expect(lastType4).assertEqual(2);
        
        // 设置为SHARE_SANDBOX_WITH_CONSOLE，应返回PRIVATE_SANDBOX_WITH_CONSOLE
        let lastType5 = hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_WITH_CONSOLE);
        expect(lastType5).assertEqual(3);
        
        // 再次设置为DEFAULT，应返回SHARE_SANDBOX_WITH_CONSOLE
        let lastType6 = hilog.setOutputType(hilog.OutputType.DEFAULT);
        expect(lastType6).assertEqual(4);
      } catch (err) {
        console.error(`====> testHilogSetOutputType1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0100
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0100
     * @tc.desc   hilog的SetOutputTypeByDomainID方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [1, 2, 3], false);
        hilog.info(0x0001, "testTag", 'domain 1 log');
        hilog.info(0x0002, "testTag", 'domain 2 log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0200
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0200
     * @tc.desc   hilog的SetOutputTypeByDomainID方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [1, 2, 3], true);
        hilog.info(0x0004, "testTag", 'domain 4 log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0300
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0300
     * @tc.desc   hilog的SetOutputTypeByDomainID方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [], false);
        hilog.info(0x0001, "testTag", 'empty domain list log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0400
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0400
     * @tc.desc   hilog的SetOutputTypeByDomainID方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [1, 100, 1000, 65535], false);
        hilog.info(0x0001, "testTag", 'multi domain log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0700
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0700
     * @tc.desc   setOutputTypeByDomainID接口-参数规格覆盖：domainIDs包含0值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0x0000, 0x3200], false);
        hilog.info(0x0000, "testTag", 'domain 0x0000 log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0800
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0800
     * @tc.desc   setOutputTypeByDomainID接口-参数规格覆盖：domainIDs取最大边界值0xFFFF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0xFFFF], false);
        hilog.info(0xFFFF, "testTag", 'domain 0xFFFF log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0900
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0900
     * @tc.desc   setOutputTypeByDomainID接口-参数规格覆盖：domainIDs包含负数（非法值）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [-1, 1, 2], false);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID1000
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_1000
     * @tc.desc   setOutputTypeByDomainID接口-参数规格覆盖：domainIDs超出边界值（0xFFFF+1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0x10000], false);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID1200
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_1200
     * @tc.desc   setOutputTypeByDomainID接口-返回值覆盖：验证返回值类型和范围
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [0x3200], true);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID1300
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_1300
     * @tc.desc   setOutputTypeByDomainID接口-入参覆盖：空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [], true);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID1600
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_1600
     * @tc.desc   setOutputTypeByDomainID接口-返回值覆盖：返回值与setOutputType对比
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        // 先用setOutputType设置
        let lastType1 = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        
        // 再用setOutputTypeByDomainID设置
        let lastType2 = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [0x3200], false);
        
        // 验证两个返回值都在合法范围内
        expect(lastType1 >= 0 && lastType1 <= 4).assertTrue();
        expect(lastType2 >= 0 && lastType2 <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID1700
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_1700
     * @tc.desc   setOutputTypeByDomainID接口-参数规格覆盖：isExclude参数不同值的对比
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let domainId = 0x3200;
        
        // isExclude=true：指定domainID列表设为DEFAULT，其他设为指定type
        let lastType1 = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [domainId], true);
        hilog.info(domainId, "testTag", 'isExclude=true test log');
        
        // isExclude=false：指定domainID列表设为指定type，其他设为DEFAULT
        let lastType2 = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [domainId], false);
        hilog.info(domainId, "testTag", 'isExclude=false test log');
        
        expect(lastType1 >= 0 && lastType1 <= 4).assertTrue();
        expect(lastType2 >= 0 && lastType2 <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1700 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID1800
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_1800
     * @tc.desc   setOutputTypeByDomainID接口-参数规格覆盖：domainIDs包含十六进制值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0x0001, 0x00FF, 0x0320, 0xFFFF], false);
        hilog.info(0x0001, "testTag", 'hex domain 0x0001 test log');
        hilog.info(0x00FF, "testTag", 'hex domain 0x00FF test log');
        hilog.info(0x0320, "testTag", 'hex domain 0x0320 test log');
        hilog.info(0xFFFF, "testTag", 'hex domain 0xFFFF test log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1800 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID1900
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_1900
     * @tc.desc   setOutputTypeByDomainID接口-参数规格覆盖：domainIDs包含十进制值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [1, 255, 800, 65535], false);
        hilog.info(1, "testTag", 'decimal domain 1 test log');
        hilog.info(255, "testTag", 'decimal domain 255 test log');
        hilog.info(800, "testTag", 'decimal domain 800 test log');
        hilog.info(65535, "testTag", 'decimal domain 65535 test log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1900 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID2000
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_2000
     * @tc.desc   setOutputTypeByDomainID接口-参数规格覆盖：domainIDs包含连续值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let domainIds = [0x3200, 0x3201, 0x3202, 0x3203, 0x3204];
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, domainIds, false);
        
        for (let i = 0; i < domainIds.length; i++) {
          hilog.info(domainIds[i], "testTag", 'continuous domain test log %{public}d', i);
        }
        expect(lastType >= 0 && lastType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID2000 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID2100
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_2100
     * @tc.desc   getOutputType接口-返回值覆盖：获取所有枚举类型的返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        // 设置为DEFAULT，应返回之前的类型
        hilog.setOutputType(hilog.OutputType.DEFAULT);
        let lastType1 = hilog.setOutputTypeByDomainID(hilog.OutputType.DEFAULT, [0x0000, 0x3200], false);
        expect(lastType1).assertEqual(0);
        
        // 设置为PRIVATE_SANDBOX_ONLY，应返回DEFAULT
        let lastType2 = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0x0000, 0x3200], false);
        expect(lastType2).assertEqual(0);
        
        // 设置为SHARE_SANDBOX_ONLY，应返回PRIVATE_SANDBOX_ONLY
        let lastType3 = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [0x0000, 0x3200], false);
        
        expect(lastType3).assertEqual(1);
        
        // 设置为PRIVATE_SANDBOX_WITH_CONSOLE，应返回SHARE_SANDBOX_ONLY
        let lastType4 = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_WITH_CONSOLE, [0x0000, 0x3200], false);
        
        expect(lastType4).assertEqual(2);
        
        // 设置为SHARE_SANDBOX_WITH_CONSOLE，应返回PRIVATE_SANDBOX_WITH_CONSOLE
        let lastType5 = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_WITH_CONSOLE, [0x0000, 0x3200], false);
        expect(lastType5).assertEqual(3);
        
        // 再次设置为DEFAULT，应返回SHARE_SANDBOX_WITH_CONSOLE
        let lastType6 = hilog.setOutputTypeByDomainID(hilog.OutputType.CONSOLE_ONLY, [0x0000, 0x3200], false);
        expect(lastType6).assertEqual(4);

        let lastType7 = hilog.setOutputTypeByDomainID(hilog.OutputType.CONSOLE_ONLY, [0x0000, 0x3200], true);
        expect(lastType7).assertEqual(0);
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID2100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetOutputType0100
     * @tc.number SUB_DFX_DFT_GetOutputType_0100
     * @tc.desc   hilog的GetOutputType方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetOutputType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let currentType = hilog.getOutputType();
        hilog.info(0x0001, "testTag", 'current output type:%{public}d', currentType);
        expect(currentType >= 0 && currentType <= 4).assertTrue();
      } catch (err) {
        console.error(`====> testHilogGetOutputType0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetOutputType0200
     * @tc.number SUB_DFX_DFT_GetOutputType_0200
     * @tc.desc   getOutputType接口-返回值覆盖：获取所有枚举类型的返回值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetOutputType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.DEFAULT);
        let type1 = hilog.getOutputType();
        
        hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        let type2 = hilog.getOutputType();
        
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let type3 = hilog.getOutputType();
        
        hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_WITH_CONSOLE);
        let type4 = hilog.getOutputType();
        
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_WITH_CONSOLE);
        let type5 = hilog.getOutputType();
        
        expect(type1).assertEqual(0);
        expect(type2).assertEqual(1);
        expect(type3).assertEqual(2);
        expect(type4).assertEqual(3);
        expect(type5).assertEqual(4);
      } catch (err) {
        console.error(`====> testHilogGetOutputType0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetOutputType0300
     * @tc.number SUB_DFX_DFT_GetOutputType_0300
     * @tc.desc   getOutputType接口-调用覆盖：与setOutputType组合调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */ 
    it('testHilogGetOutputType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let type1 = hilog.getOutputType();
        hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        let type2 = hilog.getOutputType();
        expect(type1 >= 0 && type1 <= 4).assertTrue();
        expect(type2).assertEqual(1);
      } catch (err) {
        console.error(`====> testHilogGetOutputType0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetOutputType0400
     * @tc.number SUB_DFX_DFT_GetOutputType_0400
     * @tc.desc   getOutputType接口-连续调用验证一致性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetOutputType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let type1 = hilog.getOutputType();
        let type2 = hilog.getOutputType();
        let type3 = hilog.getOutputType();
        
        expect(type1).assertEqual(type2);
        expect(type2).assertEqual(type3);
        expect(type3).assertEqual(2);
      } catch (err) {
        console.error(`====> testHilogGetOutputType0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetOutputDir0100
     * @tc.number SUB_DFX_DFT_GetOutputDir_0100
     * @tc.desc   hilog的GetOutputDir方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetOutputDir0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let dir = hilog.getOutputDir();
        hilog.info(0x0001, "testTag", 'sandbox output dir:%{public}s', dir);
        expect(dir.length > 0).assertTrue();
      } catch (err) {
        console.error(`====> testHilogGetOutputDir0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue(); 
      }
    })

    /**
     * @tc.name   testHilogGetOutputDir0200
     * @tc.number SUB_DFX_DFT_GetOutputDir_0200
     * @tc.desc   hilog的GetOutputDir方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetOutputDir0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.DEFAULT);
        let dir = hilog.getOutputDir();
        hilog.info(0x0001, "testTag", 'default output dir:%{public}s', dir);
        expect(dir.length == 0).assertTrue();
      } catch (err) {
        console.error(`====> testHilogGetOutputDir0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogClean0100
     * @tc.number SUB_DFX_DFT_Clean_0100
     * @tc.desc   hilog的clean方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogClean0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'log before clean');
        hilog.clean();
        hilog.info(0x0001, "testTag", 'log after clean');
      } catch (err) {
        console.error(`====> testHilogClean0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogFlush0100
     * @tc.number SUB_DFX_DFT_Flush_0100
     * @tc.desc   hilog的flush方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogFlush0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'log before flush');
        hilog.flush();
        hilog.info(0x0001, "testTag", 'log after flush');
      } catch (err) {
        console.error(`====> testHilogFlush0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0100
     * @tc.number SUB_DFX_DFT_GetLogFile_0100
     * @tc.desc   hilog的getLogFile方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'test get log file');
        hilog.flush();
        let files = hilog.getLogFile(10);
        hilog.info(0x0001, "testTag", 'log files count:%{public}d', files.length);
        expect(files.length >= 0).assertTrue();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0200
     * @tc.number SUB_DFX_DFT_GetLogFile_0200
     * @tc.desc   hilog的getLogFile方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let files = hilog.getLogFile(0);
        hilog.info(0x0001, "testTag", '0 seconds log files count:%{public}d', files.length);
        expect(files.length >= 0).assertTrue();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0300
     * @tc.number SUB_DFX_DFT_GetLogFile_0300
     * @tc.desc   hilog的getLogFile方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_WITH_CONSOLE);
        hilog.info(0x0001, "testTag", 'long time test log');
        hilog.flush();
        let files = hilog.getLogFile(-1);
        if (files === null || files === undefined) {
          expect(false).assertTrue();
        }
        hilog.info(0x0001, "testTag", 'testHilogGetLogFile0300 negative seconds log files count:%{public}d', files.length);
        expect(files.length == 0).assertTrue();
      } catch (err) {
        console.error(`====>testTag testHilogGetLogFile0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0400
     * @tc.number SUB_DFX_DFT_GetLogFile_0400
     * @tc.desc   hilog的getLogFile方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'long time test log');
        hilog.flush();
        let files = hilog.getLogFile(3600);
        hilog.info(0x0001, "testTag", 'long time log files count:%{public}d', files.length);
        expect(files.length >= 0).assertTrue();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0600
     * @tc.number SUB_DFX_DFT_GetLogFile_0600
     * @tc.desc   getLogFile接口-参数规格覆盖：边界值测试（1秒）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'boundary test log');
        hilog.flush();
        let files = hilog.getLogFile(1);
        expect(files.length >= 0).assertTrue();
        expect(Array.isArray(files)).assertTrue();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0700
     * @tc.number SUB_DFX_DFT_GetLogFile_0700
     * @tc.desc   getLogFile接口-参数规格覆盖：极大值测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let maxInt = 2147483647;
        let files = hilog.getLogFile(maxInt);
        expect(files.length >= 0).assertTrue();
        expect(Array.isArray(files)).assertTrue();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile1200
     * @tc.number SUB_DFX_DFT_GetLogFile_1200
     * @tc.desc   getLogFile接口-返回值覆盖：验证返回值类型和结构
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'return type test log');
        hilog.flush();
        let files = hilog.getLogFile(10);
        
        expect(Array.isArray(files)).assertTrue();
        if (files.length > 0) {
          expect(typeof files[0]).assertEqual('string');
          expect(files[0].length > 0).assertTrue();
        }
      } catch (err) {
        console.error(`====> testHilogGetLogFile1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

  })
}