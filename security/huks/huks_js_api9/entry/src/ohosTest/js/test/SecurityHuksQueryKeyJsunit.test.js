import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium' ;
import huks from '@ohos.security.huks';
import * as huksCallBack from './utils/param/huksCallback'


export default function SecurityHuksQueryKeyJsunit(){
    let huksProperties;
    let huksOptions;

    describe('SecurityHuksQueryKeyJsunit', function () {
        beforeEach(() => {
            huksProperties = new Array();
            let index = 0;
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                value: huks.HuksKeyAlg.HUKS_ALG_AES
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_PADDING,
                value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
            };
            huksProperties[index++] = {
                tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
                value: huks.HuksCipherMode.HUKS_MODE_CBC
            };
            huksOptions = {
                properties: huksProperties
            };
        })

        /**
         * @tc.number SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0200
         * @tc.name SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0200
         * @tc.desc test hasKeyItem, key not exist, return false
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async function (done) {
                const srcKeyAlias = 'SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0200';
                try {
                    let res = await huks.hasKeyItem(srcKeyAlias, huksOptions);
                    expect(res).assertEqual(false);
                } catch (err) {
                    console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
                    expect(null).assertFail();
                }
                done();
            });
        
        /**
         * @tc.number SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210
         * @tc.name SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210
         * @tc.desc test hasKeyItem, key not exist, return false
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level3
         */
        it('SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async function (done) {
                const srcKeyAlias = 'SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0210';
                try {
                    await huksCallBack.hasKeyItem(srcKeyAlias, huksOptions);
                } catch (err) {
                    console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
                    expect(null).assertFail();
                }
                done();
            });

        /**
         * @tc.number SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0300
         * @tc.name SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0300
         * @tc.desc test hasKeyItem, key not exist, return false
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level3
         */
        it('SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async function (done) {
                const srcKeyAlias = 'SUB_Security_HUKS_QueryKey_hasKey_API11_Func_0300';
                try {
                    await huks.generateKeyItem(srcKeyAlias, huksOptions);
                    await huks.deleteKeyItem(srcKeyAlias, huksOptions);
                    let res = await huks.hasKeyItem(srcKeyAlias, huksOptions);
                    expect(res).assertEqual(false);
                } catch (err) {
                    console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
                    expect(null).assertFail();
                }
                done();
            });

        /**
         * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0100
         * @tc.name SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0100
         * @tc.desc test isKeyItemExist
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level1
         */
        it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                const srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0100';
                try {
                    await huks.generateKeyItem(srcKeyAlias, huksOptions);
                    let res = await huks.isKeyItemExist(srcKeyAlias, huksOptions);
                    expect(res).assertEqual(true);
                } catch (err) {
                    console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
                    expect(null).assertFail();
                }
                done();
            });
        
        /**
         * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0200
         * @tc.name SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0200
         * @tc.desc test isKeyItemExist, key not exist, err.code 12000011
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level2
         */
        it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async function (done) {
                const srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0200';
                try {
                    await huks.isKeyItemExist(srcKeyAlias, huksOptions);
                } catch (err) {
                    console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
                    expect(err.code).assertEqual(12000011);
                }
                done();
            });

         /**
         * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0300
         * @tc.name SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0300
         * @tc.desc test isKeyItemExist, key not exist, err.code 12000011
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level3
         */
        it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async function (done) {
                const srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0300';
                try {
                    await huks.generateKeyItem(srcKeyAlias, huksOptions);
                    await huks.deleteKeyItem(srcKeyAlias, huksOptions);
                    await huks.isKeyItemExist(srcKeyAlias, huksOptions);
                } catch (err) {
                    console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
                    expect(err.code).assertEqual(12000011);
                }
                done();
            });
        
        /**
         * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0110
         * @tc.name SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0110
         * @tc.desc test isKeyItemExist
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level3
         */
        it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async function (done) {
                const srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0110';
                try {
                    await huksCallBack.generateKeyItem(srcKeyAlias, huksOptions);
                    let res = await huksCallBack.isKeyItemExist(srcKeyAlias, huksOptions)
                    expect(res).assertEqual(true);
                } catch (err) {
                    console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
                    expect(null).assertFail();
                }
                done();
            });

        /**
         * @tc.number SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0210
         * @tc.name SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0210
         * @tc.desc test isKeyItemExist, key not exist, err.code 12000011
         * @tc.size Medium
         * @tc.type Func
         * @tc.level Level3
         */
        it('SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async function (done) {
                const srcKeyAlias = 'SUB_Security_HUKS_QueryKey_IsKeyExist_API9_Func_0210';
                try {
                    await huksCallBack.isKeyItemExist(srcKeyAlias, huksOptions)
                } catch (err) {
                    console.error(srcKeyAlias + `: fail, err: ${JSON.stringify(err)}`);
                    expect(err.code).assertEqual(12000011);
                }
                done();
            });
    });
}