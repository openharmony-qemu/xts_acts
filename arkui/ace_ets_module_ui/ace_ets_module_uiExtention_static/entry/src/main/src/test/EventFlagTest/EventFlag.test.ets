'use static';
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/EventFlag/EventFlagIndex';
const PAGE_NAME = 'EventFlagIndex';

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

export default function EventFlagTest() {
  describe('EventFlagTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.dialog.select.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(SLEEP_TIME);
        const state = routerInstance.getState();
        if (state.name !== PAGE_NAME) {
          throw new Error('not in page ' + PAGE_NAME + ', current=' + state.name);
        }
      } catch (error) {
        console.error('EventFlagTest beforeEach error: ' + error);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number EventFlagTest_001
     * @tc.name eventNone
     * @tc.desc Verify EventFlag.EVENT_NONE enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('eventNone', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('eventNoneValue')).assertEqual('0');
      done();
    });

    /**
     * @tc.number EventFlagTest_002
     * @tc.name eventPanGestureLeft
     * @tc.desc Verify EventFlag.EVENT_PAN_GESTURE_LEFT enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('eventPanGestureLeft', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('eventPanGestureLeftValue')).assertEqual('1');
      done();
    });

    /**
     * @tc.number EventFlagTest_003
     * @tc.name eventPanGestureRight
     * @tc.desc Verify EventFlag.EVENT_PAN_GESTURE_RIGHT enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('eventPanGestureRight', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('eventPanGestureRightValue')).assertEqual('2');
      done();
    });

    /**
     * @tc.number EventFlagTest_004
     * @tc.name eventPanGestureUp
     * @tc.desc Verify EventFlag.EVENT_PAN_GESTURE_UP enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('eventPanGestureUp', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('eventPanGestureUpValue')).assertEqual('4');
      done();
    });

    /**
     * @tc.number EventFlagTest_005
     * @tc.name eventPanGestureDown
     * @tc.desc Verify EventFlag.EVENT_PAN_GESTURE_DOWN enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('eventPanGestureDown', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('eventPanGestureDownValue')).assertEqual('8');
      done();
    });

    /**
     * @tc.number EventFlagTest_006
     * @tc.name eventClick
     * @tc.desc Verify EventFlag.EVENT_CLICK enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('eventClick', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('eventClickValue')).assertEqual('256');
      done();
    });

    /**
     * @tc.number EventFlagTest_007
     * @tc.name eventLongPress
     * @tc.desc Verify EventFlag.EVENT_LONG_PRESS enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('eventLongPress', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('eventLongPressValue')).assertEqual('512');
      done();
    });
  });
}
