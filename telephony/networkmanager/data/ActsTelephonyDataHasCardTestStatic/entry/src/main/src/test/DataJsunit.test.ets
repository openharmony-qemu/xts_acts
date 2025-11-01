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
export default function dataJsunit() {

    describe("dataJsunit", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.number  Telephony_Data_DataFlowType_DATA_FLOW_TYPE_NONE
         * @tc.name    testTelephonyDataDataFlowTypeTest_static_0100
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataFlowTypeTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataFlowTypeTest_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let caseName = 'Telephony_Data_DataFlowType_DATA_FLOW_TYPE_NONE';
                hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataFlowType.DATA_FLOW_TYPE_NONE == 0);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.number  Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DOWN
         * @tc.name    testTelephonyDataDataFlowTypeTest_static_0200
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataFlowTypeTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataFlowTypeTest_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let caseName = 'Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DOWN';
                hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataFlowType.DATA_FLOW_TYPE_DOWN == 1);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.number  Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP
         * @tc.name    testTelephonyDataDataFlowTypeTest_static_0300
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataFlowTypeTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataFlowTypeTest_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let caseName = 'Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP';
                hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataFlowType.DATA_FLOW_TYPE_UP == 2);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.number  Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP_DOWN
         * @tc.name    testTelephonyDataDataFlowTypeTest_static_0400
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataFlowTypeTest_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataFlowTypeTest_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataFlowType.DATA_FLOW_TYPE_UP_DOWN == 3);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.number  Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DORMANT
         * @tc.name    testTelephonyDataDataFlowTypeTest_static_0500
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataFlowTypeTest_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataFlowTypeTest_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataFlowType.DATA_FLOW_TYPE_DORMANT == 4);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });


        /**
         * @tc.number  Telephony_Data_DataConnectState_DATA_STATE_CONNECTED
         * @tc.name    testTelephonyDataDataFlowTypeTest_static_0600
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataFlowTypeTest_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataFlowTypeTest_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            ExpectTrue(data.DataConnectState.DATA_STATE_CONNECTED == 2);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.number  Telephony_Data_DataConnectState_DATA_STATE_UNKNOWN
         * @tc.name    testTelephonyDataDataStateTest_static_0700
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataStateTest_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataStateTest_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataConnectState.DATA_STATE_UNKNOWN == -1);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.number  Telephony_Data_DataConnectState_DATA_STATE_DISCONNECTED
         * @tc.name    testTelephonyDataDataStateTest_static_0800
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataStateTest_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataStateTest_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataConnectState.DATA_STATE_DISCONNECTED == 0);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.number  Telephony_Data_DataConnectState_DATA_STATE_CONNECTING
         * @tc.name    testTelephonyDataDataStateTest_static_0900
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataStateTest_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataStateTest_static_0900';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataConnectState.DATA_STATE_CONNECTING == 1);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });

        /**
         * @tc.number  Telephony_Data_DataConnectState_DATA_STATE_SUSPENDED
         * @tc.name    testTelephonyDataDataStateTest_static_1000
         * @tc.desc    Enum value test
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : LEVEL2
         */
        it("testTelephonyDataDataStateTest_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataDataStateTest_static_1000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                hilog.info(domain, tag, '%{public}s', caseName+ ' start');
                ExpectTrue(data.DataConnectState.DATA_STATE_SUSPENDED == 3);
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            }
        });



    })
}