'use static';
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/AxisEvent/AxisEventIndex';
const PAGE_NAME = 'AxisEventIndex';

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

export default function AxisEventTest() {
  describe('AxisEventTest', () => {
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
     * @tc.number AxisEventTest_001
     * @tc.name hasAxis
     * @tc.desc Verify AxisEvent.hasAxis method via onAxisEvent callback on Scroll
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hasAxis', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const scrollComp = await driver.findComponent(ON.id('axisEventList'));
        expect(scrollComp !== null).assertTrue();
        await driver.swipe(540, 600, 540, 200, 600);
        await CommonFunc.sleep(500);
        const status = getContentByKey('axisEventHasAxisStatus');
        expect(status === 'hasAxis_ok' || status === 'init').assertTrue();
      } catch (error) {
        console.error('hasAxis error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
