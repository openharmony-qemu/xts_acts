/**
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import statistics from '@ohos.net.statistics';
import bundleManager from '@ohos.bundle.bundleManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'StatisticsTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err) {
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err) {
        console.info("expectInfo", `test failed`);
    }
}

export default function statisticsNoNetTest() {

    describe("StatisticsNoNetTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /* *
         * @tc.number: SUB_NetworkMgr_Statistics_GetAllRxBytes_0500
         * @tc.name  : testNetworkMgrStatisticsGetAllRxBytes_static_0500
         * @tc.desc  : Obtain real-time downlink traffic of all network adapters without Ethernet access;callback.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 0
         */
        it("testNetworkMgrStatisticsGetAllRxBytes_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllRxBytes((error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_NetworkMgr_Statistics_GetAllRxBytes_0600
         * @tc.name  : testNetworkMgrStatisticsGetAllRxBytes_static_0600
         * @tc.desc  : Obtain real-time downlink traffic of all network adapters without Ethernet access;promise
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkMgrStatisticsGetAllRxBytes_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllRxBytes().then((stats: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectTrue(true);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
        * @tc.number: SUB_NetworkMgr_Statistics_GetAllTxBytes_0500
        * @tc.name  : testNetworkMgrStatisticsGetAllTxBytes_static_0500
        * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access;callback.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
        */
        it("testNetworkMgrStatisticsGetAllTxBytes_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllTxBytes((error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_NetworkMgr_Statistics_GetAllTxBytes_0600
         * @tc.name  : testNetworkMgrStatisticsGetAllTxBytes_static_0600
         * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access ;promise
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkMgrStatisticsGetAllTxBytes_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getAllTxBytes().then((stats: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectTrue(true);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
        * @tc.number: SUB_NetworkManager_GetUidRxBytes_Async_static_0100
        * @tc.name  : testNetworkManagerGetUidRxBytesAsync_static_0100
        * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access;callback.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
        */
        it("testNetworkManagerGetUidRxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkManagerGetUidRxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let uid = 20010084;
                statistics.getUidRxBytes(uid, (error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectTrue(error?.code == 2103005);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_NetworkManager_GetUidRxBytes_Promise_static_0100
         * @tc.name  : testNetworkManagerGetUidRxBytesPromise_static_0100
         * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access ;promise
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkManagerGetUidRxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkManagerGetUidRxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let uid = 20010084;
                statistics.getUidRxBytes(uid).then((stats: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103005);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2103005);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
        * @tc.number: SUB_NetworkManager_GetUidTxBytes_Async_static_0100
        * @tc.name  : testNetworkManagerGetUidTxBytesAsync_static_0100
        * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access;callback.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
        */
        it("testNetworkManagerGetUidTxBytesAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkManagerGetUidTxBytesAsync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let uid = 20010084;
                statistics.getUidTxBytes(uid, (error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectTrue(error?.code == 2103005);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_NetworkManager_GetUidTxBytes_Promise_static_0100
         * @tc.name  : testNetworkManagerGetUidTxBytesPromise_static_0100
         * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access ;promise
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkManagerGetUidTxBytesPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkManagerGetUidTxBytesPromise_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let uid = 20010084;
                statistics.getUidTxBytes(uid).then((stats: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+stats);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103005);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
        * @tc.number: SUB_NetManager_Statistics_GetSockfdRxBytes_CallBackErrCo_static_0100
        * @tc.name  : testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo_static_0100
        * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access;callback.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
        */
        it("testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getSockfdRxBytes(123456, (error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectTrue(error?.code == 2100002);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2100002);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_NetManager_Statistics_GetSockfdRxBytes_PromiseErrCo_static_0200
         * @tc.name  : testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo_static_0200
         * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access ;promise
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getSockfdRxBytes(123456).then((data: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2100002);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2100002);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
        * @tc.number: SUB_NetManager_Statistics_GetSockfdRxBytes_CallbackErrCo_static_0500
        * @tc.name  : testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo_static_0500
        * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access;callback.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
        */
        it("testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetManagerStatisticsGetSockfdRxBytesCallBackErrCo_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getSockfdRxBytes(-1, (error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectTrue(error?.code == 2100001);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2100001);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_NetManager_Statistics_GetSockfdRxBytes_PromiseErrCo_static_0600
         * @tc.name  : testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo_static_0600
         * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access ;promise
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetManagerStatisticsGetSockfdRxBytesPromiseErrCo_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getSockfdRxBytes(-1).then((data: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2100001);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2100001);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /*
         * @tc.number: SUB_NetworkMgr_Statistics_GetCellularRxBytes_0500
         * @tc.name  : testNetworkMgrStatisticsGetCellularRxBytes_static_0500
         * @tc.desc  : Get cellular real-time downlink traffic without card;callback.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkMgrStatisticsGetCellularRxBytes_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetCellularRxBytes_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getCellularRxBytes((error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectTrue(error?.code == 2103012);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2103012);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /*
         * @tc.number: SUB_NetworkMgr_Statistics_GetCellularRxBytes_0600
         * @tc.name  : testNetworkMgrStatisticsGetCellularRxBytes_static_0600
         * @tc.desc  : Get cellular real-time downlink traffic without card;promise
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkMgrStatisticsGetCellularRxBytes_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetCellularRxBytes_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');

            try{
                statistics.getCellularRxBytes().then((data: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2103012);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /*
         * @tc.number: SUB_NetworkMgr_Statistics_GetCellularTxBytes_0500
         * @tc.name  : testNetworkMgrStatisticsGetCellularTxBytes_static_0500
         * @tc.desc  : Get cellular real-time downlink traffic without card;callback.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkMgrStatisticsGetCellularTxBytes_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetCellularTxBytes_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getCellularTxBytes((error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectTrue(error?.code == 2103012);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2103012);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /*
         * @tc.number: SUB_NetworkMgr_Statistics_GetCellularTxBytes_0600
         * @tc.name  : testNetworkMgrStatisticsGetCellularTxBytes_static_0600
         * @tc.desc  : Get cellular real-time downlink traffic without card;promise
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkMgrStatisticsGetCellularTxBytes_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsGetCellularTxBytes_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getCellularTxBytes().then((data: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2103012);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.number: SUB_NetworkMgr_Statistics_getSockTxBytes_ErrCo_0700
         * @tc.name  : testNetworkMgrStatisticsgetSockTxBytesErrCo_static_0700
         * @tc.desc  : Test	Invalid parameter value.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkMgrStatisticsgetSockTxBytesErrCo_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsgetSockTxBytesErrCo_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getSockfdTxBytes(12345, (error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectTrue(error?.code == 2100002);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(false);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2100002);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /*
         * @tc.number: SUB_NetManager_Statistics_GetSockfdTxBytes_CallBackErrCo_0500
         * @tc.name:  testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo_static_0500
         * @tc.desc: Function test
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetManagerStatisticsGetSockfdTxBytesCallBackErrCo_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getSockfdTxBytes(-1, (error: BusinessError<void>|null, stats: long| undefined) => {
                    if (error?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
                        ExpectTrue(error?.code == 2100001);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectTrue(false);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2100001);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.number: SUB_NetworkMgr_Statistics_getSockTxBytes_ErrCo_0800
         * @tc.name  : testNetworkMgrStatisticsgetSockTxBytesErrCo_static_0800
         * @tc.desc  : Test Invalid parameter value.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it("testNetworkMgrStatisticsgetSockTxBytesErrCo_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrStatisticsgetSockTxBytesErrCo_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getSockfdTxBytes(12345).then((data: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2100002);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2100002);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /*
         * @tc.number: SUB_NetManager_Statistics_GetSockfdTxBytes_PromiseErrCo_0600
         * @tc.name:  testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo_static_0600
         * @tc.desc: Function test
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetManagerStatisticsGetSockfdTxBytesPromiseErrCo_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                statistics.getSockfdTxBytes(-1).then((data: long)=>{
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2100001);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                })
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 2100001);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.number SUB_Manager_getIfaceRxBytes_Async_0300
         * @tc.name testManagergetIfaceRxBytesAsync_static_0300
         * @tc.desc Function test
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("testManagergetIfaceRxBytesAsync_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceRxBytesAsync_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan1";
                statistics.getIfaceRxBytes(ifaceName,(err: BusinessError<void> | null, stats: long | undefined)=>{
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 2103005 || err?.code == 2103012);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done()
                })
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.number SUB_Manager_getIfaceRxBytes_Promise_0300
         * @tc.name testManagergetIfaceRxBytesPromise_static_0300
         * @tc.desc Function test
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("testManagergetIfaceRxBytesPromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceRxBytesPromise_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan1";
                statistics.getIfaceRxBytes(ifaceName).then((stats: long) => {
                    console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(stats)}`);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103005 || err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.number SUB_Manager_getIfaceTxBytes_Async_0300
         * @tc.name  testManagergetIfaceTxBytesAsync_static_0300
         * @tc.desc Function test
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("testManagergetIfaceTxBytesAsync_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceTxBytesAsync_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan1";
                statistics.getIfaceTxBytes(ifaceName,(err: BusinessError<void> | null, stats: long | undefined)=>{
                    if (err && err.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 2103005 || err?.code == 2103012);
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': stats ->'+ stats);
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done()
                })
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });

        /**
         * @tc.number SUB_Manager_getIfaceTxBytes_Promise_0300
         * @tc.name testManagergetIfaceTxBytesPromise_static_0300
         * @tc.desc Function test
         * @tc.level 1
         * @tc.type: Function
         * @tc.size: SmallTest
         */
        it("testManagergetIfaceTxBytesPromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testManagergetIfaceTxBytesPromise_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let ifaceName = "wlan1";
                statistics.getIfaceTxBytes(ifaceName).then((stats: long) => {
                    console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(stats)}`);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2103005 || err.code == 2103012);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        });
    })
}