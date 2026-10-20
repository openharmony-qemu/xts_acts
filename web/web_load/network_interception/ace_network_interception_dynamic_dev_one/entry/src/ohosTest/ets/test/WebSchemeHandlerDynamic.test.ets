/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 203100;
const CUSTOM_ERROR_CODE = 32159;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebSchemeHandlerDynamicTest() {
  describe('WebSchemeHandlerDynamic', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebSchemeHandlerDynamic',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!(pages.name == 'WebSchemeHandlerDynamic')) {
          await router.pushUrl(options);
        }
      } catch (err) {
        console.error('push WebSchemeHandlerDynamic page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebSchemeHandlerDynamic'), 10000);
      done();
    });

    beforeEach(async (done: Function) => {
      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        if (data.connState != wifiMg.ConnState.CONNECTED) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        }
      } catch (err) {
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      });
      done();
    });

    /**
     * @tc.name   testSetGetCustomErrorCode0100
     * @tc.number SUB_WEB_SCHEMEHANDLERRESPONSE_SETGETCUSTOMERRORCODE_0100
     * @tc.desc   test WebSchemeHandlerResponse setCustomErrorCode and getCustomErrorCode (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGetCustomErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testSetGetCustomErrorCode0100', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testSetGetCustomErrorCode0100', CUSTOM_ERROR_CODE, 203110, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        if (backData?.data?.ACTION === CUSTOM_ERROR_CODE) {
          expect(backData?.data?.ACTION).assertEqual(expected);
        } else {
          expect(backData?.data?.ACTION).assertEqual(0);
        }
      });
      await Utils.waitAndClickComponent(driver, 'WebSchemeHandlerDynamic');
      if (await Utils.waitForExist(() => isReturn, 'testSetGetCustomErrorCode0100_returnCheck', 1, 1000)) {
        done();
      }
    });

    /**
     * @tc.name   testResourceHandlerDidFail0100
     * @tc.number SUB_WEB_WEBRESOURCEHANDLER_DIDFAIL_0100
     * @tc.desc   test WebResourceHandler didFail (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResourceHandlerDidFail0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testResourceHandlerDidFail0100', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testResourceHandlerDidFail0100', true, 203120, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, 'WebSchemeHandlerDynamic');
      if (await Utils.waitForExist(() => isReturn, 'testResourceHandlerDidFail0100_returnCheck', 1, 3000)) {
        done();
      }
    });

    /**
     * @tc.name   testWebSchemeHandlerResponseClass0100
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_CLASS_0100
     * @tc.desc   test WebSchemeHandlerResponse class (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSchemeHandlerResponseClass0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testWebSchemeHandlerResponseClass0100', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testWebSchemeHandlerResponseClass0100', true, 203105, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, 'WebSchemeHandlerDynamic');
      if (await Utils.waitForExist(() => isReturn, 'testWebSchemeHandlerResponseClass0100_returnCheck', 1, 3000)) {
        done();
      }
    });
  });
}
