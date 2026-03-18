'use static';
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON, Component } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/ChildrenMainSize/ChildrenMainSizeIndex';
const PAGE_NAME = 'ChildrenMainSizeIndex';

export default function ChildrenMainSizeTest() {
  describe('ChildrenMainSizeTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.common.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl(options);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number   getTest_static_0100
     * @tc.name     getTest_static_0100
     * @tc.desc     getTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('getTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('getTest_static_0100 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let getChildDefaultSize: Component = await driver.findComponent(ON.id('get_childDefaultSize')) as Component;
        expect(getChildDefaultSize !== null).assertTrue();
        await getChildDefaultSize.click();
        await CommonFunc.sleep(SLEEP_TIME);
        let get = inspector.getInspectorByKey('get');
        console.info('[getTest_static_0100] attrs is: ' +
          JSON.stringifyJsonElement(JSON.parseJsonElement(get).getElement('$attrs')));
        expect(JSON.parseJsonElement(get).getElement('$attrs').getString('content')).assertEqual('get childDefaultSize:0');
        console.info('[getTest_static_0100] END');
      } catch (error) {
        console.error('getTest_static_0100 error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   setTest_0100
     * @tc.number setTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('setTest_0100 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver: Driver = Driver.create();
        let setChildDefaultSize: Component = await driver.findComponent(ON.id('set_childDefaultSize')) as Component;
        expect(setChildDefaultSize !== null).assertTrue();
        await setChildDefaultSize.click();
        await CommonFunc.sleep(SLEEP_TIME);
        let set = inspector.getInspectorByKey('set');
        console.info('[setTest_0100] attrs is: ' +
          JSON.stringifyJsonElement(JSON.parseJsonElement(set).getElement('$attrs')));
        expect(JSON.parseJsonElement(set).getElement('$attrs').getString('content')).assertEqual('set childDefaultSize(150)');
        await CommonFunc.sleep(2000);
        console.info('[setTest_0100] END');
      } catch (error) {
        console.error('setTest_0100 error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
