import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import data from '@ohos.telephony.data';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'DataTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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
        console.info("expectInfo", `test sucess`);
    }
}

const apnInfoParameter: data.ApnInfo = {
    apnName: 'apnName',
    apn: 'apn',
    mcc: 'mcc',
    mnc: 'mnc',
    user: 'user',
    type: 'type',
    proxy: 'proxy',
    mmsproxy: 'mmsproxy'
}

export default function dataNoPTest() {

    describe("DataNoPTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /*
          * @tc.number:SUB_telephony_data_nop0100
          * @tc.name: testTelephonyDataNop_static_0100
          * @tc.desc:Using the isCellularDataEnabled (Promise) method without permission
          * @tc.level:Level 0
          * @tc.type:Function
          * @tc.size:MediumTest
          */
        it("testTelephonyDataNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataEnabled().then((contextData: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': contextData ->'+contextData);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 201);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /*
         * @tc.number:SUB_telephony_data_nop002
         * @tc.name: testTelephonyDataNop_static_0200
         * @tc.desc:Using the isCellularDataEnabled (callback) method without permission
         * @tc.level:Level 0
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("testTelephonyDataNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataEnabled((err: BusinessError<void>|null, contextData: boolean| undefined) => {
                    if(err?.code != 0){
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 201);
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName +' get isCellularDataEnabled success ');
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /*
         * @tc.number:SUB_Telephony_Data_QueryAllApns_NoP_0300
         * @tc.name: testTelephonyDataQueryAllApnsNoP_static_0300
         * @tc.desc:Using the queryAllApns (Promise) method without permission
         * @tc.level:Level 0
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("testTelephonyDataQueryAllApnsNoP_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataQueryAllApnsNoP_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.queryAllApns().then(() => {
                    ExpectTrue(false);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 201);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /*
         * @tc.number:SUB_Telephony_Data_QueryApnIds_NoP_0400
         * @tc.name: testTelephonyDataQueryApnIdsNoP_static_0400
         * @tc.desc:Using the queryApnIds (Promise) method without permission
         * @tc.level:Level 0
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("testTelephonyDataQueryApnIdsNoP_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataQueryApnIdsNoP_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.queryApnIds(apnInfoParameter).then(() => {
                    ExpectTrue(false);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 201);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /*
         * @tc.number:SUB_Telephony_Data_SetPreferredApn_NoP_0500
         * @tc.name: testTelephonyDataSetPreferredApnNoP_static_0500
         * @tc.desc:Using the setPreferredApn (Promise) method without permission
         * @tc.level:Level 0
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("testTelephonyDataSetPreferredApnNoP_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataSetPreferredApnNoP_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                await data.setPreferredApn(1).then(() => {
                    ExpectTrue(false);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 201);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /**
         * @tc.number : SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_NoP_0100
         * @tc.name   : testTelephonyDataIsCellularDataRoamingEnabledSyncNoP_static_0100
         * @tc.desc   : isCellularDataRoamingEnabledSync No permission
         * @tc.level  : Level 0
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it("testTelephonyDataIsCellularDataRoamingEnabledSyncNoP_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabledSyncNoP_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let isEnabled: boolean = data.isCellularDataRoamingEnabledSync(1);
                hilog.info(domain, tag, '%{public}s', caseName+ ' isEnabled = ' + isEnabled);
                ExpectTrue(false);
                done();
            }catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /**
        * @tc.number:SUB_Telephony_Data_GetActiveApnName_NoP_0100
        * @tc.name: testTelephonyDataGetActiveApnNameNoP_static_0100
        * @tc.desc:Using the getActiveApnName (Promise) method without permission
        * @tc.level:Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("testTelephonyDataGetActiveApnNameNoP_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetActiveApnNameNoP_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                await data.getActiveApnName().then((ret:string) => {
                    ExpectTrue(false);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 201);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /**
         * @tc.number : SUB_Telephony_Data_IsCellularDataEnabledSync_NoP_0200
         * @tc.name   : testTelephonyDataIsCellularDataEnabledSyncNoP__static_0200
         * @tc.desc   : isCellularDataEnabledSync No permission
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it("testTelephonyDataIsCellularDataEnabledSyncNoP__static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabledSyncNoP__static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let isEnabled: boolean = data.isCellularDataEnabledSync();
                hilog.info(domain, tag, '%{public}s', caseName+ ' isEnabled = ' + isEnabled);
                ExpectTrue(false);
                done();
            }catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
                done();
            }
        })

        /*
         * @tc.number:SUB_telephony_data_nop003
         * @tc.name: testTelephonyDataNop_static_0300
         * @tc.desc:Using the isCellularDataRoamingEnabled (then) method without permission
         * @tc.level:Level 0
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it('testTelephonyDataNop_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(0).then((data: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 201);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /*
         * @tc.number:SUB_telephony_data_nop004
         * @tc.name: testTelephonyDataNop_static_0400
         * @tc.desc:Using the isCellularDataRoamingEnabled (callback) method without permission
         * @tc.level:Level 0
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it('testTelephonyDataNop_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(0, (err: BusinessError<void>|null, enabled: boolean|undefined) => {
                    if(err?.code != 0){
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 201);
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName +' get isCellularDataRoamingEnabled success ');
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code == 201);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })
    })
}