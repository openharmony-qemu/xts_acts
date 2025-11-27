import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import rpc from '@ohos.rpc';
import common from '@ohos.app.ability.common';
import fileIo from '@ohos.file.fs';
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
    onRemoteDied(): void {
        hilog.info(domain, tag, '%{public}s', 'into onRemoteDied');
    }
}

class TestOption extends rpc.MessageOption{
    constructor(syncFlags: int, waitTime: int) {
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
         * @tc.name   SUB_IPC_MessageSequence_WriteInt_ReadInt_0100
         * @tc.number SUB_IPC_MessageSequence_WriteInt_ReadInt_0100
         * @tc.desc   test MessageSequence WriteInt and ReadInt
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100
         * @tc.number SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken_0100
         * @tc.desc   test MessageSequence WriteInterfaceToken and ReadInterfaceToken
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_setCapacity_getCapacity_0100
         * @tc.number SUB_IPC_MessageSequence_setCapacity_getCapacity_0100
         * @tc.desc   test MessageSequence setCapacity and getCapacity
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeNoException_readException_0100
         * @tc.number SUB_IPC_MessageSequence_writeNoException_readException_0100
         * @tc.desc   test MessageSequence writeNoException and readException
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeLong_readLong_0100
         * @tc.number SUB_IPC_MessageSequence_writeLong_readLong_0100
         * @tc.desc   test MessageSequence writeLong and readLong
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100
         * @tc.number SUB_IPC_MessageSequence_writeBoolean_readBoolean_0100
         * @tc.desc   test MessageSequence writeBoolean and readBoolean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200
         * @tc.number SUB_IPC_MessageSequence_writeBoolean_readBoolean_0200
         * @tc.desc   test MessageSequence writeBoolean and readBoolean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeString_readString_0100
         * @tc.number SUB_IPC_MessageSequence_writeString_readString_0100
         * @tc.desc   test MessageSequence writeString and readString
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeByteArray_0100
         * @tc.number SUB_IPC_MessageSequence_writeByteArray_0100
         * @tc.desc   test MessageSequence writeByteArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100
         * @tc.number SUB_IPC_MessageSequence_writeIntArray_readIntArray_0100
         * @tc.desc   test MessageSequence writeIntArray and readIntArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200
         * @tc.number SUB_IPC_MessageSequence_writeIntArray_readIntArray_0200
         * @tc.desc   test MessageSequence writeIntArray and readIntArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100
         * @tc.number SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0100
         * @tc.desc   test MessageSequence writeDoubleArray and readDoubleArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200
         * @tc.number SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_0200
         * @tc.desc   test MessageSequence writeDoubleArray and readDoubleArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100
         * @tc.number SUB_IPC_MessageSequence_writeStringArray_readStringArray_0100
         * @tc.desc   test MessageSequence writeStringArray and readStringArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200
         * @tc.number SUB_IPC_MessageSequence_writeStringArray_readStringArray_0200
         * @tc.desc   test MessageSequence writeStringArray and readStringArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100
         * @tc.number SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0100
         * @tc.desc   test MessageSequence writeBooleanArray and readBooleanArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200
         * @tc.number SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_0200
         * @tc.desc   test MessageSequence writeBooleanArray and readBooleanArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100
         * @tc.number SUB_IPC_MessageSequence_writeParcelable_readParcelable_0100
         * @tc.desc   test MessageSequence writeParcelable and readParcelable
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100
         * @tc.number SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray_0100
         * @tc.desc   test MessageSequence writeParcelableArray and readParcelableArray
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_int32_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer with int32
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer and readRawDataBuffer with int32
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_uint8_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer with uint8
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer and readRawDataBuffer with uint8
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_int8_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer with int8
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer and readRawDataBuffer with int8
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_float32_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer with float32
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer and readRawDataBuffer with float32
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_Ashmem_create_0100
         * @tc.number SUB_IPC_Ashmem_create_0100
         * @tc.desc   test create Ashmem
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_Ashmem_getAshmemSize_0100
         * @tc.number SUB_IPC_Ashmem_getAshmemSize_0100
         * @tc.desc   test Ashmem getAshmemSize
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100
         * @tc.number SUB_IPC_MessageSequence_writeAshmem_Ashmem_0100
         * @tc.desc   test MessageSequence writeAshmem Ashmem
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100
         * @tc.number SUB_IPC_MessageSequence_writeAshmem_readAshmem_0100
         * @tc.desc   test MessageSequence writeAshmem and readAshmem
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageOption_create_0100
         * @tc.number SUB_IPC_MessageOption_create_0100
         * @tc.desc   test MessageOption create
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageOption_create_one_value_0100
         * @tc.number SUB_IPC_MessageOption_create_one_value_0100
         * @tc.desc   test MessageOption create with ont input
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageOption_isAsync_0100
         * @tc.number SUB_IPC_MessageOption_isAsync_0100
         * @tc.desc   test MessageOption is async
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageOption_isAsync_false_0100
         * @tc.number SUB_IPC_MessageOption_isAsync_false_0100
         * @tc.desc   test MessageOption is async false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_Ashmem_create_with_other_ashmem_0100
         * @tc.number SUB_IPC_Ashmem_create_with_other_ashmem_0100
         * @tc.desc   test create Ashmem with other ashmem
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_Ashmem_mapReadWriteAshmem_0100
         * @tc.number SUB_IPC_Ashmem_mapReadWriteAshmem_0100
         * @tc.desc   test create Ashmem with other ashmem
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_IPCSkeleton_getCallingPid_0100
         * @tc.number SUB_IPC_IPCSkeleton_getCallingPid_0100
         * @tc.desc   test IPCSkeleton getCallingPid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_IPCSkeleton_getCallingUid_0100
         * @tc.number SUB_IPC_IPCSkeleton_getCallingUid_0100
         * @tc.desc   test IPCSkeleton getCallingUid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_IPCSkeleton_getCallingTokenId_0100
         * @tc.number SUB_IPC_IPCSkeleton_getCallingTokenId_0100
         * @tc.desc   test IPCSkeleton getCallingTokenId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRemoteObject_0100
         * @tc.number SUB_IPC_MessageSequence_writeRemoteObject_0100
         * @tc.desc   test MessageSequence writeRemoteObject
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100
         * @tc.number SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject_0100
         * @tc.desc   test MessageSequence writeRemoteObject and readRemoteObject
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_readFileDescriptor_0100
         * @tc.number SUB_IPC_MessageSequence_readFileDescriptor_0100
         * @tc.desc   test MessageSequence readFileDescriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeFileDescriptor_0100
         * @tc.number SUB_IPC_MessageSequence_writeFileDescriptor_0100
         * @tc.desc   test MessageSequence writeFileDescriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_closeFileDescriptor_0100
         * @tc.number SUB_IPC_MessageSequence_closeFileDescriptor_0100
         * @tc.desc   test MessageSequence closeFileDescriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_0100
         * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_0100
         * @tc.desc   test RemoteObject sendMessageRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_IPC_RemoteObject_sendMessageRequest_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(2000);
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
                    })
                    .finally(() => {
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
         * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_0200
         * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_0200
         * @tc.desc   test RemoteObject sendMessageRequest SYNC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("SUB_IPC_RemoteObject_sendMessageRequest_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(2000);
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
         * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_0300
         * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_0300
         * @tc.desc   test RemoteObject sendMessageRequest ASYNC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_0400
         * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_0400
         * @tc.desc   test RemoteObject sendMessageRequest SYNC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100
         * @tc.number SUB_IPC_RemoteObject_sendMessageRequest_Callback_0100
         * @tc.desc   test RemoteObject sendMessageRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
                await Utils.msSleep(1000);

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
         * @tc.name   SUB_IPC_RemoteObject_getDescriptor_0100
         * @tc.number SUB_IPC_RemoteObject_getDescriptor_0100
         * @tc.desc   test RemoteObject getDescriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteObject_getCallingPid_0100
         * @tc.number SUB_IPC_RemoteObject_getCallingPid_0100
         * @tc.desc   test RemoteObject getCallingPid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteObject_getCallingUid_0100
         * @tc.number SUB_IPC_RemoteObject_getCallingUid_0100
         * @tc.desc   test RemoteObject getCallingUid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_registerDeathRecipient_0100
         * @tc.number SUB_IPC_registerDeathRecipient_0100
         * @tc.desc   test registerDeathRecipient
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_registerDeathRecipient_0200
         * @tc.number SUB_IPC_registerDeathRecipient_0200
         * @tc.desc   test registerDeathRecipient
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_0100
         * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_0100
         * @tc.desc   test RemoteProxy SendMessageRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100
         * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0100
         * @tc.desc   test RemoteProxy SendMessageRequest after write and read Proxy
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200
         * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead_0200
         * @tc.desc   test RemoteProxy SendMessageRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100
         * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0100
         * @tc.desc   test RemoteProxy SendMessageRequest  callback after write and read Proxy
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200
         * @tc.number SUB_IPC_RemoteProxy_SendMessageRequest_Callback_0200
         * @tc.desc   test RemoteProxy SendMessageRequest  callback after write and read Proxy
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteProxy_IsObjectDead_0100
         * @tc.number SUB_IPC_RemoteProxy_IsObjectDead_0100
         * @tc.desc   test RemoteProxy IsObjectDead
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteProxy_getDescriptor_0100
         * @tc.number SUB_IPC_RemoteProxy_getDescriptor_0100
         * @tc.desc   test RemoteProxy getDescriptor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_RemoteProxy_getDescriptor_0200
         * @tc.number SUB_IPC_RemoteProxy_getDescriptor_0200
         * @tc.desc   test RemoteProxy getDescriptor RemoteProxy
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_IRemoteBroker_asObject_0100
         * @tc.number SUB_IPC_IRemoteBroker_asObject_0100
         * @tc.desc   test asObject
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeRemoteObject_ErrorCode_0100
         * @tc.desc   test writeRemoteObject errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readRemoteObject_ErrorCode_0100
         * @tc.desc   test readRemoteObject errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0100
         * @tc.desc   test writeInterfaceToken errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200
         * @tc.number SUB_IPC_MessageSequence_writeInterfaceToken_ErrorCode_0200
         * @tc.desc   test RemoteProxy SendMessageRequest after write and read Proxy
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readInterfaceToken_ErrorCode_0100
         * @tc.desc   test readInterfaceToken errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_setCapacity_ErrorCode_0100
         * @tc.desc   test setCapacity errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeNoException_ErrorCode_0100
         * @tc.desc   test writeNoException errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readException_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readException_ErrorCode_0100
         * @tc.desc   test readException errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeInt_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeInt_ErrorCode_0100
         * @tc.desc   test writeInt errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readInt_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readInt_ErrorCode_0100
         * @tc.desc   test readInt errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeLong_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeLong_ErrorCode_0100
         * @tc.desc   test writeLong errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readLong_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readLong_ErrorCode_0100
         * @tc.desc   test readLong errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeBoolean_ErrorCode_0100
         * @tc.desc   test writeBoolean errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readBoolean_ErrorCode_0100
         * @tc.desc   test readBoolean errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeString_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeString_ErrorCode_0100
         * @tc.desc   test writeString errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readString_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readString_ErrorCode_0100
         * @tc.desc   test readString errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeParcelable_ErrorCode_0100
         * @tc.desc   test writeParcelable errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readParcelable_ErrorCode_0100
         * @tc.desc   test readParcelable errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeIntArray_ErrorCode_0100
         * @tc.desc   test writeIntArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readIntArray_ErrorCode_0100
         * @tc.desc   test readIntArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200
         * @tc.number SUB_IPC_MessageSequence_readIntArray_ErrorCode_0200
         * @tc.desc   test readIntArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeDoubleArray_ErrorCode_0100
         * @tc.desc   test writeDoubleArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0100
         * @tc.desc   test readDoubleArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200
         * @tc.number SUB_IPC_MessageSequence_readDoubleArray_ErrorCode_0200
         * @tc.desc   test readDoubleArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeBooleanArray_ErrorCode_0100
         * @tc.desc   test writeBooleanArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0100
         * @tc.desc   test readBooleanArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200
         * @tc.number SUB_IPC_MessageSequence_readBooleanArray_ErrorCode_0200
         * @tc.desc   test readBooleanArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeStringArray_ErrorCode_0100
         * @tc.desc   test writeStringArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readStringArray_ErrorCode_0100
         * @tc.desc   test readStringArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200
         * @tc.number SUB_IPC_MessageSequence_readStringArray_ErrorCode_0200
         * @tc.desc   test readStringArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeParcelableArray_ErrorCode_0100
         * @tc.desc   test writeParcelableArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readParcelableArray_ErrorCode_0100
         * @tc.desc   test readParcelableArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeByteArray_ErrorCode_0100
         * @tc.desc   test writeByteArray errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeAshmem_ErrorCode_0100
         * @tc.desc   test MessageSequence writeAshmem Ashmem errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readAshmem_ErrorCode_0100
         * @tc.desc   test MessageSequence writeAshmem Ashmem errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeRawDataBuffer_ErrorCode_0100
         * @tc.desc   test MessageSequence writeRawDataBuffer errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readRawDataBuffer_ErrorCode_0100
         * @tc.desc   test MessageSequence readRawDataBuffer errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_readFileDescriptor_ErrorCode_0100
         * @tc.desc   test MessageSequence readFileDescriptor errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0100
         * @tc.desc   test MessageSequence writeFileDescriptor errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200
         * @tc.number SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0200
         * @tc.desc   test MessageSequence writeFileDescriptor errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300
         * @tc.number SUB_IPC_MessageSequence_writeFileDescriptor_ErrorCode_0300
         * @tc.desc   test MessageSequence writeFileDescriptor errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
         * @tc.name   SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100
         * @tc.number SUB_IPC_MessageSequence_closeFileDescriptor_ErrorCode_0100
         * @tc.desc   test MessageSequence closeFileDescriptor errCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
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
    })
}