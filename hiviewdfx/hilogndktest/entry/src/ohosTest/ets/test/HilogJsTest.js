/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import hilog from '@ohos.hilog'
// @ts-ignore
import hilogndk from "libhilogndk.so"

export default function HilogJsTest() {
describe('HilogJsTest', function () {

    /**
    * run before testClass
    */
    beforeAll(function () {
        console.info('beforeAll called');
    })

    /**
    * run after testClass
    */
    afterAll(function () {
        hilog.setMinLogLevel(hilog.LogLevel.INFO);
        console.info('afterAll called');
    })

    /**
     * @tc.name   testHilogJsApi01
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi01 start');
        try{
            hilog.debug(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
        } catch (error){
            console.log(`testHilogJsApi01 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi01 end');
    })

    /**
     * @tc.name   testHilogJsApi02
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi02 start');
      try{
        hilog.error(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0200')
      } catch (error){
        console.log(`testHilogJsApi02 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      console.info('testHilogJsApi02 end');
    })

    /**
     * @tc.name   testHilogJsApi03
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi03 start');
      try{
        hilog.fatal(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0300')
      } catch (error){
        console.log(`testHilogJsApi03 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      console.info('testHilogJsApi03 end');
    })

    /**
     * @tc.name   testHilogJsApi04
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi04 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0400')
      } catch (error){
        console.log(`testHilogJsApi04 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      console.info('testHilogJsApi04 end');
    })

    /**
     * @tc.name   testHilogJsApi05
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi04 start');
      try{
        hilog.warn(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0500')
      } catch (error){
        console.log(`testHilogJsApi05 got an error: ${JSON.stringify(error)}`)
        expect().assertFail()
      }
      console.info('testHilogJsApi05 end');
    })

    /**
     * @tc.name   testHilogJsApi06
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0600
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi06 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.DEBUG);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi06 end');
    })

    /**
     * @tc.name   testHilogJsApi07
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0700
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi07 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.DEBUG);
        var tag = "";
        for (var i = 0; i < 1000; i++){
            tag += "HILOGTEST"
        }
        expect(res).assertEqual(true);
        console.info('testHilogJsApi07 end');
    })

    /**
     * @tc.name   testHilogJsApi08
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_0800
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi08 start');
        const res = hilog.isLoggable(0x3200, "", hilog.LogLevel.DEBUG);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi08 end');
    })

    /**
     * @tc.name   testHilogJsApi09
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1100
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi09 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.ERROR);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi09 end');
    })

    /**
     * @tc.name   testHilogJsApi10
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1200
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi10 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi10 end');
    })

    /**
     * @tc.name   testHilogJsApi11
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1300
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi11 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi11 end');
    })

    /**
     * @tc.name   testHilogJsApi12
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1400
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi12 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi12 end');
    })

    /**
     * @tc.name   testHilogJsApi13
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1500
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi13 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", 100);
        expect(res).assertEqual(false);
        console.info('testHilogJsApi13 end');
    })

    /**
     * @tc.name   testHilogJsApi14
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1600
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi14 start');
        const res = hilog.isLoggable(0, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi14 end');
    })

    /**
     * @tc.name   testHilogJsApi15
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_01700
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi15 start');
        const res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.WARN);
        expect(res).assertEqual(true);
        console.info('testHilogJsApi15 end');
    })

    /**
     * @tc.name   testHilogJsApi16
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_1800
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi16 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", 'hilogJs1800')
      }catch(error){
        console.log(`testHilogJsApi16 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi16 end');
    })

    /**
     * @tc.name   testHilogJsApi17
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi17 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}d", 2.1)
      }catch(error){
        console.log(`testHilogJsApi17 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi17 end');
    })

    /**
     * @tc.name   testHilogJsApi18
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi18 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}d", 65535)
      }catch(error){
        console.log(`testHilogJsApi18 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi18 end');
    })

    /**
     * @tc.name   testHilogJsApi19
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi19 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", "hilog info")
      }catch(error){
        console.log(`testHilogJsApi19 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi19 end');
    })

    /**
     * @tc.name   testHilogJsApi20
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_2900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi20 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}d", 2147483647)
      }catch(error){
        console.log(`testHilogJsApi20 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi20 end');
    })

    /**
     * @tc.name   testHilogJsApi21
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3000
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi21 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", "100%s%d%x%f")
      }catch(error){
        console.log(`testHilogJsApi21 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi21 end');
    })

    /**
     * @tc.name   testHilogJsApi22
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi22 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", "65536")
      }catch(error){
        console.log(`testHilogJsApi22 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi22 end');
    })

    /**
     * @tc.name   testHilogJsApi23
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi23 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "username:%{public}s, password:%{private}s.", "username", "password")
        hilog.debug(0x3200, "HILOGTEST", "username:%{public}s, password:%s.", "username123", "password")
      }catch(error){
        console.log(`testHilogJsApi23 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi23 end');
    })

    /**
     * @tc.name   testHilogJsApi24
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi24 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{public}s", "hilog public")
      }catch(error){
        console.log(`testHilogJsApi24 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi24 end');
    })

    /**
     * @tc.name   testHilogJsApi25
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi25 start');
      try{
        hilog.debug(0x3200, "HILOGTEST", "%{nopublic}s", "Hilogtest")
      }catch(error){
        console.log(`testHilogJsApi25 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi25 end');
    })

    /**
     * @tc.name   testHilogJsApi26
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi26 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "username:%{public}s, password:%{private}s.", "username", "password")
        hilog.info(0x3200, "HILOGTEST", "username:%{public}s, password:%s.", "username123", "password")
      }catch(error){
        console.log(`testHilogJsApi26 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi26 end');
    })

    /**
     * @tc.name   testHilogJsApi27
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_3900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi27 start');
      try{
        hilog.info(0xffff, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi27 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi27 end');
    })

    /**
     * @tc.name   testHilogJsApi28
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4000
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi28 start');
      try{
        hilog.info(0xfffe, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi28 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi28 end');
    })

    /**
     * @tc.name   testHilogJsApi29
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi29 start');
      try{
        hilog.info(0xfffff, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi29 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi29 end');
    })

    /**
     * @tc.name   testHilogJsApi30
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi30 start');
      try{
        hilog.info(0xffffe, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi30 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi30 end');
    })

    /**
     * @tc.name   testHilogJsApi31
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4300
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi31 start');
      try{
        // @ts-ignore
        hilog.info("中文domainId", "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi31 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi31 end');
    })

    /**
     * @tc.name   testHilogJsApi32
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi32 start');
      try{
        hilog.info(100, "HILOGTEST", "username:%{public}s, password:%{public}s.", "username", "password")
      }catch(error){
        console.log(`testHilogJsApi32 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi32 end');
    })

    /**
     * @tc.name   testHilogJsApi33
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi33 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "username:%{public}s.", null)
      }catch(error){
        console.log(`testHilogJsApi33 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi33 end');
    })

    /**
     * @tc.name   testHilogJsApi34
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi34 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "username:%{public}s.", undefined)
      }catch(error){
        console.log(`testHilogJsApi34 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi34 end');
    })

    /**
     * @tc.name   testHilogJsApi35
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4700
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi35 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "MAX Number:%{public}d, MIN Number:%{public}d", Number.MAX_VALUE, Number.MIN_VALUE)
      }catch(error){
        console.log(`testHilogJsApi35 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi35 end');
    })

    /**
     * @tc.name   testHilogJsApi36
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi36 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "中文测试:%{public}s, 混合打印:%{public}s", "中文打印测试", "for中文test,.;:*_-=^(%)?#$/|\\")
      }catch(error){
        console.log(`testHilogJsApi36 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi36 end');
    })

    /**
     * @tc.name   testHilogJsApi37
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_4900
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi37 start');
      try{
        hilog.info(0x3200, "HILOGTEST", "boolean1:%{public}s, boolean2:%{public}s", true, false)
      }catch(error){
        console.log(`testHilogJsApi37 got an error: ${JSON.stringify(error)}`)
        expect().assertFail();
      }
      console.info('testHilogJsApi37 end');
    })

    /**
     * @tc.name   testHilogJsApi38
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5100
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi38 start');
      const res = hilog.isLoggable(100, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      console.info('testHilogJsApi38 end');
    })

    /**
     * @tc.name   testHilogJsApi39
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5200
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi39 start');
      const res = hilog.isLoggable(0xfffff, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
      console.info('testHilogJsApi39 end');
    })

    /**
     * @tc.name   testHilogJsApi40
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5400
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi40 start');
      const res = hilog.isLoggable(0xffff, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      console.info('testHilogJsApi40 end');
    })

    /**
     * @tc.name   testHilogJsApi41
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5500
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi41 start');
      const res = hilog.isLoggable(0xfffe, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(true);
      console.info('testHilogJsApi41 end');
    })

    /**
     * @tc.name   testHilogJsApi42
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5600
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi42 start');
      const res = hilog.isLoggable(0x123456789, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
      console.info('testHilogJsApi42 end');
    })

    /**
     * @tc.name   testHilogJsApi43
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5700
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi43 start');
      // @ts-ignore
      const res = hilog.isLoggable("中文测试", "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(undefined);
      console.info('testHilogJsApi43 end');
    })
	
    /**
     * @tc.name   testHilogJsApi44
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5800
     * @tc.desc   hilog begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi44 start');
        const res = hilogndk.ohIsLoggableTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi44 end');
    })

    /**
     * @tc.name   testHilogJsApi44_1
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5800
     * @tc.desc   hilog ohIsLoggableTestFalse begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi44_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info('testHilogJsApi44_1 start');
      const res = hilogndk.ohIsLoggableTestFalse();
      expect(res).assertEqual(false);
      console.info('testHilogJsApi44_1 end');
    })

     /**
      * @tc.name   testHilogJsApi45
      * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5900
      * @tc.desc   hilog begin interface test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testHilogJsApi45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi45 start');
        const res = hilogndk.ohPrintTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi45 end');
    })
    
    /**
     * @tc.name   testHilogJsApi46
     * @tc.number SUB_DFX_DFT_Hilog_Redirect_0100
     * @tc.desc   验证nativie层流水日志打印可通过回调接口重定向直自身js层.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi46 start');
        try{
            let sum = hilogndk.add(2,3)
            expect(sum).assertEqual(6);

            let msg = hilogndk.getMsg()
            expect(msg).assertContain("666666");
            console.log(`testHilogJsApi46 msg: ${msg}`)
        }catch(error){
            console.log(`testHilogJsApi46 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi46 end');
    })

    /**
     * @tc.name   testHilogJsApi47
     * @tc.number SUB_DFX_DFT_Hilog_Redirect_0200
     * @tc.desc   验证js层流水日志打印可通过回调接口重定向直自身js层.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi47 start');
        try{
            let sum = hilogndk.add(2,3)

            hilog.info(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
            let msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0100");
            console.log(`testHilogJsApi47 msg -1: ${msg}`)

            hilog.warn(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0200')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0200");
            console.log(`testHilogJsApi47 msg -2: ${msg}`)

            hilog.error(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0300')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0300");
            console.log(`testHilogJsApi47 msg -3: ${msg}`)

            hilog.fatal(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0400')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0400");
            console.log(`testHilogJsApi47 msg -4: ${msg}`)

        }catch(error){
            console.log(`testHilogJsApi47 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }

        console.info('testHilogJsApi47 end');
    })

    /**
     * @tc.name   testHilogJsApi48
     * @tc.number testHilogJsApi48
     * @tc.desc   testHilogJsApi48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi48 start');
        const res = hilogndk.ohPrintMsgTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi48 end');
    })
    
    /**
     * @tc.name   testHilogJsApi49
     * @tc.number testHilogJsApi49
     * @tc.desc   testHilogJsApi49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi49 start');
        const res = hilogndk.ohPrintMsgByLenTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi49 end');
    })
	
    /**
     * @tc.name   testHilogJsApi50
     * @tc.number testHilogJsApi50
     * @tc.desc   testHilogJsApi50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi50 start');
        const res = hilogndk.ohVPrintTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi50 end');
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0100
     * @tc.number SUB_DFX_DFT_DefaultLevel_0100
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.INFO);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.DEBUG);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0200
     * @tc.number SUB_DFX_DFT_DefaultLevel_0200
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.WARN);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0300
     * @tc.number SUB_DFX_DFT_DefaultLevel_0300
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.ERROR);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0400
     * @tc.number SUB_DFX_DFT_DefaultLevel_0400
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.FATAL);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.ERROR);
      let res1 = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.FATAL);
      expect(res).assertEqual(false);
      expect(res1).assertEqual(true);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0500
     * @tc.number SUB_DFX_DFT_DefaultLevel_0500
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.FATAL);
      let res = hilog.isLoggable(0x3200, "HILOGTEST", hilog.LogLevel.INFO);
      expect(res).assertEqual(false);
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_0600
     * @tc.number SUB_DFX_DFT_DefaultLevel_0600
     * @tc.desc   SUB_DFX_DFT_DefaultLevel_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_DefaultLevel_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.setMinLogLevel(hilog.LogLevel.ERROR);
      try{
        for (let index = 0; index < 1000; index++) {
          hilog.info(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
          hilog.error(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
        }
      } catch (error){
        console.log(`testHilogJsApi01 got an error: ${JSON.stringify(error)}`)
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
     * @tc.name   SUB_DFX_DFT_DefaultLevel_2000
     * @tc.number SUB_DFX_DFT_DefaultLevel_2000
     * @tc.desc   hilog新增向下调整日志级别接口-使用默认日志级别OH_LOG_SetLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        console.info('SUB_DFX_DFT_DefaultLevel_2000 start');
        const res = hilogndk.ohSetLogLevelTest1();
        expect(res).assertEqual(true);
        console.info('SUB_DFX_DFT_DefaultLevel_2000 end');
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_2100
     * @tc.number SUB_DFX_DFT_DefaultLevel_2100
     * @tc.desc   hilog新增向下调整日志级别接口-比较默认值和设置值后取较大值OH_LOG_SetLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info('SUB_DFX_DFT_DefaultLevel_2100 start');
      const res = hilogndk.ohSetLogLevelTest2();
      expect(res).assertEqual(true);
      console.info('SUB_DFX_DFT_DefaultLevel_2100 end');
    })

    /**
     * @tc.name   SUB_DFX_DFT_DefaultLevel_2200
     * @tc.number SUB_DFX_DFT_DefaultLevel_2200
     * @tc.desc   hilog新增向下调整日志级别接口-比较默认值和设置值后取较小值OH_LOG_SetLogLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DFX_DFT_DefaultLevel_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info('SUB_DFX_DFT_DefaultLevel_2200 start');
      const res = hilogndk.ohSetLogLevelTest3();
      expect(res).assertEqual(true);
      console.info('SUB_DFX_DFT_DefaultLevel_2200 end');
    })
    
    /**
     * @tc.name   testHilogSetOutputType0100
     * @tc.number SUB_DFX_DFT_SetOutputType_0100
     * @tc.desc   hilog的SetOutputType方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.DEFAULT);
        hilog.info(0x0001, "testTag", 'set output type result:%{public}d', lastType);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'private sandbox log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'share sandbox log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_WITH_CONSOLE);
        hilog.info(0x0001, "testTag", 'private sandbox with console log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_WITH_CONSOLE);
        hilog.info(0x0001, "testTag", 'share sandbox with console log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputType(hilog.OutputType.CONSOLE_ONLY);
        hilog.info(0x3200, "testTag", 'console only log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        expect(hilog.OutputType.CONSOLE_ONLY).assertEqual(0);
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputType0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
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
    it('testHilogSetOutputType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
        
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputType1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [1, 2, 3], false);
        hilog.info(0x0001, "testTag", 'domain 1 log');
        hilog.info(0x0002, "testTag", 'domain 2 log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [1, 2, 3], true);
        hilog.info(0x0004, "testTag", 'domain 4 log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [], false);
        hilog.info(0x0001, "testTag", 'empty domain list log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [1, 100, 1000, 65535], false);
        hilog.info(0x0001, "testTag", 'multi domain log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0500
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0500
     * @tc.desc   setOutputTypeByDomainID接口-入参覆盖：domainIDs为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, null, false);
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testHilogSetOutputTypeByDomainID0600
     * @tc.number SUB_DFX_DFT_SetOutputTypeByDomainID_0600
     * @tc.desc   setOutputTypeByDomainID接口-入参覆盖：domainIDs为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogSetOutputTypeByDomainID0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, undefined, true);
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
        done();
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
    it('testHilogSetOutputTypeByDomainID0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0x0000, 0x3200], false);
        hilog.info(0x0000, "testTag", 'domain 0x0000 log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0xFFFF], false);
        hilog.info(0xFFFF, "testTag", 'domain 0xFFFF log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [-1, 1, 2], false);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
        done();
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
    it('testHilogSetOutputTypeByDomainID1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0x10000], false);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
        done();
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
    it('testHilogSetOutputTypeByDomainID1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [0x3200], true);
        expect(typeof lastType).assertEqual('number');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [], true);
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        // 先用setOutputType设置
        let lastType1 = hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        
        // 再用setOutputTypeByDomainID设置
        let lastType2 = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [0x3200], false);
        
        // 验证两个返回值都在合法范围内
        expect(lastType1 >= 0 && lastType1 <= 4).assertTrue();
        expect(lastType2 >= 0 && lastType2 <= 4).assertTrue();
        
        // 验证返回值类型
        expect(typeof lastType1).assertEqual('number');
        expect(typeof lastType2).assertEqual('number');
        
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogSetOutputTypeByDomainID1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
        
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1700 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
        done();
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
    it('testHilogSetOutputTypeByDomainID1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, [0x0001, 0x00FF, 0x0320, 0xFFFF], false);
        hilog.info(0x0001, "testTag", 'hex domain 0x0001 test log');
        hilog.info(0x00FF, "testTag", 'hex domain 0x00FF test log');
        hilog.info(0x0320, "testTag", 'hex domain 0x0320 test log');
        hilog.info(0xFFFF, "testTag", 'hex domain 0xFFFF test log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1800 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
        done();
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
    it('testHilogSetOutputTypeByDomainID1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.SHARE_SANDBOX_ONLY, [1, 255, 800, 65535], false);
        hilog.info(1, "testTag", 'decimal domain 1 test log');
        hilog.info(255, "testTag", 'decimal domain 255 test log');
        hilog.info(800, "testTag", 'decimal domain 800 test log');
        hilog.info(65535, "testTag", 'decimal domain 65535 test log');
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID1900 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
        done();
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
    it('testHilogSetOutputTypeByDomainID2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let domainIds = [0x3200, 0x3201, 0x3202, 0x3203, 0x3204];
        let lastType = hilog.setOutputTypeByDomainID(hilog.OutputType.PRIVATE_SANDBOX_ONLY, domainIds, false);
        
        for (let i = 0; i < domainIds.length; i++) {
          hilog.info(domainIds[i], "testTag", 'continuous domain test log %{public}d', i);
        }
        
        expect(lastType >= 0 && lastType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID2000 > err code: ${err.code}, err msg: ${err.message}`)
        expect().assertFail();
        done();
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
    it('testHilogSetOutputTypeByDomainID2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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

        done();
      } catch (err) {
        console.error(`====> testHilogSetOutputTypeByDomainID2100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetOutputType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let currentType = hilog.getOutputType();
        hilog.info(0x0001, "testTag", 'current output type:%{public}d', currentType);
        expect(currentType >= 0 && currentType <= 4).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetOutputType0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetOutputType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
        done();
      } catch (err) {
        console.error(`====> testHilogGetOutputType0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetOutputType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        let type1 = hilog.getOutputType();
        hilog.setOutputType(hilog.OutputType.PRIVATE_SANDBOX_ONLY);
        let type2 = hilog.getOutputType();
        
        expect(type1 >= 0 && type1 <= 4).assertTrue();
        expect(type2).assertEqual(1);
        done();
      } catch (err) {
        console.error(`====> testHilogGetOutputType0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetOutputType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let type1 = hilog.getOutputType();
        let type2 = hilog.getOutputType();
        let type3 = hilog.getOutputType();
        
        expect(type1).assertEqual(type2);
        expect(type2).assertEqual(type3);
        expect(type3).assertEqual(2);
        done();
      } catch (err) {
        console.error(`====> testHilogGetOutputType0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetOutputDir0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let dir = hilog.getOutputDir();
        hilog.info(0x0001, "testTag", 'sandbox output dir:%{public}s', dir);
        expect(dir.length > 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetOutputDir0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetOutputDir0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        // 测试默认输出类型时获取目录
        hilog.setOutputType(hilog.OutputType.DEFAULT);
        let dir = hilog.getOutputDir();
        hilog.info(0x0001, "testTag", 'default output dir:%{public}s', dir);
        expect(dir.length == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetOutputDir0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogClean0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'log before clean');
        hilog.clean();
        hilog.info(0x0001, "testTag", 'log after clean');
        done();
      } catch (err) {
        console.error(`====> testHilogClean0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogFlush0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'log before flush');
        hilog.flush();
        hilog.info(0x0001, "testTag", 'log after flush');
        done();
      } catch (err) {
        console.error(`====> testHilogFlush0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetLogFile0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'test get log file');
        hilog.flush();
        let files = hilog.getLogFile(10);
        hilog.info(0x0001, "testTag", 'log files count:%{public}d', files.length);
        expect(files.length >= 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetLogFile0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let files = hilog.getLogFile(0);
        hilog.info(0x0001, "testTag", '0 seconds log files count:%{public}d', files.length);
        expect(files.length >= 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetLogFile0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_WITH_CONSOLE);
        hilog.info(0x0001, "testTag", 'long time test log');
        hilog.flush();
        let files = hilog.getLogFile(-1);
        hilog.error(0x0001, 'testTag', 'testHilogGetLogFile0300 xxxxxx%{public}s', files.toString());
        hilog.error(0x0000, 'testTag', 'testHilogGetLogFile0300 xxxxxx%{public}d', files[0]);
        hilog.info(0x0001, "testTag", 'testHilogGetLogFile0300 negative seconds log files count:%{public}d', files.length);
        expect(files.length == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHilogGetLogFile0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetLogFile0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'long time test log');
        hilog.flush();
        let files = hilog.getLogFile(3600);
        hilog.info(0x0001, "testTag", 'long time log files count:%{public}d', files.length);
        expect(files.length >= 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetLogFile0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'boundary test log');
        hilog.flush();
        let files = hilog.getLogFile(1);
        expect(files.length >= 0).assertTrue();
        expect(Array.isArray(files)).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetLogFile0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let files = hilog.getLogFile(Number.MAX_SAFE_INTEGER);
        expect(files.length >= 0).assertTrue();
        expect(Array.isArray(files)).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetLogFile0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0800
     * @tc.number SUB_DFX_DFT_GetLogFile_0800
     * @tc.desc   getLogFile接口-入参覆盖：latestSeconds为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let files = hilog.getLogFile(null);
        expect(typeof files).assertEqual('undefined');
      } catch (err) {
        console.error(`====> testHilogGetLogFile0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0900
     * @tc.number SUB_DFX_DFT_GetLogFile_0900
     * @tc.desc   getLogFile接口-入参覆盖：latestSeconds为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let files = hilog.getLogFile(undefined);
        expect(typeof files).assertEqual('undefined');
      } catch (err) {
        console.error(`====> testHilogGetLogFile0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile1000
     * @tc.number SUB_DFX_DFT_GetLogFile_1000
     * @tc.desc   getLogFile接口-参数规格覆盖：小数测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        let files = hilog.getLogFile(10.5);
        expect(files.length >= 0).assertTrue();
        expect(Array.isArray(files)).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHilogGetLogFile1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
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
    it('testHilogGetLogFile1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
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
        done();
      } catch (err) {
        console.error(`====> testHilogGetLogFile1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile1300
     * @tc.number SUB_DFX_DFT_GetLogFile_1300
     * @tc.desc   getLogFile接口-调用覆盖：不同输出类型下的调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      try {
        // DEFAULT模式：应返回空数组
        hilog.setOutputType(hilog.OutputType.DEFAULT);
        let files1 = hilog.getLogFile(10);
        expect(files1.length).assertEqual(0);
        
        // SHARE_SANDBOX_ONLY模式：应返回文件列表
        hilog.setOutputType(hilog.OutputType.SHARE_SANDBOX_ONLY);
        hilog.info(0x0001, "testTag", 'different output type test log');
        hilog.flush();
        let files2 = hilog.getLogFile(10);
        expect(files2.length >= 0).assertTrue();
        
        done();
      } catch (err) {
        console.error(`====> testHilogGetLogFile1300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHilogGetLogFile0500
     * @tc.number SUB_DFX_DFT_GetLogFile_0500
     * @tc.desc   hilog的getLogFile方法
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogGetLogFile0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done)  {
      try {
        hilog.setOutputType(null);
        hilog.info(0x0001, "testTag", 'long time test log');
        hilog.flush();
        let files = hilog.getLogFile(3600);
        hilog.info(0x0001, "testTag", 'long time log files count:%{public}d', files.length);
        expect(files.length >= 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag testHilogGetLogFile0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })
    
  })
}
