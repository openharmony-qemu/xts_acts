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
        err = err as BusinessError;
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err) {
        err = err as BusinessError;
        console.info("expectInfo", `test sucess`);
    }
}
export default function dataManagerTest() {

    describe("dataManagerTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');


        /* *
         * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotIdSync_0200
         * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0200
         * @tc.desc  : Get the SIM card for default mobile data.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 0
         */
        it('testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let cardSlot: number = data.getDefaultCellularDataSlotIdSync();
                hilog.info(domain, tag, '%{public}s', caseName +': cardSlot->'+JSON.stringify(cardSlot));
                ExpectTrue(cardSlot == 0 || cardSlot ==1 );
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /* *
        * @tc.number: SUB_Telephony_Data_GetCellularDataState_0200
        * @tc.name  : testTelephonyDataGetCellularDataState_static_0200
        * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */
        it('testTelephonyDataGetCellularDataState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataState_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled().then((isEnable: boolean )=>{
                    data.getCellularDataState((err: BusinessError<void>|null , data: data.DataConnectState| undefined) => {
                        if (err?.code != 0) {

                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        } else {
                            ExpectTrue(true);
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }
                    });
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /* *
        * @tc.number: SUB_Telephony_Data_GetCellularDataState_0600
        * @tc.name  : testTelephonyDataGetCellularDataState_static_0600
        * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
        */
        it('testTelephonyDataGetCellularDataState_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataState_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let isEnable: boolean = await data.isCellularDataEnabled();
                if (isEnable) {
                    data.getCellularDataState().then((data: data.DataConnectState) => {
                        console.info(`${caseName} data->${JSON.stringify(data)}`);
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
                } else {
                    hilog.info(domain, tag, '%{public}s', caseName +' no sim card ');
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /* *
        * @tc.number: SUB_Telephony_Data_IsCellularDataEnabled_0100
        * @tc.name  : testTelephonyDataIsCellularDataEnabled_static_0100
        * @tc.desc  : Check whether the cellular data service is enabled.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
        */
        it('testTelephonyDataIsCellularDataEnabled_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabled_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled((err: BusinessError<void>|null, data: boolean| undefined) => {
                    if (err?.code != 0) {
                        ExpectFail();
                        done();
                    } else {
                        ExpectTrue(data !== undefined);
                        done();
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                console.info(`${caseName} err->${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /* *
         * @tc.number: SUB_Telephony_Data_IsCellularDataEnabled_0300
         * @tc.name  : testTelephonyDataIsCellularDataEnabled_static_0300
         * @tc.desc  : Check whether the cellular data service is enabled.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
        */
        it('testTelephonyDataIsCellularDataEnabled_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabled_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled((err: BusinessError<void>|null, data: boolean| undefined) => {
                    if (err?.code != 0) {

                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        ExpectTrue(data != undefined);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /* *
         * @tc.number: SUB_Telephony_Data_IsCellularDataEnabled_0500
         * @tc.name  : testTelephonyDataIsCellularDataEnabled_static_0500
         * @tc.desc  : Check whether the cellular data service is enabled.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 0
        */
        it('testTelephonyDataIsCellularDataEnabled_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabled_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled().then((data: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+ data);
                    ExpectTrue(data);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /* *
         * @tc.number: SUB_Telephony_Data_IsCellularDataEnabled_0700
         * @tc.name  : testTelephonyDataIsCellularDataEnabled_static_0700
         * @tc.desc  : Check whether the cellular data service is enabled.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
        */
        it('testTelephonyDataIsCellularDataEnabled_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataEnabled_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                data.isCellularDataEnabled((err: BusinessError<void>|null, data: boolean| undefined ) => {
                    if (err?.code != 0) {

                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {

                        ExpectTrue(true);
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    }
                });
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /* *
         * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotIdSync_0100
         * @tc.name  : testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0100
         * @tc.desc  : Get the SIM card for default mobile data.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetDefaultCellularDataSlotIdSync_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let cardSlot: number = data.getDefaultCellularDataSlotIdSync();
                hilog.info(domain, tag, '%{public}s', caseName +': cardSlot->'+JSON.stringify(cardSlot));
                ExpectTrue(cardSlot ==0 || cardSlot == 1);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /* *
              * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0100
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
              * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0300
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
             * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0400
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
               * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0500
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
               * @tc.number: SUB_Telephony_Data_GetDefaultCellularDataSlotId_0600
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

        /* *
        * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0100
        * @tc.name  : testTelephonyDataGetCellularDataFlowType_static_0100
        * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
       */
        it('testTelephonyDataGetCellularDataFlowType_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataFlowType_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getCellularDataFlowType((err: BusinessError<void>|null, ret: data.DataFlowType|undefined) => {
                    if (err?.code != 0) {
                        ExpectTrue(false);
                    } else {
                        ExpectTrue(ret != null);
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
        * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0600
        * @tc.name  : testTelephonyDataGetCellularDataFlowType_static_0600
        * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
         */
        it('testTelephonyDataGetCellularDataFlowType_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataFlowType_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getCellularDataFlowType().then((ret: data.DataFlowType) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': ret ->'+ret);
                    ExpectTrue(ret != null);
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
        * @tc.number: SUB_Telephony_Data_GetActiveApnName_0100
        * @tc.name  : testTelephonyDataGetActiveApnName_static_0100
        * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
         */
        it('testTelephonyDataGetActiveApnName_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetActiveApnName_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getActiveApnName().then((ret: string) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': ret ->'+ret);
                    ExpectTrue(ret != null);
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

        /**
         * @tc.number: SUB_Telephony_Data_IsCellularDataRoamingEnabled_0500
         * @tc.name  : testTelephonyDataIsCellularDataRoamingEnabled_static_0500
         * @tc.desc  : Check whether roaming is enabled for cellular data services.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyDataIsCellularDataRoamingEnabled_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(2, (err: BusinessError<void>|null, ret: boolean|undefined) => {
                    if (err?.code != 0) {
                        ExpectTrue(err?.code === 8300001);
                    } else {
                        ExpectTrue(false);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err?.code === 8300001);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_Telephony_Data_IsCellularDataRoamingEnabled_1100
         * @tc.name  : testTelephonyDataIsCellularDataRoamingEnabled_static_1100
         * @tc.desc  : Check whether roaming is enabled for cellular data services.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyDataIsCellularDataRoamingEnabled_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled_static_1100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataRoamingEnabled(2).then((data: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+data);
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectTrue(err.code === 8300001);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectTrue(err.code === 8300001);
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })
    })
}