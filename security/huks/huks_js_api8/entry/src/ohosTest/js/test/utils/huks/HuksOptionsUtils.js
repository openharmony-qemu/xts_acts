/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import huks from '@ohos.security.huks';
import { GetDataBySize, StringToUint8Array } from '../common/CommonUtils';
import { Logger } from '../common/logger';

export function GenParam(paramTag              , paramValue                                        )                 {
  return {
    tag: paramTag,
    value: paramValue
  }                  ;
}

export function SetInData(huksOptions                  , inData            )                   {
  huksOptions.inData = inData;
  return huksOptions;
}

export function SetParam(huksOptions                  , paramTag              , paramValue                                        )                   {
  let properties                        = huksOptions.properties                         ;
  DeleteParam(huksOptions, paramTag);
  properties.push(GenParam(paramTag, paramValue));
  return huksOptions;
}

export function SetMultiParam(huksOptions                  , paramTag              , paramValue                                        )                   {
  let properties                        = huksOptions.properties                         ;
  DeleteParam(huksOptions, paramTag);
  properties.push(GenParam(paramTag, paramValue));
  properties.push(GenParam(paramTag, paramValue));
  return huksOptions;
}

export function GetParam(huksOptions                  , paramTag              )                                                {
  let properties                        = huksOptions.properties                         ;
  for (let i = 0; i < properties.length; i++) {
    if (properties[i].tag == paramTag) {
      return properties[i].tag;
    }
  }
  return null;
}

export function AddParam(huksOptions                  , paramTag              , paramValue                                        )                   {
  let properties                        = huksOptions.properties                         ;
  properties.push(GenParam(paramTag, paramValue));
  return huksOptions;
}

export function DeleteParam(huksOptions                  , paramTag              )                   {
  let properties                        = huksOptions.properties                         ;
  for (let i = properties.length - 1; i >= 0; i--) {
    if (properties[i].tag == paramTag) {
      properties.splice(i, 1);
    }
  }
  return huksOptions;
}

export function MergeOptions(huksOptions                  , ...huksOptionsAddArr                         )                   {
  for (let i = 0; i < huksOptionsAddArr.length; i++) {
    let properties                        = huksOptionsAddArr[i].properties                         ;
    for (let j = 0; j < properties.length; j++) {
      SetParam(huksOptions, properties[j].tag, properties[j].value);
    }
    if (huksOptionsAddArr[i].inData) {
      huksOptions.inData = huksOptionsAddArr[i].inData;
    }
  }
  return huksOptions;
}

export function PrintOptions(huksOptions                  ) {
  let properties                        = huksOptions.properties                         ;
  for (let i = 0; i < properties.length; i++) {
    Logger.info(`[${i}] tag: ${properties[i].tag}, value: ${properties[i].value}`);
  }
  Logger.info(`inData length: ${huksOptions.inData ? huksOptions.inData.length : 0}, data: ${huksOptions.inData}`);
}

export function GetEmptyOptions() {
  let huksOptions                   = {
    properties: []
  }
  return huksOptions;
}

export function CopyHuksOptions(huksOptions                  )                   {
  let copyOne                   = {
    properties: [],
    inData: new Uint8Array
  }
  if (huksOptions?.properties) {
    for (let param of huksOptions?.properties) {
      if (param.value instanceof Uint8Array) {
        copyOne?.properties?.push({
          tag: param?.tag,
          value: new Uint8Array(param?.value)
        })
      } else {
        copyOne?.properties?.push({
          tag: param.tag,
          value: param.value
        })
      }
    }
  }
  if (huksOptions?.inData) {
    copyOne.inData = new Uint8Array(huksOptions?.inData)
  }
  return copyOne
}

export async function CheckSoftware() {
  let dsaAlias = "useDsaToCheckSoftware";
  let dsaOptions                   = {
    properties: [
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DSA),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN)
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

export async function ClearAllKeys() {
  let storageLevels                                   = [
    huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_DE,
    huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_CE,
    huks.HuksAuthStorageLevel.HUKS_AUTH_STORAGE_LEVEL_ECE
  ]
  let huksOptions                   = GetEmptyOptions();
  try {
    for (let i = 0; i < storageLevels.length; i++) {
      SetParam(huksOptions, huks.HuksTag.HUKS_TAG_AUTH_STORAGE_LEVEL, storageLevels[i]);
      let keyAliases = await huks.listAliases(huksOptions);
      for (let j = 0; j < keyAliases.keyAliases.length; j++) {
        await huks.deleteKeyItem(keyAliases.keyAliases[j], huksOptions);
      }
    }
  } catch (err) {
    Logger.error(`ClearAllKeys catch error ${JSON.stringify(err)}`)
  }
}