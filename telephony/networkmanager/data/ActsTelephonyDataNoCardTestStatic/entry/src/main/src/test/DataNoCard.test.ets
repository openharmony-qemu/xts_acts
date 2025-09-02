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
export default function dataNoCardTest() {

    describe("DataNoCardTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        const ERR_SLOT_ID = 3;

        /* *
          * @tc.number: SUB_Telephony_Data_GetCellularDataState_0400
          * @tc.name  : testTelephonyDataGetCellularDataState_static_0400
          * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
          * @tc.size  : MediumTest
          * @tc.type  : Function
          * @tc.level : level 3
         */
        it('testTelephonyDataGetCellularDataState_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataState_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getCellularDataState((err: BusinessError<void>|null, data: data.DataConnectState| undefined) => {
                    if (err?.code != 0) {

                        ExpectFail();
                    } else {

                        ExpectTrue(true);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_Telephony_Data_GetCellularDataState_0800
         * @tc.name  : testTelephonyDataGetCellularDataState_static_0800
         * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyDataGetCellularDataState_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataState_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getCellularDataState().then((data: data.DataConnectState) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': getCellularDataState ->'+JSON.stringify(data));
                    ExpectTrue(true);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
          * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_static_0100
          * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId_static_0100
          * @tc.desc  : Get the default cellular data card.
          * @tc.size  : MediumTest
          * @tc.type  : Function
          * @tc.level : level 3
         */
        it('testTelephonyDataGetDefaultCellularDataSlotId_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getDefaultCellularDataSlotId((err: BusinessError<void>|null, data: int|undefined) => {
                    if (err?.code) {
                        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err));
                        ExpectTrue(false);
                    } else {
                        ExpectTrue(data != null);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(false);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_Telephony_CellularData_getDefaultCellularDataSlotId_Promise_static_0500
         * @tc.name  : testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_static_0500
         * @tc.desc  : Get the default cellular data card.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getDefaultCellularDataSlotId().then((data: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectTrue(data == 0 || data == 1);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
          * @tc.number: SUB_Telephony_CellularData_getDefaultCellularDataSlotIdSync_static_0100
          * @tc.name  : testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_static_0100
          * @tc.desc  : Get the default cellular data card.
          * @tc.size  : MediumTest
          * @tc.type  : Function
          * @tc.level : level 3
         */
        it('testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let slotId: int = data.getDefaultCellularDataSlotIdSync();
                ExpectTrue(slotId == 0 || slotId == 1);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
          * @tc.number: SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_static_0200
          * @tc.name  : testTelephonyDataIsCellularDataEnabledSync_static_0200
          * @tc.desc  : Check whether cellular data services are enabled.
          * @tc.size  : MediumTest
          * @tc.type  : Function
          * @tc.level : level 3
         */
        it('testTelephonyDataIsCellularDataEnabledSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabledSync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let isEnabled: boolean = data.isCellularDataEnabledSync();
                hilog.info(domain, tag, '%{public}s', caseName+ ' isEnabled: '+ isEnabled);
                ExpectTrue(isEnabled == true);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
          * @tc.number: SUB_Telephony_CellularData_isCellularDataRoamingEnabled_Async_static_0200
          * @tc.name  : testTelephonyCellularDataisCellularDataRoamingEnabledAsync_static_0200
          * @tc.desc  : Check whether roaming is enabled for cellular data services.
          * @tc.size  : MediumTest
          * @tc.type  : Function
          * @tc.level : level 3
         */
        it('testTelephonyCellularDataisCellularDataRoamingEnabledAsync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataisCellularDataRoamingEnabledAsync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(ERR_SLOT_ID, (err: BusinessError<void>|null, enabled: boolean|undefined) => {
                    if (err?.code != 0) {
                        ExpectTrue(true);
                    } else {
                        ExpectFail();
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_Telephony_CellularData_isCellularDataRoamingEnabled_Promise_static_0200
         * @tc.name  : testTelephonyCellularDataisCellularDataRoamingEnabledPromise_static_0200
         * @tc.desc  : Check whether roaming is enabled for cellular data services.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyCellularDataisCellularDataRoamingEnabledPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyCellularDataisCellularDataRoamingEnabledPromise_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(ERR_SLOT_ID).then((data: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(true);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
          * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_static_0300
          * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId_static_0300
          * @tc.desc  : Get the default cellular data card.
          * @tc.size  : MediumTest
          * @tc.type  : Function
          * @tc.level : level 3
         */
        it('testTelephonyDataGetDefaultCellularDataSlotId_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getDefaultCellularDataSlotId((err: BusinessError<void>|null, slotId: int|undefined) => {
                    if (err?.code != 0) {
                        ExpectTrue(false);
                    } else {
                        ExpectTrue(slotId != null);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(false);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_static_0400
         * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId_static_0400
         * @tc.desc  : Get the default cellular data card.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyDataGetDefaultCellularDataSlotId_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getDefaultCellularDataSlotId().then((slotId: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': slotId ->'+slotId);
                    ExpectTrue(slotId != null);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(false);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(false);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_static_0500
         * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId_static_0500
         * @tc.desc  : Get the default cellular data card.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyDataGetDefaultCellularDataSlotId_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getDefaultCellularDataSlotId().then((slotId: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': slotId ->'+slotId);
                    ExpectTrue(slotId == 0);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(false);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(false);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_static_0600
         * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotId_static_0600
         * @tc.desc  : Get the default cellular data card.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyDataGetDefaultCellularDataSlotId_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotId_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                let cardId: int = data.getDefaultCellularDataSimId();
                ExpectTrue(cardId != null);
                data.getDefaultCellularDataSlotId().then((slotId: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': slotId ->'+slotId);
                    ExpectTrue(slotId !== null);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(false);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(false);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })        
    })

}