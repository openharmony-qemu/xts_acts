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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import util from '@ohos.util';
import worker, { MessageEvents } from '@ohos.worker';
import testNapi from 'libentry.so';
import { hiAppEvent } from '@kit.PerformanceAnalysisKit';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

function blockSleep(duration: number) {
  duration = duration * 1000;
  const start = Date.now();
  while (Date.now() - start < duration) {}
}

async function dumpAndCheckMtEvent(
  tag: string,
  expectedSanitizerType: string
): Promise<Array<hiAppEvent.AppEventInfo>> {
  const matchedEvents: Array<hiAppEvent.AppEventInfo> = [];

  const watcher: hiAppEvent.Watcher = {
    name: 'ADDRESS_SANITIZER_WATCHER',
    appEventFilters: [
      {
        domain: hiAppEvent.domain.OS,
        names: [hiAppEvent.event.ADDRESS_SANITIZER]
      }
    ],
    onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
      console.info(`${tag} onReceive fired: domain=${domain}`);
      for (const group of appEventGroups) {
        console.info(`${tag} group name=${group.name}`);
        for (const evInfo of group.appEventInfos) {
          console.info(`${tag} received event: domain=${evInfo.domain} name=${evInfo.name}`);
          const paramsObj = evInfo.params as Record<string, string>;
          const typeInParams = paramsObj['type'] ?? '';
          if (typeInParams === expectedSanitizerType) {
            matchedEvents.push(evInfo);
          }
        }
      }
    }
  };
  hiAppEvent.addWatcher(watcher);

  try {
    testNapi.saveMainEnv();
    testNapi.createSubEnv();
    try {
      testNapi.add(2, 3);
    } finally {
      try { testNapi.destroyEnv(); } catch (e) { }
    }
    const deadline: number = Date.now() + 5000;
    while (matchedEvents.length === 0 && Date.now() < deadline) {
      await sleep(200);
    }
    expect(matchedEvents.length).assertLarger(0);
    return matchedEvents;
  } finally {
    hiAppEvent.removeWatcher(watcher);
  }
}

@Concurrent
function taskpoolFunc() {
  let stackTrace = util.getMainThreadStackTrace();
  return stackTrace;
}

export default function arkTSVMTest() {
  describe('arkTSVMTest', () => {

    /**
     * @tc.name   testGetMainThreadStackTrace001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2570
     * @tc.desc   Testing the getMainThreadStackTrace interface in main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMainThreadStackTrace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let recursion = (n: number): string => {
        if (n == 1) {
          return util.getMainThreadStackTrace();
        }
        return recursion(n - 1);
      }
      let stackTrace = recursion(10);
      expect(stackTrace).assertContain('getMainThreadStackTrace');
    });

    /**
     * @tc.name   testGetMainThreadStackTrace002
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2580
     * @tc.desc   Testing the getMainThreadStackTrace interface in worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMainThreadStackTrace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let stackTrace = "";
      let isTerminate = false;
      let newWorker = new worker.ThreadWorker('./worker.ets');
      newWorker.onexit = () => {
        isTerminate = true;
      }
      newWorker.onmessage = (e: MessageEvents): void => {
        stackTrace = e.data;
        newWorker.terminate();
      }
      let recursion = (n: number): void => {
        if (n == 1) {
          newWorker.postMessage("");
          blockSleep(1);
          return;
        }
        return recursion(n - 1);
      }
      recursion(10);
      while (!isTerminate) {
        await sleep(100);
      }
      expect(stackTrace).assertContain('blockSleep');
      done();
    });

    /**
     * @tc.name   testGetMainThreadStackTrace003
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2590
     * @tc.desc   Testing the getMainThreadStackTrace interface in taskpool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetMainThreadStackTrace003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let task = new taskpool.Task(taskpoolFunc);
      let recursion = (n: number): void => {
        if (n == 1) {
          blockSleep(1);
          return;
        }
        return recursion(n - 1);
      }
      taskpool.execute(task).then(
        (value: object) => {
          expect(value).assertContain('blockSleep');
        }
      )
      recursion(10);
      let stackTrace = await taskpool.execute(task);
      expect(stackTrace).assertEqual('');
      done();
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2600
     * @tc.desc   Set multithreading detection to on and off.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetMultithreadingDetectionEnabled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      util.ArkTSVM.setMultithreadingDetectionEnabled(true);
      let task = new taskpool.Task(taskpoolFunc);
      let recursion = (n: number): void => {
        if (n == 1) {
          blockSleep(1);
          return;
        }
        return recursion(n - 1);
      }
      taskpool.execute(task).then(
        (value: object) => {
          expect(value).assertContain('blockSleep');
        }
      )
      recursion(10);
      let stackTrace = await taskpool.execute(task);
      expect(stackTrace).assertEqual('');
      util.ArkTSVM.setMultithreadingDetectionEnabled(false);
      done();
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2610
     * @tc.desc   Set multithreading detection with abort=false, use subEnv on main thread
     *             to trigger VM cross-thread access, verify faultlog is generated and
     *             process does not crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetMultithreadingDetectionEnabled0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let options: util.MultithreadingDetectionOptions = {
        abort: false,
        frequency: 150,
        interval: 0
      };
      util.ArkTSVM.setMultithreadingDetectionEnabled(true, options);
      try {
        await dumpAndCheckMtEvent('testSetMultithreadingDetectionEnabled0002', 'ARKTS_ENVSAN');
      } finally {
        util.ArkTSVM.setMultithreadingDetectionEnabled(false);
      }
      done();
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2620
     * @tc.desc   Set multithreading detection with custom frequency and interval.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testSetMultithreadingDetectionEnabled0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let options: util.MultithreadingDetectionOptions = {
          abort: true,
          frequency: 200,
          interval: 10
        };
        util.ArkTSVM.setMultithreadingDetectionEnabled(true, options);
        util.ArkTSVM.setMultithreadingDetectionEnabled(false);
        expect(true).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2630
     * @tc.desc   Set multithreading detection with no options (default values).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testSetMultithreadingDetectionEnabled0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        util.ArkTSVM.setMultithreadingDetectionEnabled(true);
        util.ArkTSVM.setMultithreadingDetectionEnabled(false);
        expect(true).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2640
     * @tc.desc   Set multithreading detection with empty options object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testSetMultithreadingDetectionEnabled0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let options: util.MultithreadingDetectionOptions = {};
        util.ArkTSVM.setMultithreadingDetectionEnabled(true, options);
        util.ArkTSVM.setMultithreadingDetectionEnabled(false);
        expect(true).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2650
     * @tc.desc   Set multithreading detection with boundary interval value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testSetMultithreadingDetectionEnabled0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let options: util.MultithreadingDetectionOptions = {
          interval: 0
        };
        util.ArkTSVM.setMultithreadingDetectionEnabled(true, options);
        util.ArkTSVM.setMultithreadingDetectionEnabled(false);
        expect(true).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2660
     * @tc.desc   Set multithreading detection with invalid frequency (below minimum 100),
     *             invalid value is ignored and original config is preserved, no exception thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMultithreadingDetectionEnabled0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let options: util.MultithreadingDetectionOptions = {
          abort: true,
          frequency: 50,
          interval: 5
        };
        util.ArkTSVM.setMultithreadingDetectionEnabled(true, options);
        util.ArkTSVM.setMultithreadingDetectionEnabled(false);
        expect(true).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2670
     * @tc.desc   Set multithreading detection with invalid interval (exceeds max 1440),
     *             invalid value is ignored and original config is preserved, no exception thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMultithreadingDetectionEnabled0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let options: util.MultithreadingDetectionOptions = {
          abort: true,
          frequency: 100,
          interval: 2000
        };
        util.ArkTSVM.setMultithreadingDetectionEnabled(true, options);
        util.ArkTSVM.setMultithreadingDetectionEnabled(false);
        expect(true).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testSetMultithreadingDetectionEnabled0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2680
     * @tc.desc   Set multithreading detection enabled=false with options, options should not be applied.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetMultithreadingDetectionEnabled0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let options: util.MultithreadingDetectionOptions = {
          abort: false,
          frequency: 200,
          interval: 10
        };
        util.ArkTSVM.setMultithreadingDetectionEnabled(false, options);
        expect(true).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testEnableLocalHandleDetection001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL1_2700
     * @tc.desc   Enable local handle detection with no parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableLocalHandleDetection001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testEnableLocalHandleDetection001';
      try {
        util.ArkTSVM.enableLocalHandleDetection();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${err.code}`);
        expect().assertFail();
      }
    });
  })
}
