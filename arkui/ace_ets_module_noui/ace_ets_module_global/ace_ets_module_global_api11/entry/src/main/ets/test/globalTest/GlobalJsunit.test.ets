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
     * @tc.number ACE_global_apiAvailable_001
     * @tc.name ACE_global_apiAvailable_001
     * @tc.desc Test apiAvailable 
     */
    it('ACE_global_apiAvailable_001', Level.LEVEL0, async (done: Function) => {
      let caseName: string = "ACE_global_apiAvailable"
      console.error(`${caseName} START`);

      const originMajor = deviceInfo.sdkApiVersion;
      const originMinor = deviceInfo.sdkMinorApiVersion;
      const originPatch = deviceInfo.sdkPatchApiVersion;
      console.error('apiAvailable, origin major:' + originMajor + ', minor:' +
        originMinor + ', patch:' + originPatch);

      /************************ 第一部分：非法传参校验 ************************/
      // 2. 数值非法：传负数、超大数
      console.error('--- 校验：传入数字类型的非法数值 ---');
      let result = apiAvailable(-1); // major负数
      expect(result).assertEqual(false);
      result = apiAvailable(originMajor, -2); // minor负数
      expect(result).assertEqual(false);
      result = apiAvailable(originMajor, originMinor, -3); // patch负数
      expect(result).assertEqual(false);
      result = apiAvailable(1000); // major超大数
      expect(result).assertEqual(false);
      result = apiAvailable(originMajor, 1000); // minor超大数
      expect(result).assertEqual(false);
      result = apiAvailable(originMajor, originMinor, 1000); // patch超大数
      expect(result).assertEqual(false);
      /************************ 第二部分：合法传参-版本相等 ************************/
      console.error('--- 校验：合法传参，版本号等于系统版本 ---');
      // 3参：完整版本号
      result = apiAvailable(originMajor, originMinor, originPatch);
      expect(result).assertEqual(true);
      // 2参：major+minor，patch默认0
      result = apiAvailable(originMajor, originMinor);
      expect(result).assertEqual(true);
      // 1参：仅major，minor/patch默认0
      result = apiAvailable(originMajor);
      expect(result).assertEqual(true);

      /************************ 第三部分：边界值校验-默认值0 ************************/
      console.error('--- 校验：默认值0的边界场景 ---');
      // 系统版本如果是 X.0.0，传仅X也能匹配（验证默认值生效）
      if (originMinor === 0 && originPatch === 0) {
        result = apiAvailable(originMajor);
        console.error('apiAvailable 边界：系统X.0.0传X result:' + result);
        expect(result).assertEqual(true);
      }
      // 传X.0 等效于 X.0.0（验证minor为0时patch默认0）
      result = apiAvailable(originMajor, 0);
      expect(result).assertEqual(apiAvailable(originMajor, 0, 0));

      console.error(`${caseName} END`);
      done();
    });

    /**
     * @tc.number ACE_global_apiAvailable_002
     * @tc.name ACE_global_apiAvailable_002
     * @tc.desc Test apiAvailable
     */
    it('ACE_global_apiAvailable_002', Level.LEVEL0, async (done: Function) => {
      let caseName: string = "ACE_global_apiAvailable"
      console.error(`${caseName} START`);

      const originMajor = deviceInfo.sdkApiVersion;
      const originMinor = deviceInfo.sdkMinorApiVersion;
      const originPatch = deviceInfo.sdkPatchApiVersion;
      console.error('apiAvailable, origin major:' + originMajor + ', minor:' +
        originMinor + ', patch:' + originPatch);

      /************************ 第一部分：合法传参-版本小于系统 ************************/
      console.error('--- 校验：合法传参，版本号小于系统版本 ---');
      let lessMajor = originMajor - 1; // major减1
      // 3参
      let result: boolean = apiAvailable(lessMajor, originMinor, originPatch);
      expect(result).assertEqual(true);
      // 2参
      result = apiAvailable(lessMajor, originMinor);
      expect(result).assertEqual(true);
      // 1参
      result = apiAvailable(lessMajor);
      expect(result).assertEqual(true);

      // 补充：minor小于系统（major相等），验证二级版本对比逻辑
      result = apiAvailable(originMajor, originMinor - 1);
      expect(result).assertEqual(true);
      // 补充：patch小于系统（major/minor相等），验证三级版本对比逻辑
      result = apiAvailable(originMajor, originMinor, originPatch - 1);
      expect(result).assertEqual(true);

      /************************ 第二部分：合法传参-版本大于系统 ************************/
      console.error('--- 校验：合法传参，版本号大于系统版本 ---');
      let greaterMajor = originMajor + 1; // major加1
      // 3参
      result = apiAvailable(greaterMajor, originMinor, originPatch);
      expect(result).assertEqual(false);
      // 2参
      result = apiAvailable(greaterMajor, originMinor);
      expect(result).assertEqual(false);
      result = apiAvailable(greaterMajor);
      expect(result).assertEqual(false);

      // 补充：minor大于系统（major相等），验证二级版本对比逻辑
      result = apiAvailable(originMajor, originMinor + 1);
      expect(result).assertEqual(false);
      // 补充：patch大于系统（major/minor相等），验证三级版本对比逻辑
      result = apiAvailable(originMajor, originMinor, originPatch + 1);
      expect(result).assertEqual(false);

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