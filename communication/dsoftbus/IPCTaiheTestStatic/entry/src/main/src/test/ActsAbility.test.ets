import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from "@ohos.base"
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import rpc from "@ohos.rpc";
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

class MyDeathRecipient implements rpc.DeathRecipient {
    onRemoteDied(): void {
        hilog.info(domain, tag, '%{public}s', 'into onRemoteDied');
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

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /*
         * @tc.number: SUB_IPC_MessageSequence_WriteInt_ReadInt
         * @tc.name: SUB_IPC_MessageSequence_WriteInt_ReadInt
         * @tc.desc: test MessageSequence WriteInt and ReadInt
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_WriteInt_ReadInt", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_WriteInt_ReadInt --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input = 123;
                data.writeInt(input);
                let res = data.readInt();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInt_ReadInt error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInt_ReadInt reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_WriteInt_ReadInt --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken
         * @tc.name: SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken
         * @tc.desc: test MessageSequence WriteInterfaceToken and ReadInterfaceToken
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input = "this is interfaceToken";
                data.writeInterfaceToken(input);
                let res = data.readInterfaceToken();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_WriteInterfaceToken_ReadInterfaceToken --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_setCapacity_getCapacity
         * @tc.name: SUB_IPC_MessageSequence_setCapacity_getCapacity
         * @tc.desc: test MessageSequence setCapacity and getCapacity
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_setCapacity_getCapacity", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_setCapacity_getCapacity --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input = 666;
                data.setCapacity(input);
                let res = data.getCapacity();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_getCapacity error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_setCapacity_getCapacity reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_setCapacity_getCapacity --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeNoException_readException
         * @tc.name: SUB_IPC_MessageSequence_writeNoException_readException
         * @tc.desc: test MessageSequence writeNoException and readException
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeNoException_readException", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeNoException_readException --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                data.writeNoException();
                data.readException();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_readException error is: ' + error)
                expect(error != null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeNoException_readException reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeNoException_readException --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeLong_readLong
         * @tc.name: SUB_IPC_MessageSequence_writeLong_readLong
         * @tc.desc: test MessageSequence writeLong and readLong
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeLong_readLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeLong_readLong --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input = 99999999999;
                data.writeLong(input);
                let res = data.readLong();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_readLong error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeLong_readLong reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeLong_readLong --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeBoolean_readBoolean
         * @tc.name: SUB_IPC_MessageSequence_writeBoolean_readBoolean
         * @tc.desc: test MessageSequence writeBoolean and readBoolean
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeBoolean_readBoolean", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBoolean_readBoolean --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input = true;
                data.writeBoolean(input);
                let res = data.readBoolean();
                expect(res).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBoolean_readBoolean --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeBoolean_readBoolean_false
         * @tc.name: SUB_IPC_MessageSequence_writeBoolean_readBoolean_false
         * @tc.desc: test MessageSequence writeBoolean and readBoolean
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeBoolean_readBoolean_false", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBoolean_readBoolean_false --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input = false;
                data.writeBoolean(input);
                let res = data.readBoolean();
                expect(res).assertFalse();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_false error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBoolean_readBoolean_false reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBoolean_readBoolean_false --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeString_readString
         * @tc.name: SUB_IPC_MessageSequence_writeString_readString
         * @tc.desc: test MessageSequence writeString and readString
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeString_readString", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeString_readString --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input = "this is test write and read string";
                data.writeString(input);
                let res = data.readString();
                expect(res == input).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_readString error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeString_readString reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeString_readString --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeByteArray
         * @tc.name: SUB_IPC_MessageSequence_writeByteArray
         * @tc.desc: test MessageSequence writeByteArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeByteArray", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeByteArray --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeByteArray(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeByteArray reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeByteArray --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeIntArray_readIntArray_1
         * @tc.name: SUB_IPC_MessageSequence_writeIntArray_readIntArray_1
         * @tc.desc: test MessageSequence writeIntArray and readIntArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeIntArray_readIntArray_1", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_readIntArray_1 --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeIntArray(input);
                let res = data.readIntArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_1 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_1 reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_readIntArray_1 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeIntArray_readIntArray_2
         * @tc.name: SUB_IPC_MessageSequence_writeIntArray_readIntArray_2
         * @tc.desc: test MessageSequence writeIntArray and readIntArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeIntArray_readIntArray_2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeIntArray_readIntArray_2 --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9];
                data.writeIntArray(input);
                let res: Array<int> = new Array<int>(input.length);
                data.readIntArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_2 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeIntArray_readIntArray_2 reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeIntArray_readIntArray_2 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_1
         * @tc.name: SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_1
         * @tc.desc: test MessageSequence writeDoubleArray and readDoubleArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_1", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_1 --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];
                data.writeDoubleArray(input);
                let res = data.readDoubleArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_1 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_1 reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_1 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_2
         * @tc.name: SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_2
         * @tc.desc: test MessageSequence writeDoubleArray and readDoubleArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_2 --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<double> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];
                data.writeDoubleArray(input);
                let res: Array<double> = new Array<double>(input.length);
                data.readDoubleArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_2 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_2 reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeDoubleArray_readDoubleArray_2 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeStringArray_readStringArray_1
         * @tc.name: SUB_IPC_MessageSequence_writeStringArray_readStringArray_1
         * @tc.desc: test MessageSequence writeStringArray and readStringArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeStringArray_readStringArray_1", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_readStringArray_1 --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<string> = ["this", "is", "a", "test", "stirng", "array"];
                data.writeStringArray(input);
                let res = data.readStringArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_1 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_1 reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_readStringArray_1 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeStringArray_readStringArray_2
         * @tc.name: SUB_IPC_MessageSequence_writeStringArray_readStringArray_2
         * @tc.desc: test MessageSequence writeStringArray and readStringArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeStringArray_readStringArray_2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeStringArray_readStringArray_2 --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<string> = ["this", "is", "a", "test", "stirng", "array"];
                data.writeStringArray(input);
                let res: Array<string> = new Array<string>(input.length);
                data.readStringArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_2 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeStringArray_readStringArray_2 reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeStringArray_readStringArray_2 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_1
         * @tc.name: SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_1
         * @tc.desc: test MessageSequence writeBooleanArray and readBooleanArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_1", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_1 --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<boolean> = [true, false, true, false, true, false, true, false, true, false];
                data.writeBooleanArray(input);
                let res = data.readBooleanArray();
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_1 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_1 reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_1 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_2
         * @tc.name: SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_2
         * @tc.desc: test MessageSequence writeBooleanArray and readBooleanArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_2 --------------------')
            let data =  rpc.MessageSequence.create();
            try {
                let input: Array<boolean> = [false, true, false, true, false, true, false, true, false, true];
                data.writeBooleanArray(input);
                let res: Array<boolean> = new Array<boolean>(input.length);
                data.readBooleanArray(res);
                expect(res).assertDeepEquals(input);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_2 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_2 reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeBooleanArray_readBooleanArray_2 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeParcelable_readParcelable
         * @tc.name: SUB_IPC_MessageSequence_writeParcelable_readParcelable
         * @tc.desc: test MessageSequence writeParcelable and readParcelable
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeParcelable_readParcelable", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelable_readParcelable --------------------')

            let data =  rpc.MessageSequence.create();
            try {
                let parcelable = new MyParcelable(1, "this is a test parcelable");
                data.writeParcelable(parcelable);
                let res: MyParcelable = new MyParcelable(0, "");
                data.readParcelable(res);
                expect(res.num).assertEqual(1);
                expect(res.str).assertEqual("this is a test parcelable");
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_readParcelable error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelable_readParcelable reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelable_readParcelable --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray
         * @tc.name: SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray
         * @tc.desc: test MessageSequence writeParcelableArray and readParcelableArray
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray reclaim done')
                data.reclaim();
            }
            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeParcelableArray_readParcelableArray --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRawDataBuffer_int32
         * @tc.name: SUB_IPC_MessageSequence_writeRawDataBuffer_int32
         * @tc.desc: test MessageSequence writeRawDataBuffer with int32
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_int32", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_int32 --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int32 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int32 reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_int32 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32
         * @tc.name: SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32
         * @tc.desc: test MessageSequence writeRawDataBuffer and readRawDataBuffer with int32
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32 --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32 error is: ' + error)
                expect(error == null).assertTrue();
            }

            try {
                let result = data.readRawDataBuffer(size);
                let readInt32View = new Int32Array(result);
                let assertE = isEqualArrayBuffer(readInt32View, int32View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32 reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int32 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRawDataBuffer_uint8
         * @tc.name: SUB_IPC_MessageSequence_writeRawDataBuffer_uint8
         * @tc.desc: test MessageSequence writeRawDataBuffer with uint8
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_uint8", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_uint8 --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_uint8 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_uint8 reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_uint8 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8
         * @tc.name: SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8
         * @tc.desc: test MessageSequence writeRawDataBuffer and readRawDataBuffer with uint8
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8 --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8 error is: ' + error)
                expect(error == null).assertTrue();
            }

            try {
                let result = data.readRawDataBuffer(size);
                let readUint8View = new Uint8Array(result);
                let assertE = isEqualArrayBuffer(readUint8View, uint8View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8 reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_uint8 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRawDataBuffer_int8
         * @tc.name: SUB_IPC_MessageSequence_writeRawDataBuffer_int8
         * @tc.desc: test MessageSequence writeRawDataBuffer with int8
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_int8", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_int8 --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int8 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_int8 reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_int8 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8
         * @tc.name: SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8
         * @tc.desc: test MessageSequence writeRawDataBuffer and readRawDataBuffer with int8
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8 --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8 error is: ' + error)
                expect(error == null).assertTrue();
            }

            try {
                let result = data.readRawDataBuffer(size);
                let readInt8View = new Uint8Array(result);
                let assertE = isEqualArrayBuffer(readInt8View, int8View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8 reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_int8 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRawDataBuffer_float32
         * @tc.name: SUB_IPC_MessageSequence_writeRawDataBuffer_float32
         * @tc.desc: test MessageSequence writeRawDataBuffer with float32
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_float32", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_float32 --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_float32 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_float32 reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_float32 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32
         * @tc.name: SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32
         * @tc.desc: test MessageSequence writeRawDataBuffer and readRawDataBuffer with float32
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32 --------------------')

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
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32 error is: ' + error)
                expect(error == null).assertTrue();
            }

            try {
                let result = data.readRawDataBuffer(size);
                let readFloat32View = new Float32Array(result);
                let assertE = isEqualArrayBuffer(readFloat32View, float32View);
                expect(assertE).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32 error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32 reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRawDataBuffer_readRawDataBuffer_float32 --------------------')
        });

        /*
         * @tc.number: SUB_IPC_Ashmem_create
         * @tc.name: SUB_IPC_Ashmem_create
         * @tc.desc: test create Ashmem
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_Ashmem_create", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_create --------------------')

            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_create --------------------')
        });

        /*
         * @tc.number: SUB_IPC_Ashmem_getAshmemSize
         * @tc.name: SUB_IPC_Ashmem_getAshmemSize
         * @tc.desc: test Ashmem getAshmemSize
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_Ashmem_getAshmemSize", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_getAshmemSize --------------------')

            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                let size = ashmem.getAshmemSize();
                expect(size == 1024 * 1024).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_getAshmemSize error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_getAshmemSize finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_getAshmemSize --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeAshmem_Ashmem
         * @tc.name: SUB_IPC_MessageSequence_writeAshmem_Ashmem
         * @tc.desc: test MessageSequence writeAshmem Ashmem
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeAshmem_Ashmem", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeAshmem_Ashmem --------------------')

            let data = rpc.MessageSequence.create();
            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                data.writeAshmem(ashmem);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_Ashmem error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_Ashmem reclaim done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeAshmem_Ashmem --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeAshmem_readAshmem
         * @tc.name: SUB_IPC_MessageSequence_writeAshmem_readAshmem
         * @tc.desc: test MessageSequence writeAshmem and readAshmem
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeAshmem_readAshmem", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeAshmem_readAshmem --------------------')

            let data = rpc.MessageSequence.create();
            let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
            try {
                data.writeAshmem(ashmem);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem finally done')
            }

            try {
                let res = data.readAshmem();
                expect(res.getAshmemSize() == ashmem.getAshmemSize()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeAshmem_readAshmem finally done')
                data.reclaim();
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeAshmem_readAshmem --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageOption_create
         * @tc.name: SUB_IPC_MessageOption_create
         * @tc.desc: test MessageOption create
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageOption_create", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create --------------------')

            try {
                let option = new rpc.MessageOption();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageOption_create_one_value
         * @tc.name: SUB_IPC_MessageOption_create_one_value
         * @tc.desc: test MessageOption create with ont input
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageOption_create_one_value", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_create_one_value --------------------')

            try {
                let option = new rpc.MessageOption(true);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_one_value error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_create_one_value finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_create_one_value --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageOption_isAsync
         * @tc.name: SUB_IPC_MessageOption_isAsync
         * @tc.desc: test MessageOption is async
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageOption_isAsync", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_isAsync --------------------')

            try {
                let option = new rpc.MessageOption(true);
                let res = option.isAsync();
                expect(res).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_isAsync --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageOption_isAsync_false
         * @tc.name: SUB_IPC_MessageOption_isAsync_false
         * @tc.desc: test MessageOption is async false
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageOption_isAsync_false", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageOption_isAsync_false --------------------')

            try {
                let option = new rpc.MessageOption(false);
                let res = option.isAsync();
                expect(res).assertFalse();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_false error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageOption_isAsync_false finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageOption_isAsync_false --------------------')
        });

        /*
         * @tc.number: SUB_IPC_Ashmem_create_with_other_ashmem
         * @tc.name: SUB_IPC_Ashmem_create_with_other_ashmem
         * @tc.desc: test create Ashmem with other ashmem
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_Ashmem_create_with_other_ashmem", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_Ashmem_create_with_other_ashmem --------------------')

            try {
                let ashmem = rpc.Ashmem.create("ashmem", 1024 * 1024);
                let newAshmem = rpc.Ashmem.create(ashmem);
                expect(ashmem.getAshmemSize() == newAshmem.getAshmemSize()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_with_other_ashmem error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_Ashmem_create_with_other_ashmem finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_Ashmem_create_with_other_ashmem --------------------')
        });

        /*
         * @tc.number: SUB_IPC_IPCSkeleton_getCallingPid
         * @tc.name: SUB_IPC_IPCSkeleton_getCallingPid
         * @tc.desc: test IPCSkeleton getCallingPid
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_IPCSkeleton_getCallingPid", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingPid --------------------')

            try {
                let callerPid = rpc.IPCSkeleton.getCallingPid();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid callerPid is: ' + callerPid)
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingPid finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingPid --------------------')
        });

        /*
         * @tc.number: SUB_IPC_IPCSkeleton_getCallingUid
         * @tc.name: SUB_IPC_IPCSkeleton_getCallingUid
         * @tc.desc: test IPCSkeleton getCallingUid
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_IPCSkeleton_getCallingUid", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingUid --------------------')

            try {
                let callerUid = rpc.IPCSkeleton.getCallingUid();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid callerUid is: ' + callerUid)
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingUid finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingUid --------------------')
        });

        /*
         * @tc.number: SUB_IPC_IPCSkeleton_getCallingTokenId
         * @tc.name: SUB_IPC_IPCSkeleton_getCallingTokenId
         * @tc.desc: test IPCSkeleton getCallingTokenId
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_IPCSkeleton_getCallingTokenId", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_IPCSkeleton_getCallingTokenId --------------------')

            try {
                let callerTokenId = rpc.IPCSkeleton.getCallingTokenId();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId callerTokenId is: ' + callerTokenId)
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_IPCSkeleton_getCallingTokenId finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_IPCSkeleton_getCallingTokenId --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRemoteObject
         * @tc.name: SUB_IPC_MessageSequence_writeRemoteObject
         * @tc.desc: test MessageSequence writeRemoteObject
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRemoteObject", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRemoteObject --------------------')

            let data =  rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                data.writeRemoteObject(testRemoteObject);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject reclaim done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject --------------------')
        });

        /*
         * @tc.number: SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject
         * @tc.name: SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject
         * @tc.desc: test MessageSequence writeRemoteObject and readRemoteObject
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject --------------------')

            let data =  rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                data.writeRemoteObject(testRemoteObject);
                let res = data.readRemoteObject();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject reclaim done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_MessageSequence_writeRemoteObject_readRemoteObject --------------------')
        });

        /*
         * @tc.number: SUB_IPC_RemoteObject_sendMessageRequest
         * @tc.name: SUB_IPC_RemoteObject_sendMessageRequest
         * @tc.desc: test RemoteObject sendMessageRequest
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_RemoteObject_sendMessageRequest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_sendMessageRequest --------------------')

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let option = new rpc.MessageOption();
                data.writeInt(666);
                testRemoteObject.sendMessageRequest(1, data, reply, option);
                let res = reply.readInt();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest res is: ' + res)
                expect(res == 999).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_sendMessageRequest reclaim done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_sendMessageRequest --------------------')
        });

        /*
         * @tc.number: SUB_IPC_RemoteObject_getDescriptor
         * @tc.name: SUB_IPC_RemoteObject_getDescriptor
         * @tc.desc: test RemoteObject getDescriptor
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_RemoteObject_getDescriptor", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getDescriptor --------------------')

            let data = rpc.MessageSequence.create();
            let reply = rpc.MessageSequence.create();
            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let res = testRemoteObject.getDescriptor();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor res is: ' + res)
                expect(res == "testObject").assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getDescriptor reclaim done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getDescriptor --------------------')
        });

        /*
         * @tc.number: SUB_IPC_RemoteObject_getCallingPid
         * @tc.name: SUB_IPC_RemoteObject_getCallingPid
         * @tc.desc: test RemoteObject getCallingPid
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_RemoteObject_getCallingPid", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getCallingPid --------------------')

            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let res = testRemoteObject.getCallingPid();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid res is: ' + res);
                expect(res == rpc.IPCSkeleton.getCallingPid()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingPid finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getCallingPid --------------------')
        });

        /*
         * @tc.number: SUB_IPC_RemoteObject_getCallingUid
         * @tc.name: SUB_IPC_RemoteObject_getCallingUid
         * @tc.desc: test RemoteObject getCallingUid
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_RemoteObject_getCallingUid", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteObject_getCallingUid --------------------')

            try {
                let testRemoteObject = new TestRemoteObject("testObject");
                let res = testRemoteObject.getCallingUid();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid res is: ' + res);
                expect(res == rpc.IPCSkeleton.getCallingUid()).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteObject_getCallingUid finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getCallingUid --------------------')
        });

        /*
         * @tc.number: SUB_IPC_registerDeathRecipient
         * @tc.name: SUB_IPC_registerDeathRecipient
         * @tc.desc: test registerDeathRecipient
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_registerDeathRecipient", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_registerDeathRecipient --------------------')

            try {
                let deathRecipient = new MyDeathRecipient();
                let samgr = rpc.IPCSkeleton.getContextObject();
                samgr.registerDeathRecipient(deathRecipient, 0);
                samgr.unregisterDeathRecipient(deathRecipient, 0);
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient error is: ' + error)
                expect(error == null).assertTrue();
            } finally {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_registerDeathRecipient finally done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteObject_getCallingUid --------------------')
        });

        /*
         * @tc.number: SUB_IPC_RemoteProxy_SendMessageRequest
         * @tc.name: SUB_IPC_RemoteProxy_SendMessageRequest
         * @tc.desc: test RemoteProxy SendMessageRequest
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_RemoteProxy_SendMessageRequest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest --------------------')

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
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest .then.errCode is: ' + ret.errCode);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest .then.code is: ' + ret.code);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest .then.reply is: ' + ret.reply);
                    }).catch((err) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest err in catch is: ' + err);
                    });
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest reclaim done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest --------------------')
        });

        /*
         * @tc.number: SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead
         * @tc.name: SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead
         * @tc.desc: test RemoteProxy SendMessageRequest after write and read Proxy
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', '-------------------- start SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead --------------------')

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
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead .then.errCode is: ' + ret.errCode);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead .then.code is: ' + ret.code);
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead .then.reply is: ' + ret.reply);
                    }).catch((err) => {
                        hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead err in catch is: ' + err);
                    });
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead error is: ' + error);
                expect(error == null).assertTrue();
            } finally {
                data.reclaim();
                reply.reclaim();
                hilog.info(domain, tag, '%{public}s', 'SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead reclaim done')
            }

            done()
            hilog.info(domain, tag, '%{public}s', '-------------------- end SUB_IPC_RemoteProxy_SendMessageRequest_WriteAndRead --------------------')
        });


    })

}