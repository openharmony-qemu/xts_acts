import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();

export default function ExecuteAIPageCommandCheckTest() {
  describe('ExecuteAIPageCommandCheckTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ExecuteAIPageCommandCheckTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('ExecuteAIPageCommandCheckTest' == pages.name)) {
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
       * @tc.name   testGetUrlHistory001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0100
       * @tc.desc   test getUrlHistory command with valid params
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetUrlHistory001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testGetUrlHistory001', 148188)
        Utils.registerBaseEvent('testGetUrlHistory001', 10, 148500, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testGetUrlHistory002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0200
       * @tc.desc   test getUrlHistory command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetUrlHistory002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testGetUrlHistory002', 148188)
        Utils.registerBaseEvent('testGetUrlHistory002', 132, 148501, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })


      /**
       * @tc.name   testNavigate001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0300
       * @tc.desc   test navigate command with missing url param
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNavigate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testNavigate001', 148188)
        Utils.registerBaseEvent('testNavigate001', 391, 148502, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testNavigate002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0400
       * @tc.desc   test navigate command with empty url string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNavigate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testNavigate002', 148188)
        Utils.registerBaseEvent('testNavigate002', 391, 148503, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testNavigate003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0500
       * @tc.desc   test navigate command with unsupported protocol ftp
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNavigate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testNavigate003', 148188)
        Utils.registerBaseEvent('testNavigate003', 392, 148504, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testNavigate004
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0600
       * @tc.desc   test navigate command with valid about blank url
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNavigate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testNavigate004', 148188)
        Utils.registerBaseEvent('testNavigate004', 10, 148505, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testNavigate005
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0700
       * @tc.desc   test navigate command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNavigate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testNavigate005', 148188)
        Utils.registerBaseEvent('testNavigate005', 132, 148506, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testGoBack001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0800
       * @tc.desc   test goBack command when history exists
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGoBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testGoBack001', 148188)
        Utils.registerBaseEvent('testGoBack001', 10, 148507, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testGoBack002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0900
       * @tc.desc   test goBack command when cannot go back
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGoBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testGoBack002', 148188)
        Utils.registerBaseEvent('testGoBack002', 11, 148508, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testGoBack003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1000
       * @tc.desc   test goBack command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGoBack003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testGoBack003', 148188)
        Utils.registerBaseEvent('testGoBack003', 132, 148509, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testGoForward001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1100
       * @tc.desc   test goForward command when forward history exists
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGoForward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testGoForward001', 148188)
        Utils.registerBaseEvent('testGoForward001', 10, 148510, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testGoForward002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1200
       * @tc.desc   test goForward command when cannot go forward
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGoForward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testGoForward002', 148188)
        Utils.registerBaseEvent('testGoForward002', 11, 148511, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testGoForward003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1300
       * @tc.desc   test goForward command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGoForward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testGoForward003', 148188)
        Utils.registerBaseEvent('testGoForward003', 132, 148512, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1400
       * @tc.desc   test addPageAnnotation command with missing params
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation001', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation001', 110, 148513, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1500
       * @tc.desc   test addPageAnnotation command with empty params missing elementList
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation002', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation002', 391, 148514, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1600
       * @tc.desc   test addPageAnnotation command with empty elementList array
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation003', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation003', 392, 148515, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation004
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1700
       * @tc.desc   test addPageAnnotation command with elementList not array
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation004', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation004', 392, 148516, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation005
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1800
       * @tc.desc   test addPageAnnotation command with elementList containing empty string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation005', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation005', 392, 148517, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation006
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1900
       * @tc.desc   test addPageAnnotation command with elementList containing non-string items
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation006', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation006', 392, 148518, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation007
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2000
       * @tc.desc   test addPageAnnotation command with valid elementList format
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation007', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation007', 10, 148519, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation008
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2100
       * @tc.desc   test addPageAnnotation command with multiple elementList on annotation fixture
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation008', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation008', 10, 148520, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testAddPageAnnotation009
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2200
       * @tc.desc   test addPageAnnotation command with browser or frame is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testAddPageAnnotation009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testAddPageAnnotation009', 148188)
        Utils.registerBaseEvent('testAddPageAnnotation009', 132, 148521, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testRemovePageAnnotation001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2300
       * @tc.desc   test removePageAnnotation command after annotation added
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRemovePageAnnotation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testRemovePageAnnotation001', 148188)
        Utils.registerBaseEvent('testRemovePageAnnotation001', 10, 148522, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testRemovePageAnnotation002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2400
       * @tc.desc   test removePageAnnotation command when no overlay exists
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRemovePageAnnotation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testRemovePageAnnotation002', 148188)
        Utils.registerBaseEvent('testRemovePageAnnotation002', 11, 148523, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testRemovePageAnnotation003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2500
       * @tc.desc   test removePageAnnotation command with browser or frame is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRemovePageAnnotation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testRemovePageAnnotation003', 148188)
        Utils.registerBaseEvent('testRemovePageAnnotation003', 132, 148524, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testRemovePageAnnotation004
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2600
       * @tc.desc   test removePageAnnotation command with annotation command failed
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRemovePageAnnotation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testRemovePageAnnotation004', 148188)
        Utils.registerBaseEvent('testRemovePageAnnotation004', 11, 148525, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testScreenCapture001
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2700
       * @tc.desc   test screenCapture command with unknown clip param defaults to viewport capture
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScreenCapture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScreenCapture001', 148188)
        Utils.registerBaseEvent('testScreenCapture001', 392, 148526, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testScreenCapture002
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2800
       * @tc.desc   test screenCapture command with valid clip params on screencapture fixture
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScreenCapture002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScreenCapture002', 148188)
        Utils.registerBaseEvent('testScreenCapture002', 10, 148527, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

      /**
       * @tc.name   testScreenCapture003
       * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2900
       * @tc.desc   test screenCapture command with browser or host is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testScreenCapture003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent('testScreenCapture003', 148188)
        Utils.registerBaseEvent('testScreenCapture003', 132, 148528, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
          });
        Utils.waitAndClickComponent('CheckTestButton', driver)
      })

  });
}
