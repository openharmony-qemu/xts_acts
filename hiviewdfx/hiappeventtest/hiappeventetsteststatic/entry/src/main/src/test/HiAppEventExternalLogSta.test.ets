'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import { hilog, hidebug} from '@kit.PerformanceAnalysisKit';
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import fileIo from '@ohos.file.fs';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HiAppEventExternalLog'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class SubDemo extends hiAppEvent.ExternalLogManager {
    override    onCapacityReached(container: hiAppEvent.ExternalLogContainer): void {}
}

class SubDemo1 extends hiAppEvent.ExternalLogManager {
    override    onCapacityReached(container: hiAppEvent.ExternalLogContainer): void {
        hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] onCapacityReached  successfully');
        hilog.info(0x0000, 'hiAppEvent', `[MyLogManager] 日志数量: ${container.getLogNumber()}`);
        hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] getLogNumber 容量达到阈值，日志数量: ${container.getLogNumber()}`);

        let allFiles: Set<string> = container.getAllLogFiles();
        hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager]  所有日志文件: ${JSON.stringify(Array.from(allFiles))}`);

        let allLogs: Set<hiAppEvent.ExternalLogWrapper> = container.getAllLogs();
        for (const log of Array.from(allLogs)) {
            hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 所有日志文件详情: ${log.getFilePath()}, ` +
                `时间: ${log.getGenerationTime()}, ` +
                `大小: ${log.getSizeInKb()}KB, ` +
                `事件: ${log.getSysEvent()}`);
            hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager]1 registerExternalLogManager successful`);
        }

        let crashFiles: Set<string> = container.getLogFilesOfSysEvent('APP_CRASH');
        hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] APP_CRASH 日志: ${JSON.stringify(Array.from(crashFiles))}`);

        let oneHourAgo = Date.now() - 3600 * 1000;
        let oldFiles: Set<string> = container.getLogFilesGeneratedBefore(oneHourAgo);
        hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 1小时前[${oneHourAgo}]的日志: ${JSON.stringify(Array.from(oldFiles))}`);

        oldFiles = container.getLogFilesGeneratedAfter(oneHourAgo);
        hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 1小时内[${oneHourAgo}]的日志: ${JSON.stringify(Array.from(oldFiles))}`);
        let largeFiles: Set<string> = container.getLogFilesLargerThan(100);
        hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 大于100KB的日志: ${JSON.stringify(Array.from(largeFiles))}`);

        let smallFiles: Set<string> = container.getLogFilesSmallerThan(100);
        hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 小于100KB的日志: ${JSON.stringify(Array.from(smallFiles))}`);

        let oldestFiles: Set<string> = container.getFirstGeneratedLogFiles(6);
        hilog.info(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] 最早的6个日志: ${JSON.stringify(Array.from(oldestFiles))}`);
    }
}

export default function HiAppEventExternalLog(){

    describe("HiAppEventExternalLog", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name hiAppEventRegisterExternalLogManagerStatic010
         * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_STATIC_0100
         * @tc.desc Test isExternalLogManagerRegistered - false
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL0
         */
        it('hiAppEventRegisterExternalLogManagerStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, `hiAppEventRegisterExternalLogManagerStatic010 start`);
            let registered: boolean = hiAppEvent.isExternalLogManagerRegistered();
            expect(registered == false).assertTrue();
            done();
        })

        /**
         * @tc.name hiAppEventRegisterExternalLogManagerStatic020
         * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_STATIC_0200
         * @tc.desc Test isExternalLogManagerRegistered - false
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL1
         */
        it('hiAppEventRegisterExternalLogManagerStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, `hiAppEventRegisterExternalLogManagerStatic020 start`);
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
                            hilog.info(0x0000, 'testTag', "testHiAppEvehiAppEventRegisterExternalLogManagerStatic020ntSub70 eventPkg.appEventInfo=" + JSON.stringify(eventInfo));
                        }
                    }
                }
            };

            let myLogManager = new SubDemo1();
            try {
                hiAppEvent.registerExternalLogManager(myLogManager);
                hiAppEvent.removeWatcher(watcher);
                done();
            } catch (err) {
                hilog.error(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] getLogNumber test failed: %{public}s', JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name hiAppEventRegisterExternalLogManagerStatic030
         * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_STATIC_0300
         * @tc.desc Test isExternalLogManagerRegistered - false
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL1
         */
        it('hiAppEventRegisterExternalLogManagerStatic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {   
            
            let myLogManager = new SubDemo();
            try {
                hiAppEvent.registerExternalLogManager(myLogManager);
                hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] ExternalLogManager registered successfully');
                done();
            } catch (err) {
                hilog.error(0x0000, 'hiAppEvent', `hiappevent [MyLogManager] registerExternalLogManager failed, err code: ${err.code}, err msg: ${err.message}`);
                expect(err.code === 11106001).assertTrue();
                done();
            }
            hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'hiAppEventRegisterExternalLogManagerStatic030 test end');
        });

        /**
         * @tc.name hiAppEventRegisterExternalLogManagerStatic080
         * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_EXTERNALLOG_STATIC_0800
         * @tc.desc Test isExternalLogManagerRegistered - false
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL1
         */
        it('hiAppEventRegisterExternalLogManagerStatic080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(0x0000, 'hiAppEvent', '%{public}s', 'registerExternalLogManager test start');
            let registered: boolean = hiAppEvent.isExternalLogManagerRegistered();
            hilog.info(0x0000, 'hiAppEvent', 'hiappevent [MyLogManager] isExternalLogManagerRegistered: %{public}s', registered.toString());
            expect(registered == true).assertTrue();
            done();
        });
        
    })
}