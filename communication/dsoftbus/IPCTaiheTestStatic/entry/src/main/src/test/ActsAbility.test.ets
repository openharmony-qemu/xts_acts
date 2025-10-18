import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import { BusinessError } from "@ohos.base";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import rpc from "@ohos.rpc";
import common from "@ohos.app.ability.common";
import fileIo from "@ohos.file.fs";
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gIRemoteObject: rpc.IRemoteObject;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let bundleNameRpc: string = "com.example.actsipctaiheservicetest.static";
let abilityNameRpc: string = "ServiceAbility";
let connectId: long;

class MyParcelable implements rpc.Parcelable {
    num: int = 0;
    str: string = "";

    constructor(num: int, str: string) {
        this.num = num;
        this.str = str;
    }

    marshalling(dataOut: rpc.MessageSequence): boolean {
        dataOut.writeInt(this.num);
        dataOut.writeString(this.str);
        return true;
    }

    unmarshalling(dataIn: rpc.MessageSequence): boolean {
        this.num = dataIn.readInt();
        this.str = dataIn.readString();
        return true;
    }

}

class TestRemoteObject extends rpc.RemoteObject {
    constructor(descriptor: string) {
        super(descriptor);
    }

    onRemoteMessageRequest(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence, options: rpc.MessageOption): boolean {
        hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject begin ++++++++++++++++++');
        hilog.info(domain, tag, '%{public}s', 'into onRemoteMessageRequest');
        if (code == 1) {
            hilog.info(domain, tag, '%{public}s', 'code is 1');
            let res = data.readInt();
            hilog.info(domain, tag, '%{public}s', 'readInt, res is :' + res);
            reply.writeInt(999);
            return true;
        } else {
            hilog.info(domain, tag, '%{public}s', 'code err:' + code);
        }
        hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject end ++++++++++++++++++');
        return false;
    }
}

class TestStub extends rpc.RemoteObject {
    constructor(descriptor: string) {
        super(descriptor);
    }

    asObject() {
        return this;
    }

    onRemoteMessageRequest(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence, options: rpc.MessageOption): boolean {
        hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject begin ++++++++++++++++++');
        hilog.info(domain, tag, '%{public}s', 'into onRemoteMessageRequest');
        if (code == 1) {
            hilog.info(domain, tag, '%{public}s', 'code is 1');
            let res = data.readInt();
            hilog.info(domain, tag, '%{public}s', 'readInt, res is :' + res);
            reply.writeInt(123);
            return true;
        } else {
            hilog.info(domain, tag, '%{public}s', 'code err:' + code);
        }
        hilog.info(domain, tag, '%{public}s', '++++++++++++++++++ remoteObject end ++++++++++++++++++');
        return false;
    }
}


class MyDeathRecipient implements rpc.DeathRecipient {
    onRemoteDied: () => void = () => {
        hilog.info(domain, tag, '%{public}s', 'into onRemoteDied');
    }
}

class TestOption extends rpc.MessageOption{
    constructor(syncFlags?: int, waitTime?: int) {
        super(syncFlags, waitTime);
    }
}

function isEqualArrayBuffer(
    arr1: Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array | Float64Array,
    arr2: Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array | Float64Array,
): boolean {
    //就检查两个参数是否都是TypeArray
    if (!ArrayBuffer.isView(arr1) || !ArrayBuffer.isView(arr2)) {
        return false;
    }

    // 检查长度是否相同
    if (arr1.length != arr2.length) {
        return false;
    }

    // 直接比较底层字节数据
    const view1 = new Uint8Array(arr1.buffer, arr1.byteOffset, arr1.byteLength);
    const view2 = new Uint8Array(arr2.buffer, arr2.byteOffset, arr2.byteLength);

    // 逐个字节比较
    for (let i = 0; i < view1.length; i++) {
        if (view1[i] != view2[i]) {
            return false;
        }
    }

    return true;
}

function sendMessageRequestCallback(err: BusinessError | null, result: rpc.RequestResult | undefined) {

    try {
        if (result != null) {
            hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback');
            expect(result.errCode).assertEqual(0);
            let res = result.reply.readInt();
            hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback read result ' + res);
            expect(res).assertEqual(999);
        }
    } catch(error) {
        hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback err is ' + error);
    }
}

function sendMessageRequestCallback_Proxy(err: BusinessError | null, result: rpc.RequestResult | undefined) {

    try {
        if (result != null) {
            hilog.info(domain, tag, '%{public}s', 'sendMessageRequestCallback_Proxy Callback');
            expect(result.errCode).assertEqual(0);
            // let res: undefined;
            let res = result.reply.readRemoteObject();
        }
    } catch(error) {
        hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback err is ' + error);
        expect(error != null).assertTrue();
    }
}

function sendMessageRequestCallback_Proxy_ReadAndWrite(err: BusinessError | null, result: rpc.RequestResult | undefined) {
    try {
        if (result != null) {
            hilog.info(domain, tag, '%{public}s', 'sendMessageRequestCallback_Proxy_ReadAndWrite Callback');
            expect(result.errCode).assertEqual(0);
            let res = result.reply.readInt();
            hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback readInt is ' + res);
            expect(res).assertEqual(112233);
            let res_s = result.reply.readString();
            hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback readString is ' + res_s);
            expect(res_s).assertEqual("ipctest");
        }
    } catch(error) {
        hilog.info(domain, tag, '%{public}s', 'sendMessageRequest Callback err is ' + error);
        expect(error != null).assertTrue();
    }
}

async function toConnectAbility() {
    hilog.info(domain, tag, '%{public}s', " -----toConnectAbility-----");
    let want: Want = {
        bundleName: bundleNameRpc,
        abilityName: abilityNameRpc
    };
    try {
        hilog.info(domain, tag, '%{public}s', '-----connectServiceExtensionAbility is begin-----');
        let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'connectServiceExtensionAbility, context: ' + context);
        connectId = context.connectServiceExtensionAbility(want, {
            onConnect: (elementName: bundleManager.ElementName, remote: rpc.IRemoteObject) =>  {
                hilog.info(domain, tag, '%{public}s', "ConnectOptions is  onConnect");
                gIRemoteObject = remote;
                hilog.info(domain, tag, '%{public}s', "ConnectOptions gIRemoteObject is " + gIRemoteObject);
            },
            onDisconnect: (elementName: bundleManager.ElementName) =>  {
                hilog.info(domain, tag, '%{public}s', "ConnectOptions is  onDisconnect");
            },
            onFailed: (code: int) => {
                hilog.info(domain, tag, '%{public}s', "ConnectOptions is  onFailed");
            }
        });
        hilog.info(domain, tag, '%{public}s', "connectServiceExtensionAbility success. got id: " + connectId);
    } catch (err) {
        hilog.error(domain, tag, '%{public}s', "connectServiceExtensionAbility failed: " + err);
    } finally {
        hilog.info(domain, tag, '%{public}s', "connectServiceExtensionAbility success. got id: " + connectId);
    }
}

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        beforeAll(async() => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', 'beforeAll in');
            try {
                await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actsipctaihetest.static");
                await Utils.msSleep(6000);
                await  toConnectAbility();
                await Utils.msSleep(4000);
                hilog.info(domain, tag, '%{public}s', 'beforeAll gIRemoteObject is ' + gIRemoteObject);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'beforeAll error is: ' + error);
            }
            hilog.info(domain, tag, '%{public}s', 'beforeAll done');
        })

        /**
         * @tc.number   SUB_IPC_MessageSequence_WriteInt_ReadInt_0100
         * @tc.name     SUB_IPC_MessageSequence_WriteInt_ReadInt_0100
         * @tc.desc     test MessageSequence WriteInt and ReadInt
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteInt_ReadInt_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);

            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_WriteInt_ReadInt_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input = 123;
                data.writeInt(input);
                let res = data.readInt();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInt_ReadInt_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInt_ReadInt_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_WriteInt_ReadInt_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100
         * @tc.name     SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100
         * @tc.desc     test MessageSequence WriteInterfaceToken and ReadInterfaceToken
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input = "this is interfaceToken";
                data.writeInterfaceToken(input);
                let res = data.readInterfaceToken();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_setCapacity_getCapacity_0100
         * @tc.name     SUB_IPC_MessageSequence_setCapacity_getCapacity_0100
         * @tc.desc     test MessageSequence setCapacity and getCapacity
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_setCapacity_getCapacity_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_setCapacity_getCapacity_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input = 666;
                data.setCapacity(input);
                let res = data.getCapacity();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_getCapacity_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_getCapacity_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_setCapacity_getCapacity_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeNoException_readException_0100
         * @tc.name     SUB_IPC_MessageSequence_writeNoException_readException_0100
         * @tc.desc     test MessageSequence writeNoException and readException
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeNoException_readException_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeNoException_readException_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                data.writeNoException();
                data.readException();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_readException_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_readException_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeNoException_readException_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeLong_readLong_0100
         * @tc.name     SUB_IPC_MessageSequence_writeLong_readLong_0100
         * @tc.desc     test MessageSequence writeLong and readLong
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeLong_readLong_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeLong_readLong_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input = 99999999999;
                data.writeLong(input);
                let res = data.readLong();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_readLong_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_readLong_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeLong_readLong_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100
         * @tc.name     SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100
         * @tc.desc     test MessageSequence writeBoolean and readBoolean
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input = true;
                data.writeBoolean(input);
                let res = data.readBoolean();
                expect(res).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200
         * @tc.name     SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200
         * @tc.desc     test MessageSequence writeBoolean and readBoolean
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input = false;
                data.writeBoolean(input);
                let res = data.readBoolean();
                expect(res).assertFalse();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeString_readString_0100
         * @tc.name     SUB_IPC_MessageSequence_writeString_readString_0100
         * @tc.desc     test MessageSequence writeString and readString
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeString_readString_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeString_readString_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input = "this is test write and read string";
                data.writeString(input);
                let res = data.readString();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_readString_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_readString_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeString_readString_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeByteArray_0100
         * @tc.name     SUB_IPC_MessageSequence_writeByteArray_0100
         * @tc.desc     test MessageSequence writeByteArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeByteArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeByteArray_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeByteArray(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeByteArray_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100
         * @tc.name     SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100
         * @tc.desc     test MessageSequence writeIntArray and readIntArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeIntArray(input);
                let res = data.readIntArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200
         * @tc.name     SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200
         * @tc.desc     test MessageSequence writeIntArray and readIntArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeIntArray(input);
                let res: Array<int> = new Array<int>(input.length);
                data.readIntArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100
         * @tc.name     SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100
         * @tc.desc     test MessageSequence writeDoubleArray and readDoubleArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];
                data.writeDoubleArray(input);
                let res = data.readDoubleArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200
         * @tc.name     SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200
         * @tc.desc     test MessageSequence writeDoubleArray and readDoubleArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];
                data.writeDoubleArray(input);
                let res: Array<double> = new Array<double>(input.length);
                data.readDoubleArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100
         * @tc.name     SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100
         * @tc.desc     test MessageSequence writeStringArray and readStringArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<string> = ["this", "is", "a", "test", "stirng", "array"];
                data.writeStringArray(input);
                let res = data.readStringArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200
         * @tc.name     SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200
         * @tc.desc     test MessageSequence writeStringArray and readStringArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<string> = ["this", "is", "a", "test", "stirng", "array"];
                data.writeStringArray(input);
                let res: Array<string> = new Array<string>(input.length);
                data.readStringArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100
         * @tc.name     SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100
         * @tc.desc     test MessageSequence writeBooleanArray and readBooleanArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<boolean> = [true, false, true, false, true, false, true, false, true, false];
                data.writeBooleanArray(input);
                let res = data.readBooleanArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200
         * @tc.name     SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200
         * @tc.desc     test MessageSequence writeBooleanArray and readBooleanArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<boolean> = [false, true, false, true, false, true, false, true, false, true];
                data.writeBooleanArray(input);
                let res: Array<boolean> = new Array<boolean>(input.length);
                data.readBooleanArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100
         * @tc.name     SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100
         * @tc.desc     test MessageSequence writeParcelable and readParcelable
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            try {
                let parcelable = new MyParcelable(1, "this is a test parcelable");
                data.writeParcelable(parcelable);
                let res: MyParcelable = new MyParcelable(0, "");
                data.readParcelable(res);
                expect(res.num).assertEqual(1);
                expect(res.str).assertEqual("this is a test parcelable");
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100
         * @tc.name     SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100
         * @tc.desc     test MessageSequence writeParcelableArray and readParcelableArray
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            try {
                let parcelable1 = new MyParcelable(1, "this is a test parcelable 1");
                let parcelable2 = new MyParcelable(2, "this is a test parcelable 2");
                let parcelable3 = new MyParcelable(3, "this is a test parcelable 3");
                let input: Array<rpc.Parcelable> = [parcelable1, parcelable2, parcelable3];
                data.writeParcelableArray(input);
                let res: Array<rpc.Parcelable> = [new MyParcelable(0, ""), new MyParcelable(0, ""), new MyParcelable(0, "")];
                data.readParcelableArray(res);
                for (let i = 0; i < res.length; i++) {
                    expect((res[i] as MyParcelable).num).assertEqual((input[i] as MyParcelable).num);
                    expect((res[i] as MyParcelable).str).assertEqual((input[i] as MyParcelable).str);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100 reclaim done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer with int32
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(4 * 10);
            let int32View = new Int32Array(buffer);
            for (let i = 0; i < int32View.length; i++) {
                int32View[i] = i * 2 + 1;
                if (i % 2 != 0) {
                    int32View[i] = -int32View[i];
                }
            }
            let size: int = buffer.byteLength as int;

            try {
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer and readRawDataBuffer with int32
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(4 * 10);
            let int32View = new Int32Array(buffer);
            for (let i = 0; i < int32View.length; i++) {
                int32View[i] = i * 2 + 1;
                if (i % 2 != 0) {
                    int32View[i] = -int32View[i];
                }
            }
            let size: int = buffer.byteLength as int;

            try {
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }

            try {
                let result = data.readRawDataBuffer(size);
                let readInt32View = new Int32Array(result);
                let assertE = isEqualArrayBuffer(readInt32View, int32View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer with uint8
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(1 * 10);
            let uint8View = new Uint8Array(buffer);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i * 2 + 1;
            }
            let size: int = buffer.byteLength as int;

            try {
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer and readRawDataBuffer with uint8
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(1 * 10);
            let uint8View = new Uint8Array(buffer);
            for (let i = 0; i < uint8View.length; i++) {
                uint8View[i] = i * 2 + 1;
            }
            let size: int = buffer.byteLength as int;

            try {
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }

            try {
                let result = data.readRawDataBuffer(size);
                let readUint8View = new Uint8Array(result);
                let assertE = isEqualArrayBuffer(readUint8View, uint8View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer with int8
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(1 * 10);
            let int8View = new Int8Array(buffer);
            for (let i = 0; i < int8View.length; i++) {
                int8View[i] = i * 2 + 1;
                if (i % 2 != 0) {
                    int8View[i] = -int8View[i];
                }
            }
            let size: int = buffer.byteLength as int;

            try {
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer and readRawDataBuffer with int8
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(1 * 10);
            let int8View = new Int8Array(buffer);
            for (let i = 0; i < int8View.length; i++) {
                int8View[i] = i * 2 + 1;
                if (i % 2 != 0) {
                    int8View[i] = -int8View[i];
                }
            }
            let size: int = buffer.byteLength as int;

            try {
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }

            try {
                let result = data.readRawDataBuffer(size);
                let readInt8View = new Uint8Array(result);
                let assertE = isEqualArrayBuffer(readInt8View, int8View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer with float32
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(4 * 10);
            let float32View = new Float32Array(buffer);
            for (let i = 0; i < float32View.length; i++) {
                float32View[i] = i * 2 + i * 1.0 / 10;
                if (i % 2 != 0) {
                    float32View[i] = -float32View[i];
                }
            }
            let size: int = buffer.byteLength as int;

            try {
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer and readRawDataBuffer with float32
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            let buffer = new ArrayBuffer(4 * 10);
            let float32View = new Float32Array(buffer);
            for (let i = 0; i < float32View.length; i++) {
                float32View[i] = i * 2 + i * 1.0 / 10;
                if (i % 2 != 0) {
                    float32View[i] = -float32View[i];
                }
            }
            let size: int = buffer.byteLength as int;

            try {
                data.writeRawDataBuffer(buffer, size);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }

            try {
                let result = data.readRawDataBuffer(size);
                let readFloat32View = new Float32Array(result);
                let assertE = isEqualArrayBuffer(readFloat32View, float32View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_Ashmem_create_0100
         * @tc.name     SUB_IPC_Ashmem_create_0100
         * @tc.desc     test create Ashmem
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_Ashmem_create_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_create_0100 --------------------');

            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_create_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_Ashmem_getAshmemSize_0100
         * @tc.name     SUB_IPC_Ashmem_getAshmemSize_0100
         * @tc.desc     test Ashmem getAshmemSize
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_Ashmem_getAshmemSize_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_getAshmemSize_0100 --------------------');

            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                let size = ashmem.getAshmemSize();
                expect(size == 1024 * 1024).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_getAshmemSize_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_getAshmemSize_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_getAshmemSize_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100
         * @tc.name     SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100
         * @tc.desc     test MessageSequence writeAshmem Ashmem
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100 --------------------');

            let data = rpc.MessageSequence.create();
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                data.writeAshmem(ashmem);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100 reclaim done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100
         * @tc.name     SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100
         * @tc.desc     test MessageSequence writeAshmem and readAshmem
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 --------------------');

            let data = rpc.MessageSequence.create();
            let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
            try {
                data.writeAshmem(ashmem);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 finally done');
            }

            try {
                let res = data.readAshmem();
                expect(res.getAshmemSize() == ashmem.getAshmemSize()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 finally done');
                data.reclaim();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageOption_create_0100
         * @tc.name     SUB_IPC_MessageOption_create_0100
         * @tc.desc     test MessageOption create
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageOption_create_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_0100 --------------------');

            try {
                let option = new rpc.MessageOption();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageOption_create_one_value_0100
         * @tc.name     SUB_IPC_MessageOption_create_one_value_0100
         * @tc.desc     test MessageOption create with ont input
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageOption_create_one_value_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_one_value_0100 --------------------');

            try {
                let option = new rpc.MessageOption(true);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_one_value_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_one_value_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_one_value_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageOption_isAsync_0100
         * @tc.name     SUB_IPC_MessageOption_isAsync_0100
         * @tc.desc     test MessageOption is async
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageOption_isAsync_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_isAsync_0100 --------------------');

            try {
                let option = new rpc.MessageOption(true);
                let res = option.isAsync();
                expect(res).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_isAsync_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageOption_isAsync_false_0100
         * @tc.name     SUB_IPC_MessageOption_isAsync_false_0100
         * @tc.desc     test MessageOption is async false
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageOption_isAsync_false_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_isAsync_false_0100 --------------------');

            try {
                let option = new rpc.MessageOption(false);
                let res = option.isAsync();
                expect(res).assertFalse();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_false_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_false_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_isAsync_false_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_Ashmem_create_with_other_ashmem_0100
         * @tc.name     SUB_IPC_Ashmem_create_with_other_ashmem_0100
         * @tc.desc     test create Ashmem with other ashmem
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_Ashmem_create_with_other_ashmem_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_create_with_other_ashmem_0100 --------------------');

            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                let newAshmem = rpc.Ashmem.create(ashmem);
                expect(ashmem.getAshmemSize() == newAshmem.getAshmemSize()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_with_other_ashmem_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_with_other_ashmem_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_create_with_other_ashmem_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_Ashmem_mapReadWriteAshmem_0100
         * @tc.name     SUB_IPC_Ashmem_mapReadWriteAshmem_0100
         * @tc.desc     test create Ashmem with other ashmem
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_Ashmem_mapReadWriteAshmem_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_mapReadWriteAshmem_0100 --------------------');

            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                ashmem.mapReadWriteAshmem();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_mapReadWriteAshmem_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_mapReadWriteAshmem_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_mapReadWriteAshmem_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_IPCSkeleton_getCallingPid_0100
         * @tc.name     SUB_IPC_IPCSkeleton_getCallingPid_0100
         * @tc.desc     test IPCSkeleton getCallingPid
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_IPCSkeleton_getCallingPid_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingPid_0100 --------------------');

            try {
                let callerPid = rpc.IPCSkeleton.getCallingPid();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid_0100 callerPid is: ' + callerPid);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingPid_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_IPCSkeleton_getCallingUid_0100
         * @tc.name     SUB_IPC_IPCSkeleton_getCallingUid_0100
         * @tc.desc     test IPCSkeleton getCallingUid
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_IPCSkeleton_getCallingUid_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingUid_0100 --------------------');

            try {
                let callerUid = rpc.IPCSkeleton.getCallingUid();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid_0100 callerUid is: ' + callerUid);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingUid_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_IPCSkeleton_getCallingTokenId_0100
         * @tc.name     SUB_IPC_IPCSkeleton_getCallingTokenId_0100
         * @tc.desc     test IPCSkeleton getCallingTokenId
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_IPCSkeleton_getCallingTokenId_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingTokenId_0100 --------------------');

            try {
                let callerTokenId = rpc.IPCSkeleton.getCallingTokenId();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId_0100 callerTokenId is: ' + callerTokenId);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingTokenId_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRemoteObject_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRemoteObject_0100
         * @tc.desc     test MessageSequence writeRemoteObject
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRemoteObject_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRemoteObject_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                data.writeRemoteObject(testRemoteObject);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_0100 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100
         * @tc.desc     test MessageSequence writeRemoteObject and readRemoteObject
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100 --------------------');

            let data =  rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                data.writeRemoteObject(testRemoteObject);
                let res = data.readRemoteObject();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readFileDescriptor_0100
         * @tc.name     SUB_IPC_MessageSequence_readFileDescriptor_0100
         * @tc.desc     test MessageSequence readFileDescriptor
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readFileDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFileDescriptor_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
                let pathDir = context.filesDir;
                let filePath = pathDir + "/test1.txt";
                let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
                data.writeFileDescriptor(file.fd);
                let res = data.readFileDescriptor();
                expect(res >= file.fd).assertTrue();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_0100 error is: ' + err.code);
                expect(err == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_0100 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFileDescriptor_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeFileDescriptor_0100
         * @tc.name     SUB_IPC_MessageSequence_writeFileDescriptor_0100
         * @tc.desc     test MessageSequence writeFileDescriptor
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeFileDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFileDescriptor_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
                let pathDir = context.filesDir;
                let filePath = pathDir + "/test4.txt";
                let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
                data.writeFileDescriptor(file.fd);

            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFileDescriptor_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_closeFileDescriptor_0100
         * @tc.name     SUB_IPC_MessageSequence_closeFileDescriptor_0100
         * @tc.desc     test MessageSequence closeFileDescriptor
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_closeFileDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_closeFileDescriptor_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
                let pathDir = context.filesDir;
                let filePath = pathDir + "/test4.txt";
                let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
                data.writeFileDescriptor(file.fd);
                rpc.MessageSequence.closeFileDescriptor(file.fd);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_closeFileDescriptor_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteObject_sendMessageRequest_0100
         * @tc.name     SUB_IPC_RemoteObject_sendMessageRequest_0100
         * @tc.desc     test RemoteObject sendMessageRequest
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteObject_sendMessageRequest_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_0100 --------------------');

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let option = new rpc.MessageOption();
                data.writeInt(666);
                await testRemoteObject.sendMessageRequest(1, data, reply, option)
                    .then((ret: rpc.RequestResult) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 errCode is: ' + JSON.stringify(ret.errCode) );
                        let res = ret.reply.readInt();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 res is: ' + res);
                        expect(res == 999).assertTrue();
                    }).catch((err) => {
                        expect(err == null).assertTrue();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 err in catch is: ' + err);
                        expect(err == null).assertTrue();
                    }).finally(() => {
                        data.reclaim();
                        reply.reclaim();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 reclaim done');
                    })

            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteObject_sendMessageRequest_0200
         * @tc.name     SUB_IPC_RemoteObject_sendMessageRequest_0200
         * @tc.desc     test RemoteObject sendMessageRequest SYNC
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteObject_sendMessageRequest_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_0200 --------------------');

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let option = new rpc.MessageOption();
                option.setAsync(false);
                data.writeInt(666);
                testRemoteObject.sendMessageRequest(1, data, reply, option);
                await Utils.msSleep(3000);
                let res = reply.readInt();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0200 res is: ' + res);
                expect(res == 999).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0200 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteObject_sendMessageRequest_0300
         * @tc.name     SUB_IPC_RemoteObject_sendMessageRequest_0300
         * @tc.desc     test RemoteObject sendMessageRequest ASYNC
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteObject_sendMessageRequest_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(2000);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_0300 --------------------');

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let option = new rpc.MessageOption();
                option.setAsync(true);
                data.writeInt(666);
                testRemoteObject.sendMessageRequest(1, data, reply, option);
                await Utils.msSleep(3000);
                let res = reply.readInt();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0300 res is: ' + res);
                expect(res == 999).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0300 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0300 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_0300 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteObject_sendMessageRequest_0400
         * @tc.name     SUB_IPC_RemoteObject_sendMessageRequest_0400
         * @tc.desc     test RemoteObject sendMessageRequest SYNC
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteObject_sendMessageRequest_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(2000);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_0400 --------------------');

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let option = new rpc.MessageOption();
                option.setAsync(false);
                data.writeInt(666);
                await testRemoteObject.sendMessageRequest(1, data, reply, option)
                    .then((ret: rpc.RequestResult) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 .then.data is: ' + JSON.stringify(ret.data) );
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 .then.reply is: ' + JSON.stringify(ret.reply) );
                        let res = reply.readInt();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 res is: ' + res);
                        expect(res == 999).assertTrue();
                    }).catch((err) => {
                        expect(err == null).assertTrue();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 err in catch is: ' + err);
                    })
                    .finally(() => {
                        data.reclaim();
                        reply.reclaim();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 reclaim done');
                    })
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0400 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_0400 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100
         * @tc.name     SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100
         * @tc.desc     test RemoteObject sendMessageRequest
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(2000);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100 --------------------');

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let option = new rpc.MessageOption();
                data.writeInt(666);
                testRemoteObject.sendMessageRequest(1, data, reply, option, sendMessageRequestCallback);
                await Utils.msSleep(2000);

            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteObject_getDescriptor_0100
         * @tc.name     SUB_IPC_RemoteObject_getDescriptor_0100
         * @tc.desc     test RemoteObject getDescriptor
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteObject_getDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getDescriptor_0100 --------------------');

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let res = testRemoteObject.getDescriptor();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor_0100 res is: ' + res);
                expect(res == "testObject").assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor_0100 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getDescriptor_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteObject_getCallingPid_0100
         * @tc.name     SUB_IPC_RemoteObject_getCallingPid_0100
         * @tc.desc     test RemoteObject getCallingPid
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteObject_getCallingPid_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getCallingPid_0100 --------------------');

            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let res = testRemoteObject.getCallingPid();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid_0100 res is: ' + res);
                expect(res == rpc.IPCSkeleton.getCallingPid()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getCallingPid_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteObject_getCallingUid_0100
         * @tc.name     SUB_IPC_RemoteObject_getCallingUid_0100
         * @tc.desc     test RemoteObject getCallingUid
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteObject_getCallingUid_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getCallingUid_0100 --------------------');

            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let res = testRemoteObject.getCallingUid();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid_0100 res is: ' + res);
                expect(res == rpc.IPCSkeleton.getCallingUid()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getCallingUid_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_registerDeathRecipient_0100
         * @tc.name     SUB_IPC_registerDeathRecipient_0100
         * @tc.desc     test registerDeathRecipient
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_registerDeathRecipient_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_registerDeathRecipient_0100 --------------------');

            try {
                let deathRecipient = new MyDeathRecipient();
                let samgr = rpc.IPCSkeleton.getContextObject();
                samgr.registerDeathRecipient(deathRecipient, 0);
                samgr.unregisterDeathRecipient(deathRecipient, 0);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient_0100 finally done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_registerDeathRecipient_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_registerDeathRecipient_0200
         * @tc.name     SUB_IPC_registerDeathRecipient_0200
         * @tc.desc     test registerDeathRecipient
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_registerDeathRecipient_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_registerDeathRecipient_0200 --------------------');
            try {
                let deathRecipient = new MyDeathRecipient();
                gIRemoteObject?.registerDeathRecipient(deathRecipient, 0);
                gIRemoteObject?.unregisterDeathRecipient(deathRecipient, 0);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient_0200 finally done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_registerDeathRecipient_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_SendMessageRequest_0100
         * @tc.name     SUB_IPC_RemoteProxy_SendMessageRequest_0100
         * @tc.desc     test RemoteProxy SendMessageRequest
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_SendMessageRequest_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_0100 --------------------');

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            let option = new rpc.MessageOption();
            try {
                // CheckSystemAbility
                data.writeInterfaceToken("ohos.samgr.accessToken");
                data.writeInt(4700);
                data.writeBoolean(true);

                let samgr = rpc.IPCSkeleton.getContextObject();

                await samgr.sendMessageRequest(12, data, reply, option)
                    .then((ret: rpc.RequestResult) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 .then.errCode is: ' + ret.errCode);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 .then.code is: ' + ret.code);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 .then.reply is: ' + ret.reply);
                    }).catch((err) => {
                        expect(err == null).assertTrue();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 err in catch is: ' + err);
                    })
                    .finally(() => {
                        data.reclaim();
                        reply.reclaim();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 reclaim done');
                    })
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100
         * @tc.name     SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100
         * @tc.desc     test RemoteProxy SendMessageRequest after write and read Proxy
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(2000);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 --------------------');

            let dataM = rpc.MessageSequence.create();

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            let option = new rpc.MessageOption();
            try {
                // CheckSystemAbility
                data.writeInterfaceToken("ohos.samgr.accessToken");
                data.writeInt(4700);
                data.writeBoolean(true);

                let samgr = rpc.IPCSkeleton.getContextObject();

                dataM.writeRemoteObject(samgr);
                let res = dataM.readRemoteObject();

                await res.sendMessageRequest(12, data, reply, option)
                    .then((ret: rpc.RequestResult) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 .then.errCode is: ' + ret.errCode);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 .then.code is: ' + ret.code);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 .then.data is: ' + JSON.stringify(ret.data) );
                        expect(ret.data != null).assertTrue();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 .then.reply is: ' + JSON.stringify(ret.reply) );
                    }).catch((err) => {
                        expect(err == null).assertTrue();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 err in catch is: ' + err);
                    })
                    .finally(() => {
                        data.reclaim();
                        reply.reclaim();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 reclaim done');
                    })
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200
         * @tc.name     SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200
         * @tc.desc     test RemoteProxy SendMessageRequest
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let reply = rpc.MessageSequence.create();
                let option = new rpc.MessageOption();
                data.writeInt(4700);
                data.writeBoolean(true);

                gIRemoteObject?.sendMessageRequest(1, data, reply, option)
                    .then((ret: rpc.RequestResult) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 .then.errCode is: ' + ret.errCode);
                        let res = reply.readInt();
                        expect(res).assertEqual(4700);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 reply res is: ' + res);
                    })
                    .catch((err) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 err in catch is: ' + err);
                        expect(err == null).assertTrue();
                    })
                    .finally(() => {
                        data.reclaim();
                        reply.reclaim();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 reclaim done');
                    })
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100
         * @tc.name     SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100
         * @tc.desc     test RemoteProxy SendMessageRequest  callback after write and read Proxy
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100 --------------------');

            let dataM = rpc.MessageSequence.create();

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            let option = new rpc.MessageOption();
            try {
                // CheckSystemAbility
                data.writeInterfaceToken("ohos.samgr.accessToken");
                data.writeInt(4700);
                data.writeBoolean(true);

                let samgr = rpc.IPCSkeleton.getContextObject();

                dataM.writeRemoteObject(samgr);
                let res = dataM.readRemoteObject();

                res.sendMessageRequest(12, data, reply, option, sendMessageRequestCallback_Proxy);
                await Utils.msSleep(2000);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200
         * @tc.name     SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200
         * @tc.desc     test RemoteProxy SendMessageRequest  callback after write and read Proxy
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200 --------------------');
            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let option = new rpc.MessageOption();
                data.writeInt(112233);
                data.writeString("ipctest");

                gIRemoteObject?.sendMessageRequest(2, data, reply, option, sendMessageRequestCallback_Proxy_ReadAndWrite);
                await Utils.msSleep(2000);

            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_IsObjectDead_0100
         * @tc.name     SUB_IPC_RemoteProxy_IsObjectDead_0100
         * @tc.desc     test RemoteProxy IsObjectDead
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_IsObjectDead_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_IsObjectDead_0100 --------------------');

            let dataM = rpc.MessageSequence.create();

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            let option = new rpc.MessageOption();
            try {
                // CheckSystemAbility
                data.writeInterfaceToken("ohos.samgr.accessToken");
                data.writeInt(4700);
                data.writeBoolean(true);

                let samgr = rpc.IPCSkeleton.getContextObject();

                dataM.writeRemoteObject(samgr);
                let res = dataM.readRemoteObject();

                let result = res.isObjectDead();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0100 result is: ' + result);
                expect(result).assertFalse();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0100 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_IsObjectDead_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_IsObjectDead_0200
         * @tc.name     SUB_IPC_RemoteProxy_IsObjectDead_0200
         * @tc.desc     test RemoteProxy IsObjectDead
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_IsObjectDead_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_IsObjectDead_0200 --------------------');
            try {
                let result = gIRemoteObject?.isObjectDead();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0200 result is: ' + result);
                expect(result).assertFalse();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_IsObjectDead_0200 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_IsObjectDead_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_getDescriptor_0100
         * @tc.name     SUB_IPC_RemoteProxy_getDescriptor_0100
         * @tc.desc     test RemoteProxy getDescriptor
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_getDescriptor_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_getDescriptor_0100 --------------------');

            let dataM = rpc.MessageSequence.create();

            let data = rpc.MessageSequence.create();
            let option = new rpc.MessageOption();
            try {
                // CheckSystemAbility
                data.writeInterfaceToken("ohos.samgr.accessToken");
                data.writeInt(4700);
                data.writeBoolean(true);

                let samgr = rpc.IPCSkeleton.getContextObject();

                dataM.writeRemoteObject(samgr);
                let res = dataM.readRemoteObject();
                let reult = res.getDescriptor();
                expect(reult == "").assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_getDescriptor_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_RemoteProxy_getDescriptor_0200
         * @tc.name     SUB_IPC_RemoteProxy_getDescriptor_0200
         * @tc.desc     test RemoteProxy getDescriptor RemoteProxy
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_RemoteProxy_getDescriptor_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_getDescriptor_0200 --------------------');
            try {
                let reult = gIRemoteObject?.getDescriptor();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0200 getDescriptor is: ' + reult);
                expect(reult).assertEqual("rpcTestAbility");
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_getDescriptor_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_getDescriptor_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_IRemoteBroker_asObject_0100
         * @tc.name     SUB_IPC_IRemoteBroker_asObject_0100
         * @tc.desc     test asObject
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_IRemoteBroker_asObject_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IRemoteBroker_asObject_0100 --------------------');

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestStub("testObject");
                let testRemoteObject1 = testRemoteObject.asObject();
                let option = new rpc.MessageOption();
                option.setAsync(false);
                data.writeInt(666);
                await testRemoteObject1.sendMessageRequest(1, data, reply, option)
                    .then((ret: rpc.RequestResult) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 .then.data is: ' + JSON.stringify(ret.data) );
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 .then.reply is: ' + JSON.stringify(ret.reply) );
                        let res = reply.readInt();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 res is: ' + res);
                        expect(res == 123).assertTrue();
                    }).catch((err) => {
                        expect(err == null).assertTrue();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 err in catch is: ' + err);
                    });
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IRemoteBroker_asObject_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IRemoteBroker_asObject_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100
         * @tc.desc     test writeRemoteObject errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                data.reclaim();
                data.writeRemoteObject(testRemoteObject);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100
         * @tc.desc     test readRemoteObject errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                data.writeRemoteObject(testRemoteObject);
                data.reclaim();
                data.readRemoteObject();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100
         * @tc.desc     test writeInterfaceToken errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.writeInterfaceToken("ipctest");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200
         * @tc.desc     test RemoteProxy SendMessageRequest after write and read Proxy
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.writeInterfaceToken("");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100
         * @tc.desc     test readInterfaceToken errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.writeInterfaceToken("testRemoteObject");
                data.reclaim();
                data.readInterfaceToken();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100
         * @tc.desc     test setCapacity errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.setCapacity(64);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100
         * @tc.desc     test writeNoException errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.writeNoException();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readException_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readException_ErrorCode_0100
         * @tc.desc     test readException errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readException_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readException_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.readException();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readException_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readException_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readException_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readException_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeInt_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeInt_ErrorCode_0100
         * @tc.desc     test writeInt errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeInt_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.writeInt(0);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeInt_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readInt_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readInt_ErrorCode_0100
         * @tc.desc     test readInt errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readInt_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readInt_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.writeInt(0);
                data.reclaim();
                data.readInt();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInt_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInt_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readInt_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readInt_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeLong_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeLong_ErrorCode_0100
         * @tc.desc     test writeLong errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeLong_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.writeLong(0);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeLong_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readLong_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readLong_ErrorCode_0100
         * @tc.desc     test readLong errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readLong_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readLong_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.writeLong(0);
                data.reclaim();
                data.readLong();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLong_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLong_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLong_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readLong_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100
         * @tc.desc     test writeBoolean errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.writeBoolean(true);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100
         * @tc.desc     test readBoolean errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.writeBoolean(true);
                data.reclaim();
                data.readBoolean();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeString_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeString_ErrorCode_0100
         * @tc.desc     test writeString errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeString_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeString_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.reclaim();
                data.writeString("test");
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeString_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readString_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readString_ErrorCode_0100
         * @tc.desc     test readString errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readString_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readString_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                data.writeString("test");
                data.reclaim();
                data.readString();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readString_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readString_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readString_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readString_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100
         * @tc.desc     test writeParcelable errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let parcelable = new MyParcelable(1, "this is a test parcelable");
                data.reclaim();
                data.writeParcelable(parcelable);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100
         * @tc.desc     test readParcelable errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {

                let parcelable = new MyParcelable(1, "this is a test parcelable");
                data.writeParcelable(parcelable);
                data.reclaim();
                let res: MyParcelable = new MyParcelable(0, "");
                data.readParcelable(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100
         * @tc.desc     test writeIntArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.reclaim();
                data.writeIntArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100
         * @tc.desc     test readIntArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeIntArray(input);
                let res: Array<int> = new Array<int>(input.length);
                data.reclaim();
                data.readIntArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200
         * @tc.desc     test readIntArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeIntArray(input);
                data.reclaim();
                let res = data.readIntArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100
         * @tc.desc     test writeDoubleArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
                data.reclaim();
                data.writeDoubleArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100
         * @tc.desc     test readDoubleArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
                data.writeDoubleArray(input);
                let res: Array<double> = new Array<double>(input.length);
                data.reclaim();
                data.readDoubleArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200
         * @tc.desc     test readDoubleArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
                data.writeDoubleArray(input);
                data.reclaim();
                let res = data.readDoubleArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100
         * @tc.desc     test writeBooleanArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<Boolean> = [false, true, false, true, false, true, false, true, false, true];
                data.reclaim();
                data.writeBooleanArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100
         * @tc.desc     test readBooleanArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<Boolean> = [false, true, false, true, false, true, false, true, false, true];
                data.writeBooleanArray(input);
                let res: Array<Boolean> = new Array<Boolean>(input.length);
                data.reclaim();
                data.readBooleanArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200
         * @tc.desc     test readBooleanArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<Boolean> = [false, true, false, true, false, true, false, true, false, true];
                data.writeBooleanArray(input);
                data.reclaim();
                let res = data.readBooleanArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100
         * @tc.desc     test writeStringArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<String> = ["this", "is", "a", "test", "stirng", "array"];
                data.reclaim();
                data.writeStringArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100
         * @tc.desc     test readStringArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<String> = ["this", "is", "a", "test", "stirng", "array"];
                data.writeStringArray(input);
                let res: Array<String> = new Array<String>(input.length);
                data.reclaim();
                data.readStringArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200
         * @tc.desc     test readStringArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<String> = ["this", "is", "a", "test", "stirng", "array"];
                data.writeStringArray(input);
                data.reclaim();
                let res = data.readStringArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100
         * @tc.desc     test writeParcelableArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let parcelable1 = new MyParcelable(1, "this is a test parcelable 1");
                let parcelable2 = new MyParcelable(2, "this is a test parcelable 2");
                let parcelable3 = new MyParcelable(3, "this is a test parcelable 3");
                let input: Array<rpc.Parcelable> = [parcelable1, parcelable2, parcelable3];
                data.reclaim();
                data.writeParcelableArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100
         * @tc.desc     test readParcelableArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let parcelable1 = new MyParcelable(1, "this is a test parcelable 1");
                let parcelable2 = new MyParcelable(2, "this is a test parcelable 2");
                let parcelable3 = new MyParcelable(3, "this is a test parcelable 3");
                let input: Array<rpc.Parcelable> = [parcelable1, parcelable2, parcelable3];
                data.writeParcelableArray(input);
                data.reclaim();
                let res: Array<rpc.Parcelable> = [new MyParcelable(0, ""), new MyParcelable(0, ""), new MyParcelable(0, "")];

                data.readParcelableArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100
         * @tc.desc     test writeByteArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.reclaim();
                data.writeByteArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100
         * @tc.desc     test MessageSequence writeAshmem Ashmem errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 --------------------');

            let data = rpc.MessageSequence.create();
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                data.reclaim();
                data.writeAshmem(ashmem);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100
         * @tc.desc     test MessageSequence writeAshmem Ashmem errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 --------------------');

            let data = rpc.MessageSequence.create();
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                data.writeAshmem(ashmem);
                data.reclaim();
                let res = data.readAshmem();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100
         * @tc.desc     test MessageSequence writeRawDataBuffer errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            let TEST_LEN_128M = 128 * 1024 * 1024;
            try {
                let buffer = new ArrayBuffer(TEST_LEN_128M + 4);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100
         * @tc.desc     test MessageSequence readRawDataBuffer errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            let TEST_LEN_128M = 128 * 1024 * 1024;
            try {
                let buffer = new ArrayBuffer(TEST_LEN_128M);
                let size = buffer.byteLength;
                let int32View = new Int32Array(buffer);
                int32View.fill(1);
                data.writeRawDataBuffer(buffer, size);
                let readBuffer = data.readRawDataBuffer(TEST_LEN_128M + 1)
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100
         * @tc.desc     test MessageSequence readFileDescriptor errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
                let pathDir = context.filesDir;
                let filePath = pathDir + "/test1.txt";
                let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
                data.writeFileDescriptor(file.fd);
                data.reclaim();
                let res = data.readFileDescriptor();

            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 error is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 reclaim done');
            }

            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100
         * @tc.desc     test MessageSequence writeFileDescriptor errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
                let pathDir = context.filesDir;
                let filePath = pathDir + "/test3.txt";
                let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
                data.reclaim();
                data.writeFileDescriptor(file.fd);

            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100 error is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFileDescriptor_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200
         * @tc.desc     test MessageSequence writeFileDescriptor errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
                let pathDir = context.filesDir;
                let filePath = pathDir + "/test3.txt";
                let file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);

                rpc.MessageSequence.closeFileDescriptor(file.fd);
                data.writeFileDescriptor(file.fd);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200 error is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300
         * @tc.name     SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300
         * @tc.desc     test MessageSequence writeFileDescriptor errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300 --------------------');
            let data =  rpc.MessageSequence.create();
            try {
                data.writeFileDescriptor(-1);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300 error is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100
         * @tc.desc     test MessageSequence closeFileDescriptor errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100 --------------------');
            let data =  rpc.MessageSequence.create();
            try {

                rpc.MessageSequence.closeFileDescriptor(-1);

            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100 error is: ' + err.code);
                expect(err.code == 401).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeFloatArray
         * @tc.name      SUB_IPC_MessageSequence_writeFloatArray
         * @tc.desc      test SUB_IPC_MessageSequence_writeFloatArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeFloatArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeFloatArray --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let b: Double = 2;
                let c: Double = 3;
                let a: Array<Double> = [b, c];
                hilog.info(domain, tag, 'Tonny2503004 AA0270 a ' + a)
                data.writeFloatArray(a);
                let res = data.readFloatArray();
                hilog.info(domain, tag, 'Tonny2503004 AA0273 res ' + res)
                expect(res).assertDeepEquals(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_MessageSequence_writeFloatArray error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeFloatArray --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_IntArray1
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_IntArray1
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_IntArray1
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_IntArray1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_IntArray1 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let intArray: Array<int> = [11, 22, 33, 44, 55, 66, 77, 88, 99, 100];
                data.writeIntArray(intArray);
                let res: Array<int> = data.readIntArray();
                hilog.info(domain, tag, 'Tonny2503004 AA0111 intArray ' + intArray)
                hilog.info(domain, tag, 'Tonny2503004 AA0112      res ' + res)
                expect(res).assertDeepEquals(intArray);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_IntArray1 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_IntArray1 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_IntArray1 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_IntArray2
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_IntArray2
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_IntArray2
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_IntArray2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_IntArray2 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let intArray: Array<int> = [121, 212, 323, 414, 525, 616, 77, 88, 99, 100];
                data.writeIntArray(intArray);
                let res: Array<int> = data.readIntArray();
                expect(res).assertDeepEquals(intArray);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_IntArray2 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_IntArray2 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_IntArray2 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_DoubleArray1
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_DoubleArray1
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_DoubleArray1
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_DoubleArray1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_DoubleArray1 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let doubleArray: Array<double> = [11.1, 22.2, 33.3, 44.4, 55.5, 66.6, 77.7, 88.8, 99.9, 10.0];
                data.writeDoubleArray(doubleArray);
                let res: Array<double> = data.readDoubleArray();
                expect(res).assertDeepEquals(doubleArray);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_DoubleArray1 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_DoubleArray1 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_DoubleArray1 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_DoubleArray2
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_DoubleArray2
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_DoubleArray2
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_DoubleArray2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_DoubleArray2 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let doubleArray: Array<double> = [121.1, 212.2, 323.3, 414.4, 525.5, 616.6, 77, 88, 99, 100];
                data.writeDoubleArray(doubleArray);
                let res: Array<double> = data.readDoubleArray();
                expect(res).assertDeepEquals(doubleArray);
                expect(10 == res.length).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_DoubleArray2 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_DoubleArray2 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_DoubleArray2 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_StringArray1
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_StringArray1
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_StringArray1
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_StringArray1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_StringArray1 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let stringArray: Array<string> = ["this ", "is ", "a ", "test ", "string ", "array", "1"];
                data.writeStringArray(stringArray);
                let res: Array<string> = data.readStringArray();
                expect(res).assertDeepEquals(stringArray);
                expect(7 == res.length).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_StringArray1 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_StringArray1 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_StringArray1 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_StringArray2
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_StringArray2
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_StringArray2
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_StringArray2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_StringArray2 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let stringArray: Array<string> = ["this ", "is ", "a ", "test ", "string ", "array", "2"];
                data.writeStringArray(stringArray);
                let array: Array<string> = new Array<string>(stringArray.length);
                data.readStringArray(array);
                expect(array).assertDeepEquals(stringArray);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_StringArray2 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_StringArray2 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_StringArray2 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_BooleanArray1
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_BooleanArray1
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_BooleanArray1
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_BooleanArray1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_BooleanArray1 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let boolArray: Array<boolean> = [true, false, true, false, true, false, true, false, true, false];
                data.writeBooleanArray(boolArray);
                let res: Array<boolean> = data.readBooleanArray();
                expect(res).assertDeepEquals(boolArray);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_BooleanArray1 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_BooleanArray1 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_BooleanArray1 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_BooleanArray2
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_BooleanArray2
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_BooleanArray2
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_BooleanArray2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_BooleanArray2 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let boolArray: Array<boolean> = [false, true, false, true, false, true, false, true, false, true];
                data.writeBooleanArray(boolArray);
                let array: Array<boolean> = new Array<boolean>(boolArray.length);
                data.readBooleanArray(array);
                expect(array).assertDeepEquals(boolArray);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_BooleanArray2 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_BooleanArray2 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_BooleanArray2 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_RawData_Int32
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_RawData_Int32
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_RawData_Int32
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_RawData_Int32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_RawData_Int32 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let buffer = new ArrayBuffer(4 * 10);
                let int32View = new Int32Array(buffer);
                for (let i = 0; i < int32View.length; i++) {
                    int32View[i] = i * 2 + 1;
                    if (i % 2 != 0) {
                        int32View[i] = -int32View[i];
                    }
                }
                let size: int = buffer.byteLength as int;
                expect(size == 40).assertTrue();
                data.writeRawDataBuffer(buffer, size);
                let result = data.readRawDataBuffer(size);
                expect(result).assertDeepEquals(buffer);
                let readInt32View = new Int32Array(result);
                let assertE = isEqualArrayBuffer(readInt32View, int32View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_RawData_Int32 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_RawData_Int32 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_RawData_Int32 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_RawData_Int8
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_RawData_Int8
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_RawData_Int8
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_RawData_Int8", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_RawData_Int32 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let buffer = new ArrayBuffer(1 * 10);
                let int8View = new Int8Array(buffer);
                for (let i = 0; i < int8View.length; i++) {
                    int8View[i] = i * 2 + 1;
                }
                let size: int = buffer.byteLength as int;
                expect(size == 10).assertTrue();
                data.writeRawDataBuffer(buffer, size);
                let result = data.readRawDataBuffer(size);
                expect(result).assertDeepEquals(buffer);
                let readInt8View = new Int8Array(result);
                let assertE = isEqualArrayBuffer(readInt8View, int8View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_RawData_Int8 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_RawData_Int8 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_RawData_Int8 --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_RawData_Float32
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_RawData_Float32
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_RawData_Float32
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_RawData_Float32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_RawData_Float32 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let buffer = new ArrayBuffer(4 * 10);
                let float32View = new Float32Array(buffer);
                for (let i = 0; i < float32View.length; i++) {
                    float32View[i] = i * 2 + 1;
                    if (i % 2 != 0) {
                        float32View[i] = -float32View[i];
                    }
                }
                hilog.info(domain, tag, 'Tonny2503004 AA0112          float32View ' + float32View);
                let size: int = buffer.byteLength as int;
                hilog.info(domain, tag, 'Tonny2503004 AA0112      size ' + size);
                expect(size == 40).assertTrue();
                data.writeRawDataBuffer(buffer, size);
                let result = data.readRawDataBuffer(size);
                hilog.info(domain, tag, 'Tonny2503004 AA0112      result ' + result);
                expect(result).assertDeepEquals(buffer);
                let readfloat32View = new Float32Array(result);
                hilog.info(domain, tag, 'Tonny2503004 AA0112      readfloat32View ' + readfloat32View);
                let assertE = isEqualArrayBuffer(readfloat32View, float32View);
                hilog.info(domain, tag, 'Tonny2503004 AA0112      assertE ' + assertE);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s','SUB_IPC_MessageSequence_WriteAndRead_RawData_Float32 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_RawData_Float32 done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_RawData_Float32 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_Ashmem
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_Ashmem
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_Ashmem
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_Ashmem", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_Ashmem --------------------');
            let data = rpc.MessageSequence.create();
            let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
            try {
                let size = ashmem.getAshmemSize();
                expect(size == 1024 * 1024).assertTrue();
                data.writeAshmem(ashmem);
                let res = data.readAshmem();
                expect(1024 * 1024 == res.getAshmemSize()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_Ashmem error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                ashmem.closeAshmem();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_Ashmem reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_Ashmem --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageOption
         * @tc.name      SUB_IPC_MessageOption
         * @tc.desc      test SUB_IPC_MessageOption
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageOption", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_MessageOption --------------------');
            try {
                let option1 = new rpc.MessageOption();
                let res1 = option1.isAsync();
                expect(res1 == false).assertTrue();

                let option2 = new rpc.MessageOption(true);
                let res2 = option2.isAsync();
                expect(res2 == true).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_MessageOption --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Ashmem
         * @tc.name      SUB_IPC_Ashmem
         * @tc.desc      test SUB_IPC_Ashmem
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Ashmem", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                let ashmem1 = rpc.Ashmem.create("ashmem", 1024 * 1024);
                let ashmem2 = rpc.Ashmem.create(ashmem1);
                let size1 = ashmem1.getAshmemSize();
                let size2 = ashmem2.getAshmemSize();
                expect(size1 == 1024 * 1024).assertTrue();
                expect(size1 == 1024 * 1024).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_Ashmem --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_FileDescriptor
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_FileDescriptor
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_FileDescriptor
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_FileDescriptor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_WriteAndRead_FileDescriptor --------------------');
            try {
                let data = rpc.MessageSequence.create();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s','SUB_IPC_MessageSequence_WriteAndRead_FileDescriptor error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_FileDescriptor done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_WriteAndRead_FileDescriptor --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_RemoteObject
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_RemoteObject
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_RemoteObject
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_RemoteObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_WriteAndRead_RemoteObject --------------------');
            let data = rpc.MessageSequence.create();
            try {
                console.log(`data gen`);
                let testRemtoeObject = new TestRemoteObject("testObject");
                console.log(`testRemoteObject gen`);
                data.writeRemoteObject(testRemtoeObject);
                console.log(`writeRemoteObject success`);
                let res = data.readRemoteObject();
                console.log(`readRemoteObject success, res is : `, res);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_RemoteObject error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteAndRead_RemoteObject done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_WriteAndRead_RemoteObject --------------------');
        });


        /**
         * @tc.number    SUB_IPC_getcallxxx_in_remoteObject
         * @tc.name      SUB_IPC_getcallxxx_in_remoteObject
         * @tc.desc      test SUB_IPC_getcallxxx_in_remoteObject
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_getcallxxx_in_remoteObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_getcallxxx_in_remoteObject --------------------');
            try {
                let testRemtoeObject = new TestRemoteObject("testObject");
                console.log(`get RemoteObject getDescriptor is `, testRemtoeObject.getDescriptor());
                console.log(`get RemoteObject getCallingPid is `, testRemtoeObject.getCallingPid());
                console.log(`get RemoteObject getCallingUid is `, testRemtoeObject.getCallingUid());
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_getcallxxx_in_remoteObject error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_getcallxxx_in_remoteObject reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_getcallxxx_in_remoteObject --------------------');
        });

        /**
         * @tc.number    SUB_IPC_RemoteObject_SendMessageRequest
         * @tc.name      SUB_IPC_RemoteObject_SendMessageRequest
         * @tc.desc      test SUB_IPC_RemoteObject_SendMessageRequest
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_RemoteObject_SendMessageRequest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_RemoteObject_SendMessageRequest --------------------');
            try {
                let testRemtoeObject = new TestRemoteObject("testObject");
                let data = rpc.MessageSequence.create();
                let reply = rpc.MessageSequence.create();
                data.writeInt(123);
                console.log(`writeInt success`);
                let option = new rpc.MessageOption();
                console.log(`MessageOption gen`);
                hilog.info(domain, tag, 'Tonny2503004 AA0815 testRemtoeObject ' + testRemtoeObject)
                await testRemtoeObject.sendMessageRequest(1, data, reply, option)
                    .then((ret: rpc.RequestResult) => {
                        hilog.info(domain, tag, '%{public}s', `sendMessageRequest success, errCode is : `, ret.errCode);
                        hilog.info(domain, tag, '%{public}s', `sendMessageRequest success, ret is : `, ret);
                    }).catch((err) => {
                        console.log(`err in catch: `, err);
                    }).finally(() => {
                        data.reclaim();
                        reply.reclaim();
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest_0100 reclaim done');
                    })
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_SendMessageRequest error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                done();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_SendMessageRequest  done');
            }
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_RemoteObject_SendMessageRequest --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeCharArray
         * @tc.name      SUB_IPC_MessageSequence_writeCharArray
         * @tc.desc      test writeCharArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeCharArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeCharArray --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let a: Array<int> = [97, 98];
                data.writeCharArray(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeCharArray --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadFloatArray_0100
         * @tc.name      SUB_IPC_MessageSequence_ReadFloatArray
         * @tc.desc      test SUB_IPC_MessageSequence_ReadFloatArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadFloatArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadFloatArray_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let b: Double = 2;
                let c: Double = 3;
                let a: Array<Double> = [b, c];
                data.writeFloatArray(a);
                let res = data.readFloatArray();
                expect(res).assertDeepEquals(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0100  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadFloatArray_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadFloatArray_0200
         * @tc.name      SUB_IPC_MessageSequence_ReadFloatArray
         * @tc.desc      test SUB_IPC_MessageSequence_ReadFloatArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadFloatArray_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadFloatArray_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let b: Double = 2;
                let c: Double = 3;
                let a: Array<Double> = [b, c];
                data.writeFloatArray(a);
                let res: Array<Double> = new Array<Double>(a.length);
                data.readFloatArray(res);
                expect(res).assertDeepEquals(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloatArray_0200  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadFloatArray_0200 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadLongArray_0100
         * @tc.name      SUB_IPC_MessageSequence_ReadLongArray
         * @tc.desc      test ReadLongArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadLongArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadLongArray_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeLongArray(input);
                let res: Array<long> = new Array<long>(input.length);
                res = data.readLongArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0100  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadLongArray_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadLongArray_0200
         * @tc.name      SUB_IPC_MessageSequence_ReadLongArray
         * @tc.desc      test ReadLongArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadLongArray_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadLongArray_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeLongArray(input);
                let res: Array<long> = new Array<long>(input.length);
                data.readLongArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadLongArray_0200  done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadLongArray_0200 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadShortArray_0100
         * @tc.name      SUB_IPC_MessageSequence_ReadShortArray
         * @tc.desc      test SUB_IPC_MessageSequence_ReadShortArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadShortArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadShortArray_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeShortArray(input);
                let res: Array<int> = new Array<int>(input.length);
                res = data.readShortArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShortArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadShortArray_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadShortArray_0200
         * @tc.name      SUB_IPC_MessageSequence_ReadShortArray
         * @tc.desc      test SUB_IPC_MessageSequence_ReadShortArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadShortArray_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadShortArray_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeShortArray(input);
                let res: Array<int> = new Array<int>(input.length);
                data.readShortArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShortArray_0200 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadShortArray_0200 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadChar
         * @tc.name      SUB_IPC_MessageSequence_ReadChar
         * @tc.desc      test SUB_IPC_MessageSequence_ReadChar
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadChar", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_ReadChar --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let res = data.readChar();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadChar error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_ReadChar --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadDouble
         * @tc.name      SUB_IPC_MessageSequence_ReadDouble
         * @tc.desc      test SUB_IPC_MessageSequence_ReadDouble
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadDouble", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_ReadDouble --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let res = data.readDouble();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadDouble error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_ReadDouble --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadFloat
         * @tc.name      SUB_IPC_MessageSequence_ReadFloat
         * @tc.desc      test SUB_IPC_MessageSequence_ReadFloat
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadFloat", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_ReadFloat --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let res = data.readFloat();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadFloat error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_ReadFloat --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadShort
         * @tc.name      SUB_IPC_MessageSequence_ReadShort
         * @tc.desc      test SUB_IPC_MessageSequence_ReadShort
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadShort", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_ReadShort --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let res = data.readShort();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadShort error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_ReadShort --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadByte
         * @tc.name      SUB_IPC_MessageSequence_ReadByte
         * @tc.desc      test SUB_IPC_MessageSequence_ReadByte
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadByte", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_ReadByte --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let res = data.readByte();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByte error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_ReadByte --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadByteArray_0100
         * @tc.name      SUB_IPC_MessageSequence_ReadByteArray
         * @tc.desc      test SUB_IPC_MessageSequence_ReadByteArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadByteArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadByteArray_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                hilog.info(domain, tag, 'Tonny2503004 AA0883      data ' + data);
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeByteArray(input);
                hilog.info(domain, tag, 'Tonny2503004 AA0856   ');
                let res = data.readByteArray();
                hilog.info(domain, tag, 'Tonny2503004 AA0858      res ' + res);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByteArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadByteArray_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadByteArray
         * @tc.name      SUB_IPC_MessageSequence_ReadByteArray
         * @tc.desc      test SUB_IPC_MessageSequence_ReadByteArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadByteArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_ReadByteArray --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeByteArray(input);
                let res = data.readByteArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadByteArray error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_ReadByteArray --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_RewindWriteAndRead
         * @tc.name      SUB_IPC_MessageSequence_RewindWriteAndRead
         * @tc.desc      test SUB_IPC_MessageSequence_RewindWriteAndRead
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_RewindWriteAndRead", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_RewindWriteAndRead --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                let data = rpc.MessageSequence.create();
                data.rewindRead(0);
                data.rewindWrite(0);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_RewindWriteAndRead error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_RewindWriteAndRead --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_SetSize
         * @tc.name      SUB_IPC_MessageSequence_SetSize
         * @tc.desc      test SUB_IPC_MessageSequence_SetSize
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_SetSize", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_SetSize --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.setSize(100000);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_SetSize error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_SetSize --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_dupFileDescriptor
         * @tc.name      SUB_IPC_MessageSequence_dupFileDescriptor
         * @tc.desc      test SUB_IPC_MessageSequence_dupFileDescriptor
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_dupFileDescriptor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_MessageSequence_dupFileDescriptor --------------------');

            try {
                let res = rpc.MessageSequence.dupFileDescriptor(1);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_dupFileDescriptor --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadRemoteObjectArray
         * @tc.name      SUB_IPC_MessageSequence_ReadRemoteObjectArray
         * @tc.desc      test SUB_IPC_MessageSequence_ReadRemoteObjectArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadRemoteObjectArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadRemoteObjectArray --------------------');
            let data = rpc.MessageSequence.create();
            try {
                hilog.info(domain, tag, 'Tonny2503004 AA0977      data ' + data);
                let testRemtoeObject = new TestRemoteObject("testObject");
                let testRemtoeObject1 = new TestRemoteObject("testObject1");
                let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
                data.writeRemoteObjectArray(a);
                let res = data.readRemoteObjectArray();
                hilog.info(domain, tag, 'Tonny2503004 AA0979      res ' + res);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_UnMapAshmem done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_MessageSequence_ReadRemoteObjectArray --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100
         * @tc.name      SUB_IPC_MessageSequence_ReadRemoteObjectArray
         * @tc.desc      test ReadRemoteObjectArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let testRemtoeObject = new TestRemoteObject("testObject");
                let testRemtoeObject1 = new TestRemoteObject("testObject1");
                let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
                data.writeRemoteObjectArray(a);
                let res: Array<rpc.IRemoteObject> = new Array<rpc.IRemoteObject>(a.length);
                data.readRemoteObjectArray(res);
                for (let index = 0; index < res.length; index++) {
                    expect(res[index] != null).assertTrue();
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200
         * @tc.name      SUB_IPC_MessageSequence_ReadRemoteObjectArray
         * @tc.desc      test ReadRemoteObjectArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let testRemtoeObject = new TestRemoteObject("testObject");
                let testRemtoeObject1 = new TestRemoteObject("testObject1");
                let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
                data.writeRemoteObjectArray(a);
                let res: Array<rpc.IRemoteObject> = new Array<rpc.IRemoteObject>(a.length);
                res = data.readRemoteObjectArray();
                for (let index = 0; index < res.length; index++) {
                    expect(res[index] != null).assertTrue();
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200 error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ReadRemoteObjectArray_0200 done');
                data.reclaim();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ReadRemoteObjectArray_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Ashmen_CloseAshmem
         * @tc.name      SUB_IPC_Ashmen_CloseAshmem
         * @tc.desc      test Ashmen_CloseAshmem
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Ashmen_CloseAshmem", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmen_CloseAshmem --------------------');
            let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
            try {
                ashmem.closeAshmem();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_CloseAshmem error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                ashmem.closeAshmem();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_CloseAshmem done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmen_CloseAshmem --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Ashmen_UnMapAshmem
         * @tc.name      SUB_IPC_Ashmen_UnMapAshmem
         * @tc.desc      test SUB_IPC_Ashmen_UnMapAshmem
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Ashmen_UnMapAshmem", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmen_UnMapAshmem --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                ashmem.mapTypedAshmem(3);
                ashmem.unmapAshmem();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_UnMapAshmem error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_UnMapAshmem done');
                ashmem.closeAshmem();
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmen_UnMapAshmem --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageOption_GetFlagsAndSetFlags
         * @tc.name      SUB_IPC_MessageOption_GetFlagsAndSetFlags
         * @tc.desc      test SUB_IPC_MessageOption_GetFlagsAndSetFlags
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageOption_GetFlagsAndSetFlags", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageOption_GetFlagsAndSetFlags --------------------');
            try {
                let option = new rpc.MessageOption();
                let res = option.getFlags();
                option.setFlags(res);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_GetFlagsAndSetFlags error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageOption_GetFlagsAndSetFlags --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime
         * @tc.name      SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime
         * @tc.desc      test SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime --------------------');
            try {
                let option = new rpc.MessageOption();
                let res = option.getWaitTime();
                option.setWaitTime(res);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageOption_GetWaitTimeAndSetWaitTime --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_GetSize
         * @tc.name      SUB_IPC_MessageSequence_GetSize
         * @tc.desc      test SUB_IPC_MessageSequence_GetSize
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_GetSize", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetSize --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let size: int = 123;
                data.setSize(size);
                let res: long = data.getSize();
                hilog.info(domain, tag, 'Tonny2503004 AA1094      res ' + res)
                expect(res == 0).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetSize error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetSize --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_GetWritableBytes
         * @tc.name      SUB_IPC_MessageSequence_GetWritableBytes
         * @tc.desc      test SUB_IPC_MessageSequence_GetWritableBytes
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_GetWritableBytes", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetWritableBytes --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let size: long = data.getWritableBytes();
                hilog.info(domain, tag, 'Tonny2503004 AA0119      size ' + size)
                expect(size == 0).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritableBytes error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetWritableBytes --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_GetReadableBytes
         * @tc.name      SUB_IPC_MessageSequence_GetReadableBytes
         * @tc.desc      test SUB_IPC_MessageSequence_GetReadableBytes
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_GetReadableBytes", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetReadableBytes --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let size: long = data.getReadableBytes();
                hilog.info(domain, tag, 'Tonny2503004 AA1143      size ' + size)
                expect(size == 0).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadableBytes error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetReadableBytes --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_GetReadPosition
         * @tc.name      SUB_IPC_MessageSequence_GetReadPosition
         * @tc.desc      test SUB_IPC_MessageSequence_GetReadPosition
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_GetReadPosition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetReadPosition --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let size: long = data.getReadPosition();
                hilog.info(domain, tag, 'Tonny2503004 AA1167      size ' + size)
                expect(size == 0).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetReadPosition error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetReadPosition --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_GetWritePosition
         * @tc.name      SUB_IPC_MessageSequence_GetWritePosition
         * @tc.desc      test SUB_IPC_MessageSequence_GetWritePosition
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_GetWritePosition", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetWritePosition --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let size: long = data.getWritePosition();
                hilog.info(domain, tag, 'Tonny2503004 AA1193      size ' + size)
                expect(size == 0).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetWritePosition error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetWritePosition --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_ContainFileDescriptors
         * @tc.name      SUB_IPC_MessageSequence_ContainFileDescriptors
         * @tc.desc      test SUB_IPC_MessageSequence_ContainFileDescriptors
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_ContainFileDescriptors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_ContainFileDescriptors --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                let data = rpc.MessageSequence.create();
                let ret: boolean = data.containFileDescriptors();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ContainFileDescriptors error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_ContainFileDescriptors reclaim done');
                ashmem.closeAshmem();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_ContainFileDescriptors --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_GetRawDataCapacity
         * @tc.name      SUB_IPC_MessageSequence_GetRawDataCapacity
         * @tc.desc      test SUB_IPC_MessageSequence_GetRawDataCapacity
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_GetRawDataCapacity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_GetRawDataCapacity --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let size: long = data.getRawDataCapacity();
                expect(size > 0).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_GetRawDataCapacity error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_GetRawDataCapacity --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteByte
         * @tc.name      SUB_IPC_MessageSequence_WriteByte
         * @tc.desc      test SUB_IPC_MessageSequence_WriteByte
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteByte", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteByte --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.writeByte(97);
                let res = data.readByte();
                expect(res == 97).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteByte error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteByte --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteShort
         * @tc.name      SUB_IPC_MessageSequence_WriteShort
         * @tc.desc      test SUB_IPC_MessageSequence_WriteShort
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteShort", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteShort --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                let data = rpc.MessageSequence.create();
                data.writeShort(123);
                let res = data.readShort();
                expect(res == 123).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteShort error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteShort --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteFloat
         * @tc.name      SUB_IPC_MessageSequence_WriteFloat
         * @tc.desc      test SUB_IPC_MessageSequence_WriteFloat
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteFloat", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteFloat --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.writeFloat(123456);
                let res = data.readFloat();
                expect(res == 123456).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteFloat error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteFloat --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(1 * 10);
                let int8View = new Int8Array(buffer);
                for (let i = 0; i < int8View.length; i++) {
                    int8View[i] = i * 2 + 1;
                    if (i % 2 != 0) {
                        int8View[i] = -int8View[i];
                    }
                }

                data.writeArrayBuffer(buffer, rpc.TypeCode.INT8_ARRAY);
                console.println(`writeArrayBuffer success`);
                console.println(`write ArrayBuffer is :` + int8View);

                let result = data.readArrayBuffer(rpc.TypeCode.INT8_ARRAY);
                let readInt8View = new Int8Array(result);
                console.println(`ArrayBuffer success`);
                console.println(`read data is :` + readInt8View);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s',
                    'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int8 --------------------');
        });


        /**
         * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_UInt8
         * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_UInt8
         * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_UInt8
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_WriteAndRead_ArrayBuffer_UInt8", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_UInt8 --------------------');

            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(1 * 10);
                let uint8View = new Uint8Array(buffer);
                for (let i = 0; i < uint8View.length; i++) {
                    uint8View[i] = i * 2 + 1;
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.UINT8_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write ArrayBuffer is :` + uint8View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.UINT8_ARRAY);
                    let readUInt8View = new Uint8Array(result);
                    console.println(`ArrayBuffer success`);
                    console.println(`read data is :` + readUInt8View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt8 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_UInt8 --------------------');
        });


        /**
         * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_Int16
         * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_Int16
         * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_Int16
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_WriteAndRead_ArrayBuffer_Int16", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_Int16 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(2 * 10);
                let int16View = new Int16Array(buffer);
                for (let i = 0; i < int16View.length; i++) {
                    int16View[i] = i * 2 + 1;
                    if (i % 2 != 0) {
                        int16View[i] = -int16View[i];
                    }
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.INT16_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write ArrayBuffer is :` + int16View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.INT16_ARRAY);
                    let readInt16View = new Int16Array(result);
                    console.println(`ArrayBuffer success`);
                    console.println(`read data is :` + readInt16View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Int16 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_Int16 --------------------');
        });


        /**
         * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_UInt16
         * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_UInt16
         * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_UInt16
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_WriteAndRead_ArrayBuffer_UInt16", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_UInt16 --------------------');

            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(2 * 10);
                let uint16View = new Uint16Array(buffer);
                for (let i = 0; i < uint16View.length; i++) {
                    uint16View[i] = i * 2 + 1;
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.UINT16_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write ArrayBuffer is :` + uint16View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.UINT16_ARRAY);
                    let readUInt16View = new Uint16Array(result);
                    console.println(`ArrayBuffer success`);
                    console.println(`read data is :` + readUInt16View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt16 error is: ' + error);
                expect(error == null).assertTrue();

            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_UInt16 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_UInt32
         * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_UInt32
         * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_UInt32
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_WriteAndRead_ArrayBuffer_UInt32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_UInt32 --------------------');

            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(4 * 10);
                let uint32View = new Uint32Array(buffer);
                for (let i = 0; i < uint32View.length; i++) {
                    uint32View[i] = i * 2 + 1;
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.UINT32_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write ArrayBuffer is :` + uint32View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.UINT32_ARRAY);
                    let readUInt32View = new Uint32Array(result);
                    console.println(`ArrayBuffer success`);
                    console.println(`read data is :` + readUInt32View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_UInt32 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_UInt32 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_Int32
         * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_Int32
         * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_Int32
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_WriteAndRead_ArrayBuffer_Int32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_Int32 --------------------');

            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(4 * 10);
                let int32View = new Int32Array(buffer);
                for (let i = 0; i < int32View.length; i++) {
                    int32View[i] = i * 2 + 1;
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.INT32_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write ArrayBuffer is :` + int32View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.INT32_ARRAY);
                    let readInt32View = new Int32Array(result);
                    console.println(`ArrayBuffer success`);
                    console.println(`read data is :` + readInt32View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Int32 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_Int32 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_WriteAndRead_ArrayBuffer_Float32
         * @tc.name      SUB_IPC_WriteAndRead_ArrayBuffer_Float32
         * @tc.desc      test SUB_IPC_WriteAndRead_ArrayBuffer_Float32
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_WriteAndRead_ArrayBuffer_Float32", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_WriteAndRead_ArrayBuffer_Float32 --------------------');

            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(4 * 10);
                let float32View = new Float32Array(buffer);
                for (let i = 0; i < float32View.length; i++) {
                    float32View[i] = i * 2 + i * 1.0 / 10;
                    if (i % 2 != 0) {
                        float32View[i] = -float32View[i];
                    }
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.FLOAT32_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write data is :` + float32View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.FLOAT32_ARRAY);
                    let readFloat32View = new Float32Array(result);
                    console.println(`readFloat32View success`);
                    console.println(`ArrayBuffer is :` + readFloat32View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_WriteAndRead_ArrayBuffer_Float32 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_WriteAndRead_ArrayBuffer_Float32 --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64 --------------------');

            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(8 * 10);
                let float64View = new Float64Array(buffer);
                for (let i = 0; i < float64View.length; i++) {
                    float64View[i] = i * 2 + i * 1.0 / 10;
                    if (i % 2 != 0) {
                        float64View[i] = -float64View[i];
                    }
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.FLOAT64_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write data is :` + float64View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.FLOAT64_ARRAY);
                    let readFloat64View = new Float64Array(result);
                    console.println(`readArrayBuffer success`);
                    console.println(`ArrayBuffer is :` + readFloat64View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s',
                    'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Float64 --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(8 * 10);
                let bInt64View = new BigInt64Array(buffer);
                for (let i = 0; i < bInt64View.length; i++) {
                    bInt64View[i] = i * 2 + 1;
                    if (i % 2 != 0) {
                        bInt64View[i] = -bInt64View[i];
                    }
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.BIGINT64_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write data is :` + bInt64View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.BIGINT64_ARRAY);
                    let readInt64View = new BigInt64Array(result);
                    console.println(`readArrayBuffer success`);
                    console.println(`read data is :` + readInt64View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

            } catch (error) {
                hilog.info(domain, tag, '%{public}s',
                    'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64 error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_Int64 --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64
         * @tc.name      SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64
         * @tc.desc      test SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64 --------------------');

            try {
                let data = rpc.MessageSequence.create();
                console.println(`data gen`);
                let buffer = new ArrayBuffer(8 * 10);
                let bUInt64View = new BigInt64Array(buffer);
                for (let i = 0; i < bUInt64View.length; i++) {
                    bUInt64View[i] = i * 2 + 1;
                }

                try {
                    data.writeArrayBuffer(buffer, rpc.TypeCode.BIGUINT64_ARRAY);
                    console.println(`writeArrayBuffer success`);
                    console.println(`write data is :` + bUInt64View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }

                try {
                    let result = data.readArrayBuffer(rpc.TypeCode.BIGUINT64_ARRAY);
                    let readUInt64View = new BigInt64Array(result);
                    console.println(`readArrayBuffer success`);
                    console.println(`read data is :` + readUInt64View);
                } catch (err) {
                    let error: BusinessError = err as BusinessError;
                    console.println(`catch error, code is ${error.code}, msg is ${error.message}`);
                }
            } catch (error) {
                hilog.info(domain, tag, '%{public}s',
                    'SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64 error is: ' + error);
                expect(error == null).assertTrue();

            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteAndRead_ArrayBuffer_UInt64 --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_writeRemoteObjectArray
         * @tc.name      SUB_IPC_MessageSequence_writeRemoteObjectArray
         * @tc.desc      test SUB_IPC_MessageSequence_writeRemoteObjectArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRemoteObjectArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeRemoteObjectArray --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                let data = rpc.MessageSequence.create();
                let testRemtoeObject = new TestRemoteObject("testObject");
                let testRemtoeObject1 = new TestRemoteObject("testObject1");
                let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
                data.writeRemoteObjectArray(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_ error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_MessageSequence_writeRemoteObjectArray reclaim done');
                ashmem.closeAshmem();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeRemoteObjectArray --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_readCharArray
         * @tc.name      SUB_IPC_MessageSequence_readCharArray
         * @tc.desc      test readCharArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_readCharArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readCharArray --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let a: Array<int> = [97, 98];
                data.writeCharArray(a);
                let res = data.readCharArray();
                expect(res).assertDeepEquals(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readCharArray --------------------');
        });


        /**
         * @tc.number    SUB_IPC_MessageSequence_writeLongArray
         * @tc.name      SUB_IPC_MessageSequence_writeLongArray
         * @tc.desc      test SUB_IPC_MessageSequence_writeLongArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeLongArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeLongArray --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let b: long = 2;
                let c: long = 3;
                let a: Array<long> = [b, c];
                data.writeLongArray(a);
                let res = data.readLongArray();
                expect(res).assertDeepEquals(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_MessageSequence_writeLongArray error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeLongArray --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeShortArray
         * @tc.name      SUB_IPC_MessageSequence_writeShortArray
         * @tc.desc      test SUB_IPC_MessageSequence_writeShortArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeShortArray", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeShortArray --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let a: Array<int> = [100, 101];
                data.writeShortArray(a);
                let res = data.readShortArray();
                expect(res).assertDeepEquals(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_MessageSequence_writeShortArray error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeShortArray --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeChar
         * @tc.name      SUB_IPC_MessageSequence_writeChar
         * @tc.desc      test SUB_IPC_MessageSequence_writeChar
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeChar", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeChar --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let a: byte = 97;
                data.writeChar(a);
                let res = data.readChar();
                expect(a == res).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeChar error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeChar --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeDouble
         * @tc.name      SUB_IPC_MessageSequence_writeDouble
         * @tc.desc      test SUB_IPC_MessageSequence_writeDouble
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeDouble", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeDouble --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let a: double = 9.7;
                data.writeDouble(a);
                let res = data.readDouble();
                expect(a == res).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDouble error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeDouble --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Skeleton_resetCallingIdentity
         * @tc.name      SUB_IPC_Skeleton_resetCallingIdentity
         * @tc.desc      test SUB_IPC_Skeleton_resetCallingIdentity
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Skeleton_resetCallingIdentity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_resetCallingIdentity --------------------');
            try {
                let identity = rpc.IPCSkeleton.resetCallingIdentity();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_resetCallingIdentity error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_resetCallingIdentity reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_resetCallingIdentity --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Skeleton_restoreCallingIdentity
         * @tc.name      SUB_IPC_Skeleton_restoreCallingIdentity
         * @tc.desc      test SUB_IPC_Skeleton_restoreCallingIdentity
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Skeleton_restoreCallingIdentity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_restoreCallingIdentity --------------------');
            try {
                let identity = rpc.IPCSkeleton.resetCallingIdentity();
                rpc.IPCSkeleton.restoreCallingIdentity(identity);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_restoreCallingIdentity --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Skeleton_getCallingDeviceID
         * @tc.name      SUB_IPC_Skeleton_getCallingDeviceID
         * @tc.desc      test SUB_IPC_Skeleton_getCallingDeviceID
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Skeleton_getCallingDeviceID", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_getCallingDeviceID --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                let deviceID = rpc.IPCSkeleton.getCallingDeviceID();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_getCallingDeviceID error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_getCallingDeviceID --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Skeleton_getLocalDeviceID
         * @tc.name      SUB_IPC_Skeleton_getLocalDeviceID
         * @tc.desc      test SUB_IPC_Skeleton_getLocalDeviceID
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Skeleton_getLocalDeviceID", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_getLocalDeviceID --------------------');
            try {
                let deviceID = rpc.IPCSkeleton.getLocalDeviceID();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_getLocalDeviceID error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_getLocalDeviceID --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Skeleton_isLocalCallin
         * @tc.name      SUB_IPC_Skeleton_isLocalCallin
         * @tc.desc      test SUB_IPC_Skeleton_isLocalCallin
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Skeleton_isLocalCallin", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_isLocalCallin --------------------');
            try {
                let ret = rpc.IPCSkeleton.isLocalCalling();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_isLocalCallin error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_isLocalCallin --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Skeleton_flushCmdBuffer
         * @tc.name      SUB_IPC_Skeleton_flushCmdBuffer
         * @tc.desc      test SUB_IPC_Skeleton_flushCmdBuffer
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Skeleton_flushCmdBuffer", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_flushCmdBuffer --------------------');
            let a: rpc.IRemoteObject = new TestRemoteObject("testObject");
            try {
                rpc.IPCSkeleton.flushCmdBuffer(a);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_flushCmdBuffer error is: ' + error);
                expect(error == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_flushCmdBuffer --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Ashmen_MapReadOnlyAshmem
         * @tc.name      SUB_IPC_Ashmen_MapReadOnlyAshmem
         * @tc.desc      test SUB_IPC_Ashmen_MapReadOnlyAshmem
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Ashmen_MapReadOnlyAshmem", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_MapReadOnlyAshmem --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                ashmem.mapTypedAshmem(7);
                ashmem.mapReadonlyAshmem();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MapReadOnlyAshmem error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MapReadOnlyAshmem reclaim done');
                ashmem.closeAshmem();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_MapReadOnlyAshmem --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Ashmen_MapTypedAshmem
         * @tc.name      SUB_IPC_Ashmen_MapTypedAshmem
         * @tc.desc      test SUB_IPC_Ashmen_MapTypedAshmem
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Ashmen_MapTypedAshmem", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_MapTypedAshmem --------------------');
            let ashmem = rpc.Ashmem.create("ashmem1", 1024 * 1024);
            try {
                ashmem.mapTypedAshmem(1);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapTypedAshmem error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_MapTypedAshmem reclaim done');
                ashmem.closeAshmem();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_MapTypedAshmem --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Ashmen_SetProtectionType
         * @tc.name      SUB_IPC_Ashmen_SetProtectionType
         * @tc.desc      test SUB_IPC_Ashmen_SetProtectionType
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Ashmen_SetProtectionType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Ashmen_SetProtectionType --------------------');
            let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
            try {
                ashmem.mapReadWriteAshmem();
                ashmem.setProtectionType(3);
                hilog.info(domain, tag, '%{public}s', `SetProtectionType finshed`);
                let buffer = new ArrayBuffer(1 * 10);
                let int8View = new Int8Array(buffer);
                for (let i = 0; i < int8View.length; i++) {
                    int8View[i] = i * 2 + 1;
                    if (i % 2 != 0) {
                        int8View[i] = -int8View[i];
                    }
                }
                hilog.info(domain, tag, '%{public}s', `write data is ${int8View}`);
                console.println(`write data is ${int8View}`);
                let length: int = 10;
                let offset: int = 0;
                ashmem.writeDataToAshmem(buffer, length, offset);
                hilog.info(domain, tag, '%{public}s', `WriteDataToAshMem finshed`);
                let result = ashmem.readDataFromAshmem(length, offset);
                let readInt8View = new Int8Array(result);
                hilog.info(domain, tag, '%{public}s', `readDataFromAshmem success`);
                hilog.info(domain, tag, '%{public}s', `read data is ${readInt8View}`);
                expect(int8View).assertDeepEquals(readInt8View);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmen_SetProtectionType reclaim done');
                ashmem.closeAshmem();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Ashmen_SetProtectionType --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_setSize_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_setSize_ErrorCode
         * @tc.desc      test setSize ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_setSize_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_setSize_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.setSize(0);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setSize_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setSize_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_setSize_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_rewindRead_ErrorCode
         * @tc.desc      test rewindRead ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.rewindRead(0);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_rewindRead_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_rewindWrite_ErrorCode
         * @tc.desc      test rewindWrite ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.rewindWrite(0);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_rewindWrite_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeByte_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_writeByte_ErrorCode
         * @tc.desc      test writeByte ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeByte_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeByte_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeByte(1);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByte_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByte_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeByte_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_readByte_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_readByte_ErrorCode
         * @tc.desc      test readByte ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_readByte_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readByte_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.readByte();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByte_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByte_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readByte_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeShort_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_writeShort_ErrorCode
         * @tc.desc      test writeShort ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeShort_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeShort_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeShort(1);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShort_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShort_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeShort_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_readShort_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_readShort_ErrorCode
         * @tc.desc      test readShort ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_readShort_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readShort_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.readShort();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShort_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShort_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readShort_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_writeFloat_ErrorCode
         * @tc.desc      test writeFloat ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeFloat(1.1);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeFloat_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_readFloat_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_readFloat_ErrorCode
         * @tc.desc      test readFloat ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_readFloat_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readFloat_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.readFloat();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloat_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloat_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readFloat_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_writeDouble_ErrorCode
         * @tc.desc      test writeDouble ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeDouble(1.12);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeDouble_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_readDouble_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_readDouble_ErrorCode
         * @tc.desc      test readDouble ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_readDouble_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readDouble_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.readDouble();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDouble_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readDouble_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readDouble_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeChar_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_writeChar_ErrorCode
         * @tc.desc      test writeChar ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeChar_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeChar_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.writeChar(1);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeChar_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeChar_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeChar_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_readChar_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_readChar_ErrorCode
         * @tc.desc      test readChar ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_readChar_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readChar_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                data.reclaim();
                data.readChar();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readChar_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readChar_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readChar_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readByteArray_ErrorCode
         * @tc.desc     test readByteArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeByteArray(input);
                data.reclaim();
                let res = data.readByteArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readByteArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeShortArray_ErrorCode
         * @tc.desc     test writeShortArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.reclaim();
                data.writeShortArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeShortArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readShortArray_ErrorCode
         * @tc.desc     test readShortArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeShortArray(input);
                let res: Array<int> = new Array<int>(input.length);
                data.reclaim();
                data.readShortArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readShortArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readShortArray_ErrorCode
         * @tc.desc     test readShortArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeShortArray(input);
                data.reclaim();
                let res = data.readShortArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readShortArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeLongArray_ErrorCode
         * @tc.desc     test writeLongArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.reclaim();
                data.writeLongArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeLongArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readLongArray_ErrorCode
         * @tc.desc     test readLongArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeLongArray(input);
                let res: Array<long> = new Array<long>(input.length);
                data.reclaim();
                data.readLongArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readLongArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readLongArray_ErrorCode
         * @tc.desc     test readLongArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<long> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeLongArray(input);
                let res: Array<long> = [];
                res = data.readLongArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readLongArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeFloatArray_ErrorCode
         * @tc.desc     test writeFloatArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<Double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
                data.reclaim();
                data.writeFloatArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeFloatArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readFloatArray_ErrorCode
         * @tc.desc     test readFloatArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<Double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
                data.writeFloatArray(input);
                let res: Array<Double> = new Array<Double>(input.length);
                data.reclaim();
                data.readFloatArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readFloatArray_ErrorCode
         * @tc.desc     test readFloatArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<Double> = [1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
                data.writeFloatArray(input);
                data.reclaim();
                let res = data.readFloatArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readFloatArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_writeCharArray_ErrorCode
         * @tc.desc     test writeCharArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5];
                data.reclaim();
                data.writeCharArray(input);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeCharArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readCharArray_ErrorCode
         * @tc.desc     test readCharArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5];
                data.writeCharArray(input);
                let res: Array<int> = new Array<int>(input.length);
                data.reclaim();
                data.readCharArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readCharArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readCharArray_ErrorCode
         * @tc.desc     test readCharArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5];
                data.writeCharArray(input);
                data.reclaim();
                let res = data.readCharArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readCharArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_writeRemoteObjectArray
         * @tc.desc      test writeRemoteObjectArray
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let testRemtoeObject = new TestRemoteObject("testObject");
                let testRemtoeObject1 = new TestRemoteObject("testObject1");
                let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
                data.reclaim();
                data.writeRemoteObjectArray(a);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_writeRemoteObjectArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100
         * @tc.name     SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode
         * @tc.desc     test readRemoteObjectArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let testRemtoeObject = new TestRemoteObject("testObject");
                let testRemtoeObject1 = new TestRemoteObject("testObject1");
                let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
                data.writeRemoteObjectArray(a);
                let res: Array<rpc.IRemoteObject> =new Array<rpc.IRemoteObject>(a.length);
                data.reclaim();
                data.readRemoteObjectArray(res);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number   SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200
         * @tc.name     SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode
         * @tc.desc     test readRemoteObjectArray errCode
         * @tc.level    LEVEL1
         * @tc.size     MEDIUMTEST
         * @tc.type     FUNCTION
         */
        it("SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 --------------------');
            let data = rpc.MessageSequence.create();
            try {
                let testRemtoeObject = new TestRemoteObject("testObject");
                let testRemtoeObject1 = new TestRemoteObject("testObject1");
                let a: Array<rpc.IRemoteObject> = [testRemtoeObject, testRemtoeObject1];
                data.writeRemoteObjectArray(a);
                data.reclaim();
                let res = data.readRemoteObjectArray();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_readRemoteObjectArray_ErrorCode_0200 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode
         * @tc.desc      test dupFileDescriptor ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 --------------------');

            try {
                let res = rpc.MessageSequence.dupFileDescriptor(-1);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 401).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_dupFileDescriptor_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode
         * @tc.desc      test WriteArrayBuffer ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let buffer = new ArrayBuffer(8 * 10);
                let bUInt64View = new BigInt64Array(buffer);
                for (let i = 0; i < bUInt64View.length; i++) {
                    bUInt64View[i] = i * 2 + 1;
                }
                data.reclaim();
                data.writeArrayBuffer(buffer, rpc.TypeCode.BIGUINT64_ARRAY);

            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900009).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_WriteArrayBuffer_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100
         * @tc.name      SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode
         * @tc.desc      test readArrayBuffer ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 --------------------');
            try {
                let data = rpc.MessageSequence.create();
                let buffer = new ArrayBuffer(8 * 10);
                let bUInt64View = new BigInt64Array(buffer);
                for (let i = 0; i < bUInt64View.length; i++) {
                    bUInt64View[i] = i * 2 + 1;
                }
                data.writeArrayBuffer(buffer, rpc.TypeCode.BIGUINT64_ARRAY);
                data.reclaim();
                let result = data.readArrayBuffer(rpc.TypeCode.BIGUINT64_ARRAY);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 1900010).assertTrue();
                expect(err.message != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 reclaim done');
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_MessageSequence_readArrayBuffer_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100
         * @tc.name      SUB_IPC_Skeleton_restoreCallingIdentityErrorCode
         * @tc.desc      test restoreCallingIdentity
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 --------------------');
            try {
                let des ='';
                const targetLength = 40961;
                for (let i = 0; i < targetLength; i++) {
                    des += 'a';
                }
                rpc.IPCSkeleton.restoreCallingIdentity(des);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 error is: ' + err);
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 error code is: ' + err.code);
                expect(err.code == 401).assertTrue();
                expect(err.message != null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 --------------------');
        });

        /**
         * @tc.number    SUB_IPC_ErrorCode_0100
         * @tc.name      SUB_IPC_ErrorCode
         * @tc.desc      test ErrorCode
         * @tc.level     LEVEL1
         * @tc.size      MEDIUMTEST
         * @tc.type      FUNCTION
         */
        it("SUB_IPC_ErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async (done: () => void): Promise<void> => {
            await Utils.msSleep(500);
            hilog.info(domain, tag, '%{public}s','-------------------- start SUB_IPC_ErrorCode_0100 --------------------');
            try {
                let errCode401 = `${rpc.ErrorCode.CHECK_PARAM_ERROR}`;
                expect(errCode401).assertEqual("401");
                let errCode1900001 = `${rpc.ErrorCode.OS_MMAP_ERROR}`;
                expect(errCode1900001).assertEqual("1900001");
                let errCode1900002 = `${rpc.ErrorCode.OS_IOCTL_ERROR}`;
                expect(errCode1900002).assertEqual("1900002");
                let errCode1900003 = `${rpc.ErrorCode.WRITE_TO_ASHMEM_ERROR}`;
                expect(errCode1900003).assertEqual("1900003");
                let errCode1900004 = `${rpc.ErrorCode.READ_FROM_ASHMEM_ERROR}`;
                expect(errCode1900004).assertEqual("1900004");
                let errCode1900005 = `${rpc.ErrorCode.ONLY_PROXY_OBJECT_PERMITTED_ERROR}`;
                expect(errCode1900005).assertEqual("1900005");
                let errCode1900006 = `${rpc.ErrorCode.ONLY_REMOTE_OBJECT_PERMITTED_ERROR}`;
                expect(errCode1900006).assertEqual("1900006");
                let errCode1900007 = `${rpc.ErrorCode.COMMUNICATION_ERROR}`;
                expect(errCode1900007).assertEqual("1900007");
                let errCode1900008 = `${rpc.ErrorCode.PROXY_OR_REMOTE_OBJECT_INVALID_ERROR}`;
                expect(errCode1900008).assertEqual("1900008");
                let errCode1900009 = `${rpc.ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR}`;
                expect(errCode1900009).assertEqual("1900009");
                let errCode1900010 = `${rpc.ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR}`;
                expect(errCode1900010).assertEqual("1900010");
                let errCode1900011 = `${rpc.ErrorCode.PARCEL_MEMORY_ALLOC_ERROR}`;
                expect(errCode1900011).assertEqual("1900011");
                let errCode1900012 = `${rpc.ErrorCode.CALL_JS_METHOD_ERROR}`;
                expect(errCode1900012).assertEqual("1900012");
                let errCode1900013 = `${rpc.ErrorCode.OS_DUP_ERROR}`;
                expect(errCode1900013).assertEqual("1900013");
            } catch (err: BusinessError) {
                expect(err.message == null).assertTrue();
            }
            done();
            hilog.info(domain, tag, '%{public}s','-------------------- end SUB_IPC_Skeleton_restoreCallingIdentity_ErrorCode_0100 --------------------');
        });

    })
}