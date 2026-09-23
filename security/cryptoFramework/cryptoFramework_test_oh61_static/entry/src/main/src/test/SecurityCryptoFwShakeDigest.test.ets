'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import cryptoFramework from '@ohos.security.cryptoFramework';
import { BusinessError } from '@ohos.base';
import { createDataSync, compareDataBlob, stringToUint8Array } from './utils/common/commonUtils';
import { shakeVectors, numberArrayToUint8Array } from './utils/vectors/vectors';

export default function SecurityCryptoFwShakeDigestTestUnit() {
  describe('SecurityCryptoFwShakeDigestTestUnit', () => {

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Vector_Func_0100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Vector_Func_0100
     * @tc.desc   SHAKE128和SHAKE256-NIST标准向量验证空输入和abc输入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Vector_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        for (let vector of shakeVectors) {
          let algName: string = vector.algName;
          for (let data of vector.shakeVectorSpec) {
            let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
            expect(md.algName).assertEqual(algName);
            let plainText: cryptoFramework.DataBlob = { data: stringToUint8Array(data.plainText) };
            if (data.plainText.length > 0) {
              md.updateSync(plainText);
            }
            let output: cryptoFramework.DataBlob = md.squeezeSync(data.outputLength);
            expect(output.data.length).assertEqual(data.outputLength);
            let expected: Uint8Array = numberArrayToUint8Array(data.expectDigest);
            let expectedBlob: cryptoFramework.DataBlob = { data: expected };
            expect(compareDataBlob(output, expectedBlob)).assertTrue();
          }
        }
      } catch (error) {
        console.error(`MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Prefix_Func_0100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Prefix_Func_0100
     * @tc.desc   SHAKE128和SHAKE256-XOF前缀一致性验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Prefix_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // SHAKE128: squeeze(32) 应为 squeeze(64) 的前 32 字节
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md1.updateSync(input);
        let out32: cryptoFramework.DataBlob = md1.squeezeSync(32);
        let md2: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md2.updateSync(input);
        let out64: cryptoFramework.DataBlob = md2.squeezeSync(64);
        expect(out32.data.length).assertEqual(32);
        expect(out64.data.length).assertEqual(64);
        let prefix32: cryptoFramework.DataBlob = { data: out64.data.subarray(0, 32) };
        expect(compareDataBlob(out32, prefix32)).assertTrue();

        // SHAKE256: squeeze(64) 应为 squeeze(96) 的前 64 字节
        let md3: cryptoFramework.Md = cryptoFramework.createMd('SHAKE256');
        md3.updateSync(input);
        let out64_256: cryptoFramework.DataBlob = md3.squeezeSync(64);
        let md4: cryptoFramework.Md = cryptoFramework.createMd('SHAKE256');
        md4.updateSync(input);
        let out96_256: cryptoFramework.DataBlob = md4.squeezeSync(96);
        expect(out64_256.data.length).assertEqual(64);
        expect(out96_256.data.length).assertEqual(96);
        let prefix64: cryptoFramework.DataBlob = { data: out96_256.data.subarray(0, 64) };
        expect(compareDataBlob(out64_256, prefix64)).assertTrue();
      } catch (error) {
        console.error(`MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Async_Func_0100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Async_Func_0100
     * @tc.desc   SHAKE128和SHAKE256-Promise形式squeeze输出可变长度摘要并验证algName和getMdLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Async_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // SHAKE128 Promise
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        expect(md1.algName).assertEqual('SHAKE128');
        try {
          md1.getMdLength();
          expect(null).assertFail();
        } catch (error) {
          console.error(`MdShake "${error}", error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
        }
        // SHAKE256 Promise
        let md2: cryptoFramework.Md = cryptoFramework.createMd('SHAKE256');
        expect(md2.algName).assertEqual('SHAKE256');
        try {
          md2.getMdLength();
          expect(null).assertFail();
        } catch (error) {
          console.error(`MdShake "${error}", error code: ${(error as BusinessError).code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
        }
      } catch (error) {
        console.error(`MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Sync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Sync_Func_0100
     * @tc.desc   SHAKE128和SHAKE256-Sync形式squeezeSync输出可变长度摘要
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Sync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // SHAKE128 Sync
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        expect(md1.algName).assertEqual('SHAKE128');
        let input1: cryptoFramework.DataBlob = { data: createDataSync(32) };
        md1.updateSync(input1);
        let out1: cryptoFramework.DataBlob = md1.squeezeSync(64);
        expect(out1.data.length).assertEqual(64);

        // SHAKE256 Sync
        let md2: cryptoFramework.Md = cryptoFramework.createMd('SHAKE256');
        expect(md2.algName).assertEqual('SHAKE256');
        let input2: cryptoFramework.DataBlob = { data: createDataSync(64) };
        md2.updateSync(input2);
        let out2: cryptoFramework.DataBlob = md2.squeezeSync(128);
        expect(out2.data.length).assertEqual(128);
      } catch (error) {
        console.error(`MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Boundary_Func_0100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Boundary_Func_0100
     * @tc.desc   SHAKE128和SHAKE256边界值squeeze输出最大长度65536字节和大数据1KB输入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Boundary_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // SHAKE128 最大输出长度 65536
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md1.updateSync(input);
        let out1: cryptoFramework.DataBlob = md1.squeezeSync(65536);
        expect(out1.data.length).assertEqual(65536);

        // SHAKE128 大数据输入 1KB
        let md2: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        let bigInput: cryptoFramework.DataBlob = { data: new Uint8Array(1024).fill(0x41) };
        md2.updateSync(bigInput);
        let out2: cryptoFramework.DataBlob = md2.squeezeSync(64);
        expect(out2.data.length).assertEqual(64);

        // SHAKE256 最大输出长度 65536
        let md3: cryptoFramework.Md = cryptoFramework.createMd('SHAKE256');
        md3.updateSync(input);
        let out3: cryptoFramework.DataBlob = md3.squeezeSync(65536);
        expect(out3.data.length).assertEqual(65536);
      } catch (error) {
        console.error(`MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Normal_Func_0100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Normal_Func_0100
     * @tc.desc   SHAKE128和SHAKE256稳定性多次分段update后squeeze输出
     * @tc.type   RELIABILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Normal_Func_0100",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let messageLen: int = 64;
        let blockSize: int = 20;
        let message: cryptoFramework.DataBlob = { data: createDataSync(messageLen) };

        // SHAKE128: 分段 update vs 一次性 update
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md1.updateSync(message);
        let outOnce: cryptoFramework.DataBlob = md1.squeezeSync(128);

        let md2: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        let msgLen: int = message.data.byteLength as int;
        let iterate: int = (Math.floor(msgLen / blockSize)).toInt();
        let rem: int = msgLen % blockSize;
        for (let i = 0; i < iterate; i++) {
          let chunk: cryptoFramework.DataBlob = { data: message.data.subarray(blockSize * i, blockSize * (i + 1)) };
          md2.updateSync(chunk);
        }
        if (rem > 0) {
          let chunk: cryptoFramework.DataBlob = { data: message.data.subarray(blockSize * iterate, msgLen) };
          md2.updateSync(chunk);
        }
        let outSplit: cryptoFramework.DataBlob = md2.squeezeSync(128);
        expect(compareDataBlob(outOnce, outSplit)).assertTrue();

        // SHAKE256: 分段 update vs 一次性 update
        let md3: cryptoFramework.Md = cryptoFramework.createMd('SHAKE256');
        md3.updateSync(message);
        let outOnce256: cryptoFramework.DataBlob = md3.squeezeSync(128);

        let md4: cryptoFramework.Md = cryptoFramework.createMd('SHAKE256');
        for (let i = 0; i < iterate; i++) {
          let chunk: cryptoFramework.DataBlob = { data: message.data.subarray(blockSize * i, blockSize * (i + 1)) };
          md4.updateSync(chunk);
        }
        if (rem > 0) {
          let chunk: cryptoFramework.DataBlob = { data: message.data.subarray(blockSize * iterate, msgLen) };
          md4.updateSync(chunk);
        }
        let outSplit256: cryptoFramework.DataBlob = md4.squeezeSync(128);
        expect(compareDataBlob(outOnce256, outSplit256)).assertTrue();
      } catch (error) {
        console.error(`MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Error_0100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Error_0100
     * @tc.desc   SHAKE128和SHAKE256-squeeze多种非法length值返回ERR_PARAMETER_CHECK_FAILED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Error_0100",
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // SHAKE128 非法 length
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md1.updateSync(input);
        md1.squeezeSync(31);  // < min 32
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Error_0200
     * @tc.number SUB_Security_CryptoFramework_MdShake_Error_0200
     * @tc.desc   SHAKE128和SHAKE256-XOF算法不支持digestSync返回ERR_INVALID_CALL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Error_0200",
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // SHAKE128 XOF 算法不支持 digestSync
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md1.updateSync(input);
        md1.digestSync();
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Error_0300
     * @tc.number SUB_Security_CryptoFramework_MdShake_Error_0300
     * @tc.desc   SHA256和SM3非XOF算法调用squeeze返回ERR_INVALID_CALL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Error_0300",
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // SHA256 非 XOF 算法不支持 squeeze
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHA256');
        md1.updateSync(input);
        md1.squeezeSync(32);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Error_1100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Error_1100
     * @tc.desc   SHAKE128-squeeze后重复调用squeeze和digestSync返回ERR_INVALID_CALL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Error_1100",
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        let md: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md.updateSync(input);
        let out: cryptoFramework.DataBlob = md.squeezeSync(64);
        expect(out.data.length).assertEqual(64);

        // squeeze 后重复 squeeze
        md.squeezeSync(64);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Error_1200
     * @tc.number SUB_Security_CryptoFramework_MdShake_Error_1200
     * @tc.desc   SHAKE128-squeeze后调用update返回ERR_INVALID_CALL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Error_1200",
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        let md: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md.updateSync(input);
        let out: cryptoFramework.DataBlob = md.squeezeSync(64);
        expect(out.data.length).assertEqual(64);

        // squeeze 后调用 update
        md.updateSync(input);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_INVALID_CALL);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Reinforcement_Func_0100
     * @tc.number SUB_Security_CryptoFramework_MdShake_Reinforcement_Func_0100
     * @tc.desc   squeezeSync传入非法length值0和负数注入测试
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Reinforcement_Func_0100",
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // 传入 0 (小于最小长度32)
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md1.updateSync(input);
        md1.squeezeSync(0);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }

      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // 传入负数
        let md2: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md2.updateSync(input);
        md2.squeezeSync(-1);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_MdShake_Reinforcement_Func_0200
     * @tc.number SUB_Security_CryptoFramework_MdShake_Reinforcement_Func_0200
     * @tc.desc   squeeze传入非法length值0和负数异步注入测试
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_CryptoFramework_MdShake_Reinforcement_Func_0200",
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // 传入 0 (小于最小长度32)
        let md1: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md1.updateSync(input);
        await md1.squeeze(0);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }

      try {
        let input: cryptoFramework.DataBlob = { data: stringToUint8Array('abc') };

        // 传入负数
        let md2: cryptoFramework.Md = cryptoFramework.createMd('SHAKE128');
        md2.updateSync(input);
        await md2.squeeze(-1);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] MdShake "${error}", error code: ${(error as BusinessError).code}`);
        expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });
  });
}
