import { hilog, hiAppEvent } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import testNapi from 'libentry.so'

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
}

export default function HiAppEventExternalLog() {
  describe('HiAppEventExternalLog', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'beforeAll called');
    })
    beforeEach(() => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'beforeEach called');
    })
    afterEach(() => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'afterEach called');
    })
    afterAll(() => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'afterAll called');
    })

    /**
     * @tc.name hiAppEventRegisterExternalLogManager010
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_0100
     * @tc.desc Test isExternalLogManagerRegistered - false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hiAppEventRegisterExternalLogManager010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'registerExternalLogManager test start');
      let registered: boolean = hiAppEvent.isExternalLogManagerRegistered();
      hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] isExternalLogManagerRegistered: %{public}s', registered.toString());
      expect(registered == false).assertTrue();
      done();
    });

    /**
     * @tc.name hiAppEventRegisterExternalLogManager020
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_0200
     * @tc.desc Test isExternalLogManagerRegistered - false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hiAppEventRegisterExternalLogManager020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      let watcher: hiAppEvent.Watcher = {
        name: 'crashEventWatcher',
        appEventFilters: [
          {
            domain: hiAppEvent.domain.OS,
            names: [hiAppEvent.event.APP_CRASH]
          }
        ],
        onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
          hilog.info(0x0000, 'testTag', `HiAppEvent onReceive: domain=${domain}`);
          for (const eventGroup of appEventGroups) {
            hilog.info(0x0000, 'testTag', `HiAppEvent eventName=${eventGroup.name}`);
            for (const eventInfo of eventGroup.appEventInfos) {
              hilog.info(0x0000, 'testTag',
                `HiAppEvent eventInfo.params.external_log=${JSON.stringify(eventInfo.params['external_log'])}`);
              expect("APP_CRASH").assertEqual(eventInfo.name)
            }
          }
        }
      };
      hiAppEvent.addWatcher(watcher);
      for (let i = 0; i < 10; i++) {
        testNapi.CrashLink(2, 3);
        await asyncSleep(5000);
      }

      let myLogManager: hiAppEvent.ExternalLogManager = {
        onCapacityReached(container: hiAppEvent.ExternalLogContainer): void {
          hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] onCapacityReached  successfully');
          // 获取external log目录日志文件数量
          try{
            hilog.info(0x0000, 'hiAppEvent', `[MyLogManager] 日志数量: ${container.getLogNumber()}`);
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] getLogNumber 容量达到阈值，日志数量: ${container.getLogNumber()}`);
            expect(container.getLogNumber()).assertLargerOrEqual(0);

            // 获取所有日志文件路径
            let allFiles: Set<string> = container.getAllLogFiles();
            expect(allFiles != null).assertTrue();
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager]  所有日志文件: ${JSON.stringify(Array.from(allFiles))}`);

            // 获取所有日志详情
            let allLogs: Set<hiAppEvent.ExternalLogWrapper> = container.getAllLogs();
            expect(allLogs != null).assertTrue();

            for (const log of Array.from(allLogs)) {
              const getFilePath = log.getSysEvent();
              const getGenerationTime = log.getSysEvent();
              const getSizeInKb = log.getSysEvent();
              const getSysEvent = log.getSysEvent();
              hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 所有日志文件详情: ${log.getFilePath()}, ` +
                `时间: ${log.getGenerationTime()}, ` +
                `大小: ${log.getSizeInKb()}KB, ` +
                `事件: ${log.getSysEvent()}`);
              expect(getFilePath != null).assertTrue();
              expect(getGenerationTime != null).assertTrue();
              expect(getSizeInKb != null).assertTrue();
              expect(getSysEvent != null).assertTrue();
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager]1 registerExternalLogManager successful`);
            }

            // 按事件类型过滤 — 只清理 APP_CRASH 的日志
            let crashFiles: Set<string> = container.getLogFilesOfSysEvent('APP_CRASH');
            expect(crashFiles != null).assertTrue();
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] APP_CRASH 日志: ${JSON.stringify(Array.from(crashFiles))}`);
            try{
              let crashFiles1: Set<string> = container.getLogFilesOfSysEvent(null);
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager]2 registerExternalLogManager successful`);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }
            try{
              let crashFiles2: Set<string> = container.getLogFilesOfSysEvent(undefined);
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager]3 registerExternalLogManager successful`);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }
            try{
              let crashFiles1: Set<string> = container.getLogFilesOfSysEvent("");
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager]2 registerExternalLogManager successful`);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }

            // // 按时间过滤 — 删除1小时前的日志
            let oneHourAgo = Date.now() - 3600 * 1000;
            let oldFiles: Set<string> = container.getLogFilesGeneratedBefore(oneHourAgo);
            expect(oldFiles != null).assertTrue();
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 1小时前[${oneHourAgo}]的日志: ${JSON.stringify(Array.from(oldFiles))}`);

            try{
              let oldFiles: Set<string> = container.getLogFilesGeneratedBefore(undefined);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }
            try{
              let oldFiles: Set<string> = container.getLogFilesGeneratedBefore(null);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }

            // // 按时间过滤 — 删除1小时内的日志
            oldFiles = container.getLogFilesGeneratedAfter(oneHourAgo);
            expect(oldFiles != null).assertTrue();
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 1小时内[${oneHourAgo}]的日志: ${JSON.stringify(Array.from(oldFiles))}`);

            try{
              oldFiles = container.getLogFilesGeneratedAfter(null);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }

            try{
              oldFiles = container.getLogFilesGeneratedAfter(undefined);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }

            // 按大小过滤 — 删除大于100KB的日志
            let largeFiles: Set<string> = container.getLogFilesLargerThan(100);
            expect(largeFiles != null).assertTrue();
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 大于100KB的日志: ${JSON.stringify(Array.from(largeFiles))}`);
            try{
              let largeFiles1: Set<string> = container.getLogFilesLargerThan(null);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }
            try{
              let largeFiles2: Set<string> = container.getLogFilesLargerThan(undefined);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }
            // // 按大小过滤 — 删除小于100KB的日志
            let smallFiles: Set<string> = container.getLogFilesSmallerThan(100);
            expect(smallFiles != null).assertTrue();
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 小于100KB的日志: ${JSON.stringify(Array.from(smallFiles))}`);
            try{
              let smallFiles1: Set<string> = container.getLogFilesSmallerThan(null);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }
            try{
              let smallFiles2: Set<string> = container.getLogFilesSmallerThan(undefined);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }

            // // 获取最早生成的6个日志文件，优先删除
            let oldestFiles: Set<string> = container.getFirstGeneratedLogFiles(6);
            expect(oldestFiles != null).assertTrue();
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 最早的6个日志: ${JSON.stringify(Array.from(oldestFiles))}`);
            try{
              let oldestFiles1: Set<string> = container.getFirstGeneratedLogFiles(null);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }
            try{
              let oldestFiles2: Set<string> = container.getFirstGeneratedLogFiles(undefined);
              done();
            } catch (err) {
              hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
              expect(err.code === '401').assertTrue();
              done();
            }
            done();
          } catch (err) {
            hilog.error(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] getLogNumber test failed: %{public}s', JSON.stringify(err));
            expect(false).assertTrue();
            done();
          }
          hiAppEvent.removeWatcher(watcher);
          done();
        }
      };
      try {
        hiAppEvent.registerExternalLogManager(myLogManager);
        testNapi.CrashLink(2, 3);
        await asyncSleep(5000);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] getLogNumber test failed: %{public}s', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name hiAppEventRegisterExternalLogManager030
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_0300
     * @tc.desc Test registerExternalLogManager - successful registration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hiAppEventRegisterExternalLogManager030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'registerExternalLogManager test start');

      let myLogManager: hiAppEvent.ExternalLogManager = {
        onCapacityReached(container: hiAppEvent.ExternalLogContainer): void {}
      };
      try {
        hiAppEvent.registerExternalLogManager(myLogManager);
        hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] ExternalLogManager registered successfully');
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
        expect(err.code == 11106001).assertTrue();
        done();
      }
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'hiAppEventRegisterExternalLogManager030 test end');
    });

    /**
     * @tc.name hiAppEventRegisterExternalLogManager040
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_0400
     * @tc.desc Test registerExternalLogManager - successful registration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hiAppEventRegisterExternalLogManager040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'registerExternalLogManager test start');
      let myLogManager: hiAppEvent.ExternalLogManager = {
        onCapacityReached(container: hiAppEvent.ExternalLogContainer): void {}
      };
      try {
        hiAppEvent.registerExternalLogManager(null);
        hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] ExternalLogManager registered successfully');
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'hiAppEventRegisterExternalLogManager040 test end');
    });

    /**
     * @tc.name hiAppEventRegisterExternalLogManager050
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_0500
     * @tc.desc Test registerExternalLogManager - successful registration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hiAppEventRegisterExternalLogManager050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'registerExternalLogManager test start');
      let myLogManager: hiAppEvent.ExternalLogManager = {
        onCapacityReached(container: hiAppEvent.ExternalLogContainer): void {}
      };
      try {
        hiAppEvent.registerExternalLogManager(undefined);
        hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] ExternalLogManager registered successfully');
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'hiAppEventRegisterExternalLogManager050 test end');
    });

    /**
     * @tc.name hiAppEventRegisterExternalLogManager060
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_0600
     * @tc.desc Test registerExternalLogManager - successful registration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hiAppEventRegisterExternalLogManager060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'registerExternalLogManager test start');
      let myLogManager: hiAppEvent.ExternalLogManager = {
        onCapacityReached(): void {}
      };
      try {
        hiAppEvent.registerExternalLogManager(myLogManager);
        hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] ExternalLogManager registered successfully');
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
        expect(err.code == 11106001).assertTrue();
        done();
      }
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'hiAppEventRegisterExternalLogManager060 test end');
    });

    /**
     * @tc.name hiAppEventRegisterExternalLogManager070
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_0700
     * @tc.desc Test registerExternalLogManager - successful registration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hiAppEventRegisterExternalLogManager070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'registerExternalLogManager test start');
      let myLogManager: hiAppEvent.ExternalLogManager = {
        onCapacityReached(undefined): void {}
      };
      try {
        hiAppEvent.registerExternalLogManager(myLogManager);
        hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] ExternalLogManager registered successfully');
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
        expect(err.code == 11106001).assertTrue();
        done();
      }
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'hiAppEventRegisterExternalLogManager070 test end');
    });

    /**
     * @tc.name hiAppEventRegisterExternalLogManager080
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_0800
     * @tc.desc Test isExternalLogManagerRegistered - false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hiAppEventRegisterExternalLogManager080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'registerExternalLogManager test start');
      let registered: boolean = hiAppEvent.isExternalLogManagerRegistered();
      hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] isExternalLogManagerRegistered: %{public}s', registered.toString());
      expect(registered == true).assertTrue();
      done();
    });

  });
}
