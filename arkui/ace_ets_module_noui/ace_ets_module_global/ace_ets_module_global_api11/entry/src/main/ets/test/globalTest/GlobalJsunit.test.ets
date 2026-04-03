/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../Utils';
import deviceInfo from '@ohos.deviceInfo';
export default function globalJsunit() {
  describe('globalJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("global beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/global/global',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get global state pages:" + JSON.stringify(pages));
        if (!("global" == pages.name)) {
          console.info("get global state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push global page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push global page error:" + err);
      }
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
    });

    /**
     * @tc.name   ACE_global_setTimeout
     * @tc.number ACE_global_setTimeout
     * @tc.desc   ACE_global_setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACE_global_setTimeout', Level.LEVEL0, async (done: Function) => {
      let caseName: string = "ACE_global_setTimeout"
      console.info(`${caseName} START`);
      setTimeout(() => {
        expect(true).assertTrue();
      }, 100)
      console.info(`${caseName} END`);
      done()
    });

    /**
     * @tc.name   ACE_global_canIUse
     * @tc.number ACE_global_canIUse
     * @tc.desc   ACE_global_canIUse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACE_global_canIUse', Level.LEVEL0, async (done: Function) => {
      let caseName: string = "ACE_global_canIUse"
      console.info(`${caseName} START`);
      let syscapName: string = "";
      let result = canIUse(syscapName);
      expect(result === false).assertTrue();
      console.info(`${caseName} END`);
      done()
    });

     /** 
     * @tc.number ACE_global_apiAvailable 
     * @tc.name ACE_global_apiAvailable 
     * @tc.desc Test apiAvailable 
     */ 
    it('ACE_global_apiAvailable', Level.LEVEL0, async (done: Function) => { 
      let caseName: string = "ACE_global_apiAvailable" 
      console.error(`${caseName} START`); 

      // 保存原始系统版本号（后续修改会复用，需先备份）
      const originMajor = deviceInfo.sdkApiVersion; 
      const originMinor = deviceInfo.sdkMinorApiVersion; 
      const originPatch = deviceInfo.sdkPatchApiVersion; 
      // 临时使用的版本变量（避免修改原始值导致后续用例异常）
      let majorApiVersion = originMajor; 
      let minorApiVersion = originMinor; 
      let patchApiVersion = originPatch; 

      console.error('apiAvailable, origin major:' + originMajor + ', minor:' + originMinor + ', patch:' + originPatch); 

      /************************ 第一部分：非法传参校验 ************************/
      // 1. 类型非法：传字符串（原有逻辑，保留，验证非数字入参不合法）
      console.error('--- 校验：传入字符串类型参数 ---');
      let result: boolean = apiAvailable('0.2.3'); 
      expect(result).assertEqual(false); 
      result = apiAvailable('1000.2.3'); 
      expect(result).assertEqual(false); 
      result = apiAvailable('1.-1.3'); 
      expect(result).assertEqual(false); 
      result = apiAvailable('1.1000.3'); 
      expect(result).assertEqual(false); 
      result = apiAvailable('1.2.-1'); 
      expect(result).assertEqual(false); 
      result = apiAvailable('1.2.1000'); 
      expect(result).assertEqual(false); 

      // 2. 数值非法：传负数、超大数（数字类型，补充覆盖）
      console.error('--- 校验：传入数字类型的非法数值 ---');
      result = apiAvailable(-1); // major负数
      expect(result).assertEqual(false); 
      result = apiAvailable(originMajor, -2); // minor负数
      expect(result).assertEqual(false); 
      result = apiAvailable(originMajor, originMinor, -3); // patch负数
      expect(result).assertEqual(false); 
      result = apiAvailable(10000); // major超大数
      expect(result).assertEqual(false); 
      result = apiAvailable(originMajor, 10000); // minor超大数
      expect(result).assertEqual(false); 
      result = apiAvailable(originMajor, originMinor, 10000); // patch超大数
      expect(result).assertEqual(false); 

      // 3. 个数非法：传0个、4个及以上参数（核心补充，覆盖入参个数边界）
      console.error('--- 校验：传入非法个数的参数 ---');
      // @ts-ignore 故意传0个参数，忽略TS类型提示
      result = apiAvailable(); 
      expect(result).assertEqual(false); 
      // 传4个参数，多余参数无意义，判定为非法
      result = apiAvailable(originMajor, originMinor, originPatch, 1); 
      expect(result).assertEqual(false); 

      /************************ 第二部分：合法传参-版本相等 ************************/
      console.error('--- 校验：合法传参，版本号等于系统版本 ---');
      // 3参：完整版本号（原有逻辑）
      let result1: boolean = apiAvailable(originMajor, originMinor, originPatch); 
      console.error('apiAvailable 3参相等 result:' + result1); 
      expect(result1).assertEqual(true); 
      // 2参：major+minor，patch默认0（核心补充）
      result1 = apiAvailable(originMajor, originMinor); 
      console.error('apiAvailable 2参相等 result:' + result1); 
      expect(result1).assertEqual(true); 
      // 1参：仅major，minor/patch默认0（核心补充，你重点需要的覆盖）
      result1 = apiAvailable(originMajor); 
      console.error('apiAvailable 1参相等 result:' + result1); 
      expect(result1).assertEqual(true); 

      /************************ 第三部分：合法传参-版本小于系统 ************************/
      console.error('--- 校验：合法传参，版本号小于系统版本 ---');
      let lessMajor = originMajor - 1; // major减1，整体版本更小
      // 3参
      let result2: boolean = apiAvailable(lessMajor, originMinor, originPatch); 
      console.error('apiAvailable 3参小于 result:' + result2); 
      expect(result2).assertEqual(true); 
      // 2参
      result2 = apiAvailable(lessMajor, originMinor); 
      console.error('apiAvailable 2参小于 result:' + result2); 
      expect(result2).assertEqual(true); 
      // 1参
      result2 = apiAvailable(lessMajor); 
      console.error('apiAvailable 1参小于 result:' + result2); 
      expect(result2).assertEqual(true); 

      // 补充：minor小于系统（major相等），验证二级版本对比逻辑
      result2 = apiAvailable(originMajor, originMinor - 1); 
      console.error('apiAvailable 2参(major相等,minor小) result:' + result2); 
      expect(result2).assertEqual(true); 
      // 补充：patch小于系统（major/minor相等），验证三级版本对比逻辑
      result2 = apiAvailable(originMajor, originMinor, originPatch - 1); 
      console.error('apiAvailable 3参(major/minor相等,patch小) result:' + result2); 
      expect(result2).assertEqual(true); 

      /************************ 第四部分：合法传参-版本大于系统 ************************/
      console.error('--- 校验：合法传参，版本号大于系统版本 ---');
      let greaterMajor = originMajor + 1; // major加1，整体版本更大
      // 3参
      let result3: boolean = apiAvailable(greaterMajor, originMinor, originPatch); 
      console.error('apiAvailable 3参大于 result:' + result3); 
      expect(result3).assertEqual(false); 
      // 2参
      result3 = apiAvailable(greaterMajor, originMinor); 
      console.error('apiAvailable 2参大于 result:' + result3); 
      expect(result3).assertEqual(false); 
      // 1参（你重点需要的覆盖）
      result3 = apiAvailable(greaterMajor); 
      console.error('apiAvailable 1参大于 result:' + result3); 
      expect(result3).assertEqual(false); 

      // 补充：minor大于系统（major相等），验证二级版本对比逻辑
      result3 = apiAvailable(originMajor, originMinor + 1); 
      console.error('apiAvailable 2参(major相等,minor大) result:' + result3); 
      expect(result3).assertEqual(false); 
      // 补充：patch大于系统（major/minor相等），验证三级版本对比逻辑
      result3 = apiAvailable(originMajor, originMinor, originPatch + 1); 
      console.error('apiAvailable 3参(major/minor相等,patch大) result:' + result3); 
      expect(result3).assertEqual(false); 

      /************************ 第五部分：边界值校验-默认值0 ************************/
      console.error('--- 校验：默认值0的边界场景 ---');
      // 系统版本如果是 X.0.0，传仅X也能匹配（验证默认值生效）
      if (originMinor === 0 && originPatch === 0) {
        result = apiAvailable(originMajor);
        console.error('apiAvailable 边界：系统X.0.0传X result:' + result);
        expect(result).assertEqual(true);
      }
      // 传X.0 等效于 X.0.0（验证minor为0时patch默认0）
      result = apiAvailable(originMajor, 0);
      console.error('apiAvailable 边界：传X.0 result:' + result);
      expect(result).assertEqual(apiAvailable(originMajor, 0, 0));

      console.error(`${caseName} END`); 
      done(); 
    });

    /**
     * @tc.name   ACE_global_console_log_0100
     * @tc.number ACE_global_console_log_0100
     * @tc.desc   Test console log printing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_global_console_log_0100", Level.LEVEL0, async (done: Function) => {
      let casename: string = "ACE_global_001";
      console.log("-----------------------ACE_global_console_log Test is starting-----------------------");
      try {
        console.log("ACE_global_console_log test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_log Test end-----------------------");
      done()
    });
    /**
     * @tc.name   ACE_global_console_info_0100
     * @tc.number ACE_global_console_info_0100
     * @tc.desc   Test console info printing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_global_console_info_0100", Level.LEVEL0, async (done: Function) => {
      let casename: string = "ACE_global_002";
      console.log("-----------------------ACE_global_console_info Test is starting-----------------------");
      try {
        console.info("ACE_global_console_info test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_info Test end-----------------------");
      done()
    });
    /**
     * @tc.name   ACE_global_console_warn_0100
     * @tc.number ACE_global_console_warn_0100
     * @tc.desc   Test console warn printing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_global_console_warn_0100", Level.LEVEL0, async (done: Function) => {
      let casename: string = "ACE_global_003";
      console.log("-----------------------ACE_global_console_warn Test is starting-----------------------");
      try {
        console.warn("ACE_global_console_warn test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_warn Test end-----------------------");
      done()
    });
  })
}