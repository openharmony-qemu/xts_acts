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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webFontTest() {

  describe('WebFontTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebFontTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebFontTest state success " + JSON.stringify(pages));
        if (!("WebFontTest" == pages.name)) {
          console.info("get WebFontTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebFontTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebFontTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebFontTestButton"), 10000);
      console.log("waitForComponent WebFontTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testWebStandardFont001
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0100
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont001", 150140)
      Utils.registerEvent("testWebStandardFont001", '"serif"', 150150, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont002
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0200
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont002", 150140)
      Utils.registerEvent("testWebStandardFont002", '"monospace"', 150160, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont003
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0300
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont003", 150140)
      Utils.registerEvent("testWebStandardFont003", '"Helvetica"', 150170, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont004
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0400
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont004", 150140)
      Utils.registerEvent("testWebStandardFont004", '"Arial"', 150180, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont005
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0500
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont005", 150140)
      Utils.registerEvent("testWebStandardFont005", '"\\"sans serif\\""', 150190, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont006
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0600
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont006", 150140)
      Utils.registerEvent("testWebStandardFont006", '"null"', 150200, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont007
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0700
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont007", 150140)
      Utils.registerEvent("testWebStandardFont007", true, 150210, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont008
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0800
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont008", 150140)
      Utils.registerEvent("testWebStandardFont008", true, 150220, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont009
     * @tc.number SUB_WEB_WEBSTANDARDFONT_0900
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont009", 150140)
      Utils.registerEvent("testWebStandardFont009", true, 150230, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })


    /**
     * @tc.name   testWebStandardFont010
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1000
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont010", 150140)
      Utils.registerEvent("testWebStandardFont010", true, 150240, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont011
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1100
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont011", 150140)
      Utils.registerEvent("testWebStandardFont011", true, 150250, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont012
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1200
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont012", 150140)
      Utils.registerEvent("testWebStandardFont012", true, 150260, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont013
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1300
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont013", 150140)
      Utils.registerEvent("testWebStandardFont013", true, 150270, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont014
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1400
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont014", 150140)
      Utils.registerEvent("testWebStandardFont014", true, 150280, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont015
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1500
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont015", 150140)
      Utils.registerEvent("testWebStandardFont015", true, 150290, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont016
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1600
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont016", 150140)
      Utils.registerEvent("testWebStandardFont016", true, 150300, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont017
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1700
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont017", 150140)
      Utils.registerEvent("testWebStandardFont017", true, 150310, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont018
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1800
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont018", 150140)
      Utils.registerEvent("testWebStandardFont018", true, 150320, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont019
     * @tc.number SUB_WEB_WEBSTANDARDFONT_1900
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont019", 150140)
      Utils.registerEvent("testWebStandardFont019", true, 150330, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont020
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2000
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont020", 150140)
      Utils.registerEvent("testWebStandardFont020", true, 150340, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont021
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2100
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont021", 150140)
      Utils.registerEvent("testWebStandardFont021", true, 150340, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont022
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2200
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont022", 150140)
      Utils.registerEvent("testWebStandardFont022", true, 150350, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont023
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2300
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont023", 150140)
      Utils.registerEvent("testWebStandardFont023", true, 150360, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont024
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2400
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont024", 150140)
      Utils.registerEvent("testWebStandardFont024", true, 150370, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont025
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2500
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont025", 150140)
      Utils.registerEvent("testWebStandardFont025", true, 150380, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont026
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2600
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont026", 150140)
      Utils.registerEvent("testWebStandardFont026", true, 150390, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont027
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2700
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont027", 150140)
      Utils.registerEvent("testWebStandardFont027", true, 150400, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont028
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2800
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont028", 150140)
      Utils.registerEvent("testWebStandardFont028", true, 150410, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont029
     * @tc.number SUB_WEB_WEBSTANDARDFONT_2900
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont029", 150140)
      Utils.registerEvent("testWebStandardFont029", true, 150420, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont030
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3000
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont030", 150140)
      Utils.registerEvent("testWebStandardFont030", true, 150430, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont031
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3100
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont031", 150140)
      Utils.registerEvent("testWebStandardFont031", true, 150440, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont032
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3200
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont032", 150140)
      Utils.registerEvent("testWebStandardFont032", true, 150450, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont033
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3300
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont033", 150140)
      Utils.registerEvent("testWebStandardFont033", true, 150460, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })


    /**
     * @tc.name   testWebStandardFont034
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3400
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont034", 150140)
      Utils.registerEvent("testWebStandardFont034", true, 150470, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })


    /**
     * @tc.name   testWebStandardFont035
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3500
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont035", 150140)
      Utils.registerEvent("testWebStandardFont035", true, 150480, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont036
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3600
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont036", 150140)
      Utils.registerEvent("testWebStandardFont036", true, 150490, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont037
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3700
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont037", 150140)
      Utils.registerEvent("testWebStandardFont037", true, 150500, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont038
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3800
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont038", 150140)
      Utils.registerEvent("testWebStandardFont038", true, 150510, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont039
     * @tc.number SUB_WEB_WEBSTANDARDFONT_3900
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont039", 150140)
      Utils.registerEvent("testWebStandardFont039", true, 150520, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont040
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4000
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont040", 150140)
      Utils.registerEvent("testWebStandardFont040", true, 150530, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont041
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4100
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont041", 150140)
      Utils.registerEvent("testWebStandardFont041", true, 150540, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont042
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4200
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont042", 150140)
      Utils.registerEvent("testWebStandardFont042", true, 150550, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont043
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4300
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont043", 150140)
      Utils.registerEvent("testWebStandardFont043", true, 150560, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont044
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4400
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont044", 150140)
      Utils.registerEvent("testWebStandardFont044", true, 150570, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont045
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4500
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont045", 150140)
      Utils.registerEvent("testWebStandardFont045", true, 150580, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont046
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4600
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont046", 150140)
      Utils.registerEvent("testWebStandardFont046", true, 150590, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont047
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4700
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont047", 150140)
      Utils.registerEvent("testWebStandardFont047", true, 150600, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })

    /**
     * @tc.name   testWebStandardFont048
     * @tc.number SUB_WEB_WEBSTANDARDFONT_4800
     * @tc.desc   test WebStandardFont
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebStandardFont048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebStandardFont048", 150140)
      Utils.registerEvent("testWebStandardFont048", true, 150610, done);
      let component = await driver.findComponent(ON.id("WebFontTestButton"));
      await component.click();
    })
  })
}
