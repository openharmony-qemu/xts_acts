import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { huks } from '@kit.UniversalKeystoreKit';
import libHuks from 'libhuks.so';

export async function CheckSoftware() {
  let dsaAlias = "useDsaToCheckSoftware";
  let dsaOptions: huks.HuksOptions = {
    properties: [
      { tag: huks.HuksTag.HUKS_TAG_ALGORITHM, value: huks.HuksKeyAlg.HUKS_ALG_DSA },
      { tag: huks.HuksTag.HUKS_TAG_KEY_SIZE, value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024 },
      { tag: huks.HuksTag.HUKS_TAG_PURPOSE, value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN }
    ]
  };
  try {
    await huks.generateKeyItem(dsaAlias, dsaOptions);
    await huks.deleteKeyItem(dsaAlias, dsaOptions);
    return true;
  } catch (err) {
    return false;
  }
}

export default function HuksSignVerifyDsaTest() {
  describe('HuksSignVerifyDsaTest', () => {
    let useSoftware = false;
    beforeAll(async () => {
      useSoftware = await CheckSoftware();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_DSA_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_DSA_0100
     * @tc.desc   alg-DSA pur-Sign-verify dig-SHA1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_DSA_0100', Level.LEVEL0, () => {
      if (useSoftware) {
        const result = libHuks.HuksSignVerifyDsaTest(0);
        expect(result).assertEqual(0);
      }
    })
  })
}
