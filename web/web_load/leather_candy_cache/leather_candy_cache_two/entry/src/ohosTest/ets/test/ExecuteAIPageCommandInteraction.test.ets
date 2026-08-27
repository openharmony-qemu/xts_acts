import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();

export default function ExecuteAIPageCommandInteractionTest() {
  describe('ExecuteAIPageCommandInteractionTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ExecuteAIPageCommandInteractionTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('ExecuteAIPageCommandInteractionTest' == pages.name)) {
          let result = await router.pushUrl(options);
          console.info('push page success');
        }
      } catch (err) {
        console.error('push page error: ' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info('beforeEach start');
      done();
    })


      /**
       * @tc.name   testDispatchMouse001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0100
       * @tc.desc   test dispatchMouseEvent command with mousePressed type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse001', 148188)
        Utils.registerBaseEvent('testDispatchMouse001', 10, 148200, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0200
       * @tc.desc   test dispatchMouseEvent command with mouseWheel type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse002', 148188)
        Utils.registerBaseEvent('testDispatchMouse002', 10, 148201, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0300
       * @tc.desc   test dispatchMouseEvent command with invalid type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse003', 148188)
        Utils.registerBaseEvent('testDispatchMouse003', 392, 148202, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse004
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0400
       * @tc.desc   test dispatchMouseEvent command with missing type param
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse004', 148188)
        Utils.registerBaseEvent('testDispatchMouse004', 391, 148203, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse005
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0500
       * @tc.desc   test dispatchMouseEvent command with mouseReleased type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse005', 148188)
        Utils.registerBaseEvent('testDispatchMouse005', 10, 148204, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse006
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0600
       * @tc.desc   test dispatchMouseEvent command with mouseMoved type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse006', 148188)
        Utils.registerBaseEvent('testDispatchMouse006', 10, 148205, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse007
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0700
       * @tc.desc   test dispatchMouseEvent command with params not object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse007', 148188)
        Utils.registerBaseEvent('testDispatchMouse007', 110, 148206, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse008
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0800
       * @tc.desc   test dispatchMouseEvent command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse008', 148188)
        Utils.registerBaseEvent('testDispatchMouse008', 132, 148207, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse009
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_0900
       * @tc.desc   test dispatchMouseEvent command with missing y param
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse009', 148188)
        Utils.registerBaseEvent('testDispatchMouse009', 391, 148208, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse010
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1000
       * @tc.desc   test dispatchMouseEvent command with type not string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse010', 148188)
        Utils.registerBaseEvent('testDispatchMouse010', 392, 148209, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse011
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1100
       * @tc.desc   test dispatchMouseEvent command with x not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse011', 148188)
        Utils.registerBaseEvent('testDispatchMouse011', 392, 148210, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse012
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1200
       * @tc.desc   test dispatchMouseEvent command with y not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse012', 148188)
        Utils.registerBaseEvent('testDispatchMouse012', 392, 148211, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse013
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1300
       * @tc.desc   test dispatchMouseEvent command with timestamp not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse013', 148188)
        Utils.registerBaseEvent('testDispatchMouse013', 392, 148212, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse014
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1400
       * @tc.desc   test dispatchMouseEvent command with force not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse014', 148188)
        Utils.registerBaseEvent('testDispatchMouse014', 392, 148213, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse015
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1500
       * @tc.desc   test dispatchMouseEvent command with tangentialPressure not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse015', 148188)
        Utils.registerBaseEvent('testDispatchMouse015', 392, 148214, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse016
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1600
       * @tc.desc   test dispatchMouseEvent command with tiltX not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse016', 148188)
        Utils.registerBaseEvent('testDispatchMouse016', 392, 148215, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse017
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1700
       * @tc.desc   test dispatchMouseEvent command with tiltY not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse017', 148188)
        Utils.registerBaseEvent('testDispatchMouse017', 392, 148216, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse018
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1800
       * @tc.desc   test dispatchMouseEvent command with deltaX not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse018', 148188)
        Utils.registerBaseEvent('testDispatchMouse018', 392, 148217, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse019
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_1900
       * @tc.desc   test dispatchMouseEvent command with deltaY not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse019', 148188)
        Utils.registerBaseEvent('testDispatchMouse019', 392, 148218, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse020
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2000
       * @tc.desc   test dispatchMouseEvent command with modifiers not integer
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse020', 148188)
        Utils.registerBaseEvent('testDispatchMouse020', 392, 148219, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse021
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2100
       * @tc.desc   test dispatchMouseEvent command with buttons not integer
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse021', 148188)
        Utils.registerBaseEvent('testDispatchMouse021', 392, 148220, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse022
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2200
       * @tc.desc   test dispatchMouseEvent command with clickCount not integer
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse022', 148188)
        Utils.registerBaseEvent('testDispatchMouse022', 392, 148221, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse023
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2300
       * @tc.desc   test dispatchMouseEvent command with twist not integer
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse023', 148188)
        Utils.registerBaseEvent('testDispatchMouse023', 392, 148222, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse024
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2400
       * @tc.desc   test dispatchMouseEvent command with button invalid value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse024', 148188)
        Utils.registerBaseEvent('testDispatchMouse024', 392, 148223, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse025
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2500
       * @tc.desc   test dispatchMouseEvent command with pointerType not string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchMouse025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse025', 148188)
        Utils.registerBaseEvent('testDispatchMouse025', 392, 148224, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchMouse026
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2600
       * @tc.desc   test dispatchMouseEvent command with pointerType not mouse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level   LEVEL1
       */
      it('testDispatchMouse026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchMouse026', 148188)
        Utils.registerBaseEvent('testDispatchMouse026', 392, 148225, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2700
       * @tc.desc   test dispatchKeyEvent command with keyDown type and key A
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey001', 148188)
        Utils.registerBaseEvent('testDispatchKey001', 10, 148226, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2800
       * @tc.desc   test dispatchKeyEvent command with invalid type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey002', 148188)
        Utils.registerBaseEvent('testDispatchKey002', 392, 148227, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_2900
       * @tc.desc   test dispatchKeyEvent command with missing type param
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey003', 148188)
        Utils.registerBaseEvent('testDispatchKey003', 391, 148228, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey004
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3000
       * @tc.desc   test dispatchKeyEvent command with keyUp type and key A
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey004', 148188)
        Utils.registerBaseEvent('testDispatchKey004', 10, 148229, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey005
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3100
       * @tc.desc   test dispatchKeyEvent command with rawKeyDown type and key A
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey005', 148188)
        Utils.registerBaseEvent('testDispatchKey005', 10, 148230, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey006
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3200
       * @tc.desc   test dispatchKeyEvent command with char type and key A
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey006', 148188)
        Utils.registerBaseEvent('testDispatchKey006', 10, 148231, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey007
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3300
       * @tc.desc   test dispatchKeyEvent command with params not object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey007', 148188)
        Utils.registerBaseEvent('testDispatchKey007', 110, 148232, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey008
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3400
       * @tc.desc   test dispatchKeyEvent command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey008', 148188)
        Utils.registerBaseEvent('testDispatchKey008', 132, 148233, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey009
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3500
       * @tc.desc   test dispatchKeyEvent command with type not string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey009', 148188)
        Utils.registerBaseEvent('testDispatchKey009', 392, 148234, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey010
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3600
       * @tc.desc   test dispatchKeyEvent command with text not string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey010', 148188)
        Utils.registerBaseEvent('testDispatchKey010', 392, 148235, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey011
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3700
       * @tc.desc   test dispatchKeyEvent command with unmodifiedText not string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey011', 148188)
        Utils.registerBaseEvent('testDispatchKey011', 392, 148236, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey012
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3800
       * @tc.desc   test dispatchKeyEvent command with key not string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey012', 148188)
        Utils.registerBaseEvent('testDispatchKey012', 392, 148237, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey013
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_3900
       * @tc.desc   test dispatchKeyEvent command with code not string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey013', 148188)
        Utils.registerBaseEvent('testDispatchKey013', 392, 148238, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey014
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4000
       * @tc.desc   test dispatchKeyEvent command with timestamp not number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey014', 148188)
        Utils.registerBaseEvent('testDispatchKey014', 392, 148239, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey015
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4100
       * @tc.desc   test dispatchKeyEvent command with modifiers not integer
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey015', 148188)
        Utils.registerBaseEvent('testDispatchKey015', 392, 148240, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey016
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4200
       * @tc.desc   test dispatchKeyEvent command with windowsVirtualKeyCode not integer
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey016', 148188)
        Utils.registerBaseEvent('testDispatchKey016', 392, 148241, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey017
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4300
       * @tc.desc   test dispatchKeyEvent command with nativeVirtualKeyCode not integer
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey017', 148188)
        Utils.registerBaseEvent('testDispatchKey017', 392, 148242, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey018
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4400
       * @tc.desc   test dispatchKeyEvent command with location not integer
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey018', 148188)
        Utils.registerBaseEvent('testDispatchKey018', 392, 148243, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey019
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4500
       * @tc.desc   test dispatchKeyEvent command with autoRepeat not boolean
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey019', 148188)
        Utils.registerBaseEvent('testDispatchKey019', 392, 148244, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey020
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4600
       * @tc.desc   test dispatchKeyEvent command with isKeypad not boolean
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey020', 148188)
        Utils.registerBaseEvent('testDispatchKey020', 392, 148245, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey021
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4700
       * @tc.desc   test dispatchKeyEvent command with isSystemKey not boolean
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey021', 148188)
        Utils.registerBaseEvent('testDispatchKey021', 392, 148246, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey022
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4800
       * @tc.desc   test dispatchKeyEvent command with isForwarded not boolean
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey022', 148188)
        Utils.registerBaseEvent('testDispatchKey022', 392, 148247, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testDispatchKey023
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_4900
       * @tc.desc   test dispatchKeyEvent command with commands not array
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDispatchKey023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testDispatchKey023', 148188)
        Utils.registerBaseEvent('testDispatchKey023', 392, 148248, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5000
       * @tc.desc   test input command with valid xpath, type text and value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput001', 148188)
        Utils.registerBaseEvent('testInput001', 10, 148249, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5100
       * @tc.desc   test input command with valid xpath, type number and value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput002', 148188)
        Utils.registerBaseEvent('testInput002', 10, 148250, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5200
       * @tc.desc   test input command with empty params (missing xpath)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput003', 148188)
        Utils.registerBaseEvent('testInput003', 391, 148251, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput004
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5300
       * @tc.desc   test input command with missing xpath/id param
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput004', 148188)
        Utils.registerBaseEvent('testInput004', 391, 148252, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput005
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5400
       * @tc.desc   test input command with xpath field not string type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput005', 148188)
        Utils.registerBaseEvent('testInput005', 392, 148253, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput006
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5500
       * @tc.desc   test input command with value field not string type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput006', 148188)
        Utils.registerBaseEvent('testInput006', 201, 148254, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput007
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5600
       * @tc.desc   test input command with unsupported input type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput007', 148188)
        Utils.registerBaseEvent('testInput007', 202, 148255, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput008
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5700
       * @tc.desc   test input command with invalid value format for number type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput008', 148188)
        Utils.registerBaseEvent('testInput008', 203, 148256, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput009
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5800
       * @tc.desc   test input command with input type mismatch with actual element
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput009', 148188)
        Utils.registerBaseEvent('testInput009', 204, 148257, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput010
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_5900
       * @tc.desc   test input command with id and xpath both provided
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput010', 148188)
        Utils.registerBaseEvent('testInput010', 392, 148258, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput011
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6000
       * @tc.desc   test input command with default type and value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput011', 148188)
        Utils.registerBaseEvent('testInput011', 10, 148259, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput012
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6100
       * @tc.desc   test input command with email type and value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput012', 148188)
        Utils.registerBaseEvent('testInput012', 10, 148260, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput013
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6200
       * @tc.desc   test input command with date type and value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput013', 148188)
        Utils.registerBaseEvent('testInput013', 10, 148261, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput014
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6300
       * @tc.desc   test input command with params not object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput014', 148188)
        Utils.registerBaseEvent('testInput014', 110, 148262, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput015
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6400
       * @tc.desc   test input command with xpath not matching any element
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput015', 148188)
        Utils.registerBaseEvent('testInput015', 131, 148263, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput016
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6500
       * @tc.desc   test input command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput016', 148188)
        Utils.registerBaseEvent('testInput016', 132, 148264, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput017
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6600
       * @tc.desc   test input command with target element not input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput017', 148188)
        Utils.registerBaseEvent('testInput017', 161, 148265, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput018
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6700
       * @tc.desc   test input command with checkbox type mismatch
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput018', 148188)
        Utils.registerBaseEvent('testInput018', 202, 148266, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput019
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6800
       * @tc.desc   test input command with missing type param
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput019', 148188)
        Utils.registerBaseEvent('testInput019', 391, 148267, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput020
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_6900
       * @tc.desc   test input command with id not string type
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput020', 148188)
        Utils.registerBaseEvent('testInput020', 392, 148268, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput021
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7000
       * @tc.desc   test input command with xpath empty string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput021', 148188)
        Utils.registerBaseEvent('testInput021', 392, 148269, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testInput022
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7100
       * @tc.desc   test input command with type not string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testInput022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testInput022', 148188)
        Utils.registerBaseEvent('testInput022', 392, 148270, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7200
       * @tc.desc   test scroll command with x, y and deltaY params
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll001', 148188)
        Utils.registerBaseEvent('testScroll001', 10, 148271, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7300
       * @tc.desc   test scroll command with empty params
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll002', 148188)
        Utils.registerBaseEvent('testScroll002', 391, 148272, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7400
       * @tc.desc   test scroll command with partial params (only x)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll003', 148188)
        Utils.registerBaseEvent('testScroll003', 391, 148273, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll004
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7500
       * @tc.desc   test scroll command with params not JSON object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll004', 148188)
        Utils.registerBaseEvent('testScroll004', 110, 148274, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll005
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7600
       * @tc.desc   test scroll command with valid-format id that does not exist
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll005', 148188)
        Utils.registerBaseEvent('testScroll005', 131, 148275, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll006
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7700
       * @tc.desc   test scroll command with invalid-format id
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll006', 148188)
        Utils.registerBaseEvent('testScroll006', 392, 148276, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll007
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7800
       * @tc.desc   test scroll command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll007', 148188)
        Utils.registerBaseEvent('testScroll007', 132, 148277, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll008
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_7900
       * @tc.desc   test scroll command with valid x, y and deltaY params
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll008', 148188)
        Utils.registerBaseEvent('testScroll008', 10, 148278, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testScroll009
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8000
       * @tc.desc   test scroll command with speed equals 0
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScroll009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScroll009', 148188)
        Utils.registerBaseEvent('testScroll009', 392, 148279, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8100
       * @tc.desc   test select command with valid xpath and indexes
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect001', 148188)
        Utils.registerBaseEvent('testSelect001', 10, 148280, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8200
       * @tc.desc   test select command with valid xpath and values
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect002', 148188)
        Utils.registerBaseEvent('testSelect002', 10, 148281, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8300
       * @tc.desc   test select command with empty params (missing xpath)
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect003', 148188)
        Utils.registerBaseEvent('testSelect003', 115, 148282, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect004
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8400
       * @tc.desc   test select command with params not JSON object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect004', 148188)
        Utils.registerBaseEvent('testSelect004', 110, 148283, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect005
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8500
       * @tc.desc   test select command with element not found
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect005', 148188)
        Utils.registerBaseEvent('testSelect005', 131, 148284, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect006
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8600
       * @tc.desc   test select command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect006', 148188)
        Utils.registerBaseEvent('testSelect006', 132, 148285, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect007
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8700
       * @tc.desc   test select command with target element is not select
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect007', 148188)
        Utils.registerBaseEvent('testSelect007', 161, 148286, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect008
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8800
       * @tc.desc   test select command with indexes and values both empty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect008', 148188)
        Utils.registerBaseEvent('testSelect008', 251, 148287, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect009
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_8900
       * @tc.desc   test select command with index out of bounds
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect009', 148188)
        Utils.registerBaseEvent('testSelect009', 252, 148288, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect010
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_9000
       * @tc.desc   test select command with value not found in options
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect010', 148188)
        Utils.registerBaseEvent('testSelect010', 253, 148289, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect011
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_9100
       * @tc.desc   test select command with single select with multiple indexes
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect011', 148188)
        Utils.registerBaseEvent('testSelect011', 254, 148290, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect012
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_9200
       * @tc.desc   test select command with selected option is disabled
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect012', 148188)
        Utils.registerBaseEvent('testSelect012', 255, 148291, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

      /**
       * @tc.name   testSelect013
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_INTERACTION_9300
       * @tc.desc   test select command with id and xpath both provided
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSelect013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testSelect013', 148188)
        Utils.registerBaseEvent('testSelect013', 392, 148292, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('InteractionTestButton', driver)
      })

  });
}
